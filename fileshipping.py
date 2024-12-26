import requests
import json
from datetime import datetime, timedelta
import sys
import subprocess
import re

result2 = r'C:\Users\apriorit\Desktop\ForAcceptance\acceptance result fileshipper.txt'
address = r'C:\Users\apriorit\Desktop\ForAcceptance\sensitive.csv'


def read_csv_to_list(file_path):
    data = []
    try:
        with open(file_path, mode='r', encoding='utf-8') as file:
            data = file.readlines()
    except FileNotFoundError:
        print(f"File not found: {file_path}")
    except Exception as e:
        print(f"An error occurred: {e}")
    return [line.strip() for line in data]  # Remove trailing newline characters


def get_ad_token():
    url = f"https://login.microsoftonline.com/{creds[3]}/oauth2/token"

    payload = {'client_id': f'{creds[4]}',
               'client_secret': f'{creds[5]}',
               'grant_type': 'client_credentials',
               'resource': f'{creds[6]}'}
    files = [

    ]
    headers = {
        'Cookie': f'fpc={creds[7]}'
    }

    response = requests.request("POST", url, headers=headers, data=payload, files=files)

    response_list = response.text.split('"')
    ad_token = response_list[27]
    print('Received AD token')
    return ad_token


def internal_user_token(token):
    url = "https://staging2securemailidentityserver.azurewebsites.net/connect/token"

    payload = 'grant_type=internal_user&mailbox_id=10638298&client_id=frontend_ref_token&region=Staging'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': f'Bearer {token}',
        'Cookie': f'ARRAffinity={creds[9]}'
    }

    response = requests.request("POST", url, headers=headers, data=payload).text
    response_list = response.split('"')
    print('Received internal user token')
    return response_list[3]


def release_email(guid, token):
    url = f"https://staging2securemail.azurewebsites.net/api/quarantine/emails/{guid}/release"

    payload = json.dumps({
        "quarantineId": "12046",
        "quarantineType": "Personal"
    })
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {token}',
        'Cookie': f'ARRAffinity={creds[9]}'
    }

    response = requests.request("POST", url, headers=headers, data=payload).text
    return response


def release_many(ids, token):
    url = "https://staging2securemail.azurewebsites.net/api/quarantine/emails/release"

    payload = json.dumps({
        "guids": [
            f"{ids[0]}",
            f"{ids[1]}"
        ],
        "quarantineId": "12046",
        "quarantineType": "Personal"
    })
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {token}',
        'Cookie': f'ARRAffinity={creds[9]}'
    }

    response = requests.request("POST", url, headers=headers, data=payload).text

    return response


def get_list_and_perform_release(token):
    
    current_time = (datetime.now()).strftime("%Y-%m-%d %H:%M:%S")
    current_time2 = (datetime.now() - timedelta(minutes=30)).strftime("%Y-%m-%d %H:%M:%S")

    url1 = f"https://staging2securemail.azurewebsites.net/api/quarantine/emails/?quarantineId=12046&startDate={current_time2}&finishDate={current_time}&direction=In&QuarantineStatus=InQuarantine"
    
    payload1 = {}
    headers1 = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {token}',
        'Cookie': f'ARRAffinity={creds[9]}'
    }

    url2 = f"https://staging2securemail.azurewebsites.net/api/quarantine/emails/?quarantineId=12046&startDate={current_time2}&finishDate={current_time}&direction=Out&QuarantineStatus=InQuarantine"

    payload2 = {}
    headers2 = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {token}',
        'Cookie': f'ARRAffinity={creds[9]}'
    }
    
    response_in = requests.request("GET", url1, headers=headers1, data=payload1).text
    print('Received inbound quarantine messages list')
    response_out = requests.request("GET", url2, headers=headers2, data=payload2).text
    print('Received outbound quarantine messages list')
    
    guid_pattern = re.compile(r'[a-f0-9\-]{36}', re.IGNORECASE)  # Adjust if GUIDs differ
    subject_pattern = re.compile(r'"Subject":"(.*?)"',re.IGNORECASE)  # Matches "Subject:" followed by text until next GUID or end

    guids_in = guid_pattern.findall(response_in)
    guids_in_final = []

    for element in guids_in:
        if element not in guids_in_final:
            guids_in_final.append(element)
    print(f'Inbound guids to release are:\n{guids_in_final[:3]}\n\nFiltering subjects according to the selected GUIDs')
    
    subjects_in = subject_pattern.findall(response_in)
    subjects_released_inbound = f'\n\nSubjects released inbound:\nSingle inbound - {subjects_in[0]}\nSeveral released:\n1st - {subjects_in[1]}\n2nd - {subjects_in[2]}\n'
    
    release_ids = [guids_in_final[1], guids_in_final[2]]    
    release_email(guids_in_final[0], token)
    print('Released one inbound')
    release_many(release_ids, token)
    print('Released several')

    guids_out = guid_pattern.findall(response_out)
    guids_out_final = []

    for element in guids_out:
        if element not in guids_out_final:
            guids_out_final.append(element)

    print(f'Outbound guid to release is:\n\n{guids_out_final[1]}\n')
    subjects_out = subject_pattern.findall(response_out)
    subjects_released_outbound = f'\nSubjects released Outbound:\nSingle outbound: {subjects_out[1]}'
    
    release_email(guids_out_final[1], token)
    print('Released one outbound')

    results = f'{subjects_released_inbound}{subjects_released_outbound}'
    
    with open(f'{result2}', 'w') as file:
        file.write(f'Date and time is: {current_time}\n\n')
        file.write(f'{results}')
    print('results were written to the file')


creds = read_csv_to_list(address)
get_list_and_perform_release(internal_user_token(get_ad_token()))
