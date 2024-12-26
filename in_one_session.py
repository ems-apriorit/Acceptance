import smtplib
from email.message import EmailMessage


def in_one_session():
    j = 0
    email1 = 'user5@sssclient.com'
    email2 = 'emsec.acc@gmail.com'
    inbound = '52.178.193.223'
    outbound = '40.69.46.135'
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

        print(f'{subject} - Outbound sent')
        smtp_connection2.send_message(msg)
        j += 1

    smtp_connection2.quit()


# in_one_session()

