import http.client
import json
import datetime
from config import SENSITIVE_DATA_PATH
address = SENSITIVE_DATA_PATH


def get_system_time_minus_few_minutes():
    five_minutes_ago = datetime.datetime.now() - datetime.timedelta(minutes=190)
    print(f'{five_minutes_ago}\n')
    return five_minutes_ago.strftime("%Y-%m-%d %H:%M:%S")

def get_system_time_minus_few2_minutes():
    five_minutes_ago = datetime.datetime.now() - datetime.timedelta(minutes=180)
    print(f'{five_minutes_ago}\n')
    return five_minutes_ago.strftime("%Y-%m-%d %H:%M:%S")
    
    
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


def login_get_report():
    creds = read_csv_to_list(address)
    time_to = get_system_time_minus_few2_minutes()    #atetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    time_from = get_system_time_minus_few_minutes()
    print(time_from)
    print(time_to)
    print(f'\nTime for logs filtering was calculated\n')    # logging time
    
    # Connecting to the api and using credentials to login
    print('Logging in...')
    conn = http.client.HTTPSConnection("apiv2.staging.clouduss.com")
    payload = ''
    headers = {}
    conn.request("POST", f"/auth?username={creds[0]}&password={creds[1]}", payload, headers)
    res = conn.getresponse()
    data = res.read()
    

    # After login, we are receiving account data and filtering to get only access token
    response = str(data).split('token_type')
    del response[1]
    response2 = ''.join(response)
    response3 = []

    for i in response2:
      response3.append(i)

    del response3[0:19]
    del response3[-3:]
    accesstoken = "".join(response3)  # data was filtered and access token received
    
    print(f'access token received - {accesstoken}')

    # Requesting email report from api according to the time interval
    conn = http.client.HTTPSConnection("apiv2.staging.clouduss.com")
    payload = json.dumps({
      "interval": "custom",
      "from": f'{time_from}',  # change to get data for a specific time frame
      "to": f'{time_to}',  # change to get data for a specific time frame
      "tzoffset": 0,
      "page": 1,
      "start": 0,
      "limit": 2000
    })
    
    headers = {
      'X-Uss-Account-Id': f'{creds[2]}',  # USS account ID   for the sssclient user
      'Content-Type': 'application/json',
      'Authorization': f'Bearer {accesstoken}'  # the token received in the   beginning is in use here
    }
    
    
    conn.request("POST", "/email/v2/analyse", payload, headers)
    res = conn.getresponse()
    
    data = res.read()  # email report received
    print('email report received')
    return data


#   print(login_get_report())
