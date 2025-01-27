import telnetlib    # only for python up to 3.12. Since 3.13 will telnetlib will be deprecated

results = []


def several_messages_one_session(name, server, port, sender, recipients):
    # Email messages
    emails = [
        {
            "from": f"{sender}",
            "to": f"{recipients[0]}",
            "subject": f"several_recipients one session {name}",
            "body": "Body text aaa"
        },
        {
            "from": "emsec.acc@gmail.com",
            "to": f"{recipients[1]}",
            "subject": f"several_recipients one session {name}",
            "body": "Body text aaa 2"
        }
    ]

    try:
        # Connect to the SMTP server
        telnet = telnetlib.Telnet(server, port)
        telnet.read_until(b"220")

        # Send EHLO command
        telnet.write(f"EHLO {name}\r\n".encode())
        telnet.read_until(b"250 AUTH PLAIN LOGIN")

        # Send each email
        for email in emails:
            # MAIL FROM command
            telnet.write(f"MAIL FROM:<{email['from']}>\r\n".encode())
            telnet.read_until(b"250")

            # RCPT TO command
            telnet.write(f"RCPT TO:<{email['to']}>\r\n".encode())
            telnet.read_until(b"250")

            # Create the email content
            email_content = f"""\
From: {email['from']}
To: {email['to']}
Subject: {email['subject']}

{email['body']}
    """
            binary_data = email_content.encode('utf-8')  # Convert to binary

            # Send email using BDAT
            telnet.write(f"BDAT {len(binary_data)} LAST\r\n".encode())
            telnet.write(binary_data)
            telnet.read_until(b"250")

        # Quit the session
        telnet.write(b"QUIT\r\n")
        telnet.read_all()
        results.append(f'{name} - delivered several recipients')
        # print("All emails sent successfully via BDAT!")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        telnet.close()
