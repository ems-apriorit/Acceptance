import smtplib
from email.message import EmailMessage


def langs():
    j = 0
    email1 = 'user5@sssclient.com'
    email2 = 'emsec.acc@gmail.com'
    inbound = '52.178.193.223'
    outbound = '40.69.46.135'
    port = 25
    lang = ['greek','chinese','japanese','korean','indian','cyrillic','arabic','thai']
    lang_text = ['Αυτό είναι ένα δοκιμαστικό μήνυμα','这是一条测试消息','これはテストメッセージです','이것은 테스트 메시지입니다',' यह एक परीक्षण संदेशहै ','Це тестове повідомлення','هذه رسالة اختبار',' นี่เป็นข้อความทดสอบ ']

    messagecount = len(lang)

    while j < messagecount:  # inbound direction
        smtp_connection1 = smtplib.SMTP(inbound, port)    # open smtp connection for inbound messages
        subject = f"[Acceptance][Inbound]{lang[j]} language - {lang_text[j]}"
        body = f'{lang_text[j]} \n'
        # Email sending
        msg = EmailMessage()

        msg['Subject'] = subject
        msg['From'] = email2
        msg['To'] = email1
        msg.set_content(body, subtype='html')

        smtp_connection1.send_message(msg)
        smtp_connection1.quit()
        print(f'{subject} - Inbound sent')
        j += 1

    j = 0
    print('\n')


    while j < messagecount:  # outbound direction
        smtp_connection = smtplib.SMTP(outbound, port)    # open smtp connection for inbound messages
        subject = f"[Acceptance][outbound]{lang[j]} language - {lang_text[j]}"
        body = f'{lang_text[j]} \n'
        # Email sending
        msg = EmailMessage()

        msg['Subject'] = subject
        msg['From'] = email1
        msg['To'] = email2
        msg.set_content(body, subtype='html')

        smtp_connection.send_message(msg)
        smtp_connection.quit()
        print(f'{subject} - Outbound sent')
        j += 1


# langs()
