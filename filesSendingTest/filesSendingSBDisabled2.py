import os
import smtplib
import socket
import re
from email import encoders
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.image import MIMEImage
from email.mime.audio import MIMEAudio
from os.path import basename
import platform
address = r'C:\Users\apriorit\Desktop\Acceptance\sensitive.csv'

# IN FOLDER_PATH VARIABLE USE ADDRESS ONLY WITH DOUBLE SLASH >>> \\
# In other case erro will appear

folder_path = 'C:\\Users\\apriorit\\Desktop\\Acceptance\\filesSendingTest\\Acceptance'    # <<<< Provide a full path of the folder with test files
listOfFilesInFolder = os.listdir(folder_path)    # Creates and contains a list of files from the folder above


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
    
   
creds = read_csv_to_list(address)
# SMTP data for script
host = f'{creds[15]}'
sender = f'{creds[22]}'
recipient = f'{creds[17]}'
body = 'test text'

   
def determine_path1():
    # Get the operating system name
    os_name = platform.system()
    if os_name == 'Windows':
        return '\\'
    else:
        return '/'


def send_sbd():
    path_delimiter = determine_path1()
    
    for file in listOfFilesInFolder:
        subject = f'{file} sent. Sandbox disabled.' 
        message = MIMEMultipart()
        message['From'] = sender
        message['To'] = recipient
        filename = f'{folder_path}{path_delimiter}{file}'
        # print(filename)
        print(f'Test file: {file} - sent')
    
        with open(filename, "rb") as attachment:
            part = MIMEBase("application", "octet-stream")
            part.set_payload(attachment.read())
    
        message['Subject'] = subject
    
        # Encode to base64
        encoders.encode_base64(part)
    
        # Add header
        part.add_header(
            "Content-Disposition",
            'attachment; filename="%s"' % basename(filename),
        )
        part1 = MIMEText(body, "html")
        message.attach(part1)
        message.attach(part)  # Add attachment to your message and convert it to string
    
        with smtplib.SMTP(host) as server:
            server.sendmail(sender, recipient, message.as_string())

