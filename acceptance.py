#!/usr/bin/env python3.6

import time
from login import login_get_report
from filterOutput import acceptance_test
from in_one_session import in_one_session
import subprocess
import sys
from languages_test import langs
from bdat_one_session import several_messages_one_session
from login import read_csv_to_list
sys.path.append(r'C:\Users\apriorit\Desktop\Acceptance\filesSendingTest')
from filesSendingTest.filesSendingSBDisabled2 import send_sbd
from filesSendingTest.filesSendingSBEnabled2 import send_ebd

address = r'C:\Users\apriorit\Desktop\Acceptance\sensitive.csv'
creds = read_csv_to_list(address)
cred_rec = [creds[16], creds[17]]
cred_rec2 = [creds[21], creds[22]]


def run_powershell_script(script_path):
    try:
        # Use the 'powershell' command to open a PowerShell window and run the script
        subprocess.run(['powershell', '-ExecutionPolicy', 'Bypass', '-File', script_path], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    # Provide the path to your PowerShell script
    script_path1 = r'C:\Users\apriorit\Desktop\Acceptance\dbcommand.ps1'
    script_path2 = r'C:\Users\apriorit\Desktop\Acceptance\acceptance_sending_messages.ps1'
    print('===== Updating customers DB rules and brand. =====\n')
    run_powershell_script(script_path1)
    print('Sending the main pack of test messages.\n')
    run_powershell_script(script_path2)
    print('===== Main messages\' pack was sent. =====\n\n')


def main():
    print('===== Checking several messages in one smtp session. =====')
    print('DATA')
    in_one_session()
    # print('\nBDAT inbound\n')
    # several_messages_one_session(creds[23],creds[14],25,creds[22],cred_rec)
    # print('\nBDAT outbound\n')
    # several_messages_one_session(creds[24], creds[16], 25, creds[16], cred_rec2)
    print('\n===== Languages check. =====\n\n')
    langs()
    
    print('\n\n===== Waiting a few min until UI/DB updated with new logs: =====\n\n')
    for i in range(5):
        remaining_time = 5 - i
        print(f"{remaining_time} minute(s) remaining...")
        time.sleep(60)  # 60 seconds = 1 minute

    get_email_report = login_get_report()    # login and getting report
    acceptance_test(get_email_report)    # filter report data and write results in file
    print('\n===== Main test completed =====\n')
    print('Sending files with Sandbox disabled')
    send_sbd()    # send a list of files with sandbox disabled 
    script_path3 = r'C:\Users\apriorit\Desktop\Acceptance\enable_sandbox.ps1'
    print('Wait 2 minutes to finish processing files with sandbox disabled')
    time.sleep(120)    # Wait 2 minutes to finish processing files with sandbox disabled
    print('enabling sandbox and sending messages')
    run_powershell_script(script_path3)    # enable sandbox
    print('\n')
    send_ebd()    # send a list of files with sandbox enabled 
    print('\n\nFinished')


if __name__ == '__main__':
    main()
