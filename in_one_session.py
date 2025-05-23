import smtplib
from email.message import EmailMessage
from login import read_csv_to_list
address = r'C:\Users\apriorit\Desktop\Acceptance\sensitive.csv'
creds = read_csv_to_list(address)


def in_one_session():
    j = 0
    email1 = f'{creds[16]}'
    email2 = f'{creds[22]}'
    inbound = f'{creds[14]}'
    outbound = f'{creds[15]}'
    port = 25

    messagecount = 3

    smtp_connection1 = smtplib.SMTP(inbound, port)    # open smtp connection for inbound messages

    while j < messagecount:  # inbound direction
        subject = f"In one session message №{j + 1}"
        # Email sending
        msg = EmailMessage()

        msg['Subject'] = subject
        msg['From'] = email2
        msg['To'] = email1
        msg.set_content('Test body')

        print(f'{subject} - Inbound sent')
        smtp_connection1.send_message(msg)
        j += 1

    smtp_connection1.quit()
    j = 0

    smtp_connection2 = smtplib.SMTP(outbound, port)  # open smtp connection for outbound messages

    while j < messagecount:  # outbound direction
        subject = f"In one session message №{j + 1}"
        # Email sending
        msg = EmailMessage()

        msg['Subject'] = subject
        msg['From'] = email1
        msg['To'] = email2
        msg.set_content('Test body')

        print(f'{subject} - Outbound sent')
        smtp_connection2.send_message(msg)
        j += 1

    smtp_connection2.quit()


# in_one_session()

