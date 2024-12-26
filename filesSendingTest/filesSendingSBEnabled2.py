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

# IN FOLDER_PATH VARIABLE USE ADDRESS ONLY WITH DOUBLE SLASH >>> \\
# In other case erro will appear

folder_path = 'C:\\Users\\apriorit\\Desktop\\ForAcceptance\\filesSendingTest\\Acceptance'    # <<<< Provide a full path of the folder with test files
listOfFilesInFolder = os.listdir(folder_path)    # Creates and contains a list of files from the folder above

# SMTP data for script
host = '52.178.193.223'
sender = 'emsec.acc@gmail.com'
recipient = 'user5@sssclient.com'
body = 'test text'


def determine_path2():
    # Get the operating system name
    os_name = platform.system()
    if os_name == 'Windows':
        return '\\'
    else:
        return '/'


def send_ebd():
    path_delimiter = determine_path2()
    
    for file in listOfFilesInFolder:
        subject = f'{file} sent. Sandbox enabled.' 
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

