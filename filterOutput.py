import datetime
result = r'C:\Users\apriorit\Desktop\Acceptance\acceptance result.txt'


def acceptance_test(data):
    acceptance = []
    inbound = []
    outbound = []
    passed = []
    failed = []
    connectionrules = {'(Default) Zero Reputation Domain service': '"Permanent Reject Error"',
                       '"(Locked) DHA"': '"final_action_name":"Permanent Reject Error',
                       '"Deny"': '"final_action_name":"Permanent Reject Error'}

    emailsizereject = {'"subject":null': '"final_rule_name":"Email Size Reject"'}

    acceptanceempty = []
    inb = {'[Basic]SeveralRecipients in TO': "\"delivery_state\":\"delivered\"",
           '[Basic]ZIP': "\"delivery_state\":\"delivered\"",
           '[Basic]DOCX': "\"delivery_state\":\"delivered\"",
           '[Basic]XLSX': "\"delivery_state\":\"delivered\"",
           '[Basic]PDF': "\"delivery_state\":\"delivered\"",
           '(Default) Invalid Sending Domain': "Score is 110",
           '(Default) Suspicious RTF Invoice': "Score is 142",
           '(Default) CoreService Malware. Vade Secure Virus test': "Score is 109",
           '(Default) CoreService Phishing. Vade Secure Phishing test': "Score is 500",
           '(Default) CoreService Suspect. Vade Secure Suspect test': "Score is 105",
           '(Default) Virus Heuristic Analysis': "Score is 100",
           '(Default) Sexually Explicit': "Score is 240",
           '(Default) Sexual Enhancer': 'Score is 120',
           '[Inbound](Default) BitDefender AV"': 'Score is 110',
           '(Default) BitDefender AV Cloud mode': 'Deliver',
           '(Default) System Malware Detection"': "Score is 327",
           '(Default) Blog Spam': 'Score is 110',
           '(Default) URL Scanner': "Score is 175",
           '(Default) URL Redirect Spam': "Score is 110",
           '(Default) Domain Name Detection': "Score is 247",
           '[Custom]Possible Spam': '"Possible Spam"',
           '[Custom]Confirmed Spam': '"Confirmed Spam"',
           '[Custom]Virus': '"Score is 110"',
           '[Custom]Nearby': '"Nearby domain Test"',
           '[Custom]SPF': '"subject":"[SPF]',
           '[Custom]Spoof': '"Score is 247"',
           '[Custom]Executive Tracking"': '[EX]',
           '[Custom]Executive Tracking Whitelist': 'delivered',
           '[Custom]Confirmed Phishing. Vade Secure Phishing test': 'Score is 500',
           '[Custom]High Reputation Marketing. Vade Secure PCE test': "[Marketing High]",
           '[Custom]Medium Reputation Marketing. Vade Secure MCE test': "Score is 105",
           '[Custom]Low Reputation Marketing. Vade Secure DCE test': "Score is 214",
           'Customers - CAC msgBody blacklist': '"final_rule_name":"Customers - CAC msgBody blacklist',
           'Customers - Greymail recipients Avsluta nyhetsbrevet nu!': "Score is 104",
           'Customers - Allow KK mail list"': 'delivered',
           'Customers - NewsLetters': '"final_rule_name":"Customers - NewsLetters'}
    outm = {'[Acceptance][outbound][Basic]SeveralRecipients in TO': '"delivery_state":"delivered"',
            '[Acceptance][outbound][Basic]ZIP': '"delivery_state":"delivered"',
            '[Acceptance][outbound][Basic]DOCX': '"delivery_state":"delivered"',
            '[Acceptance][outbound][Basic]XLSX': '"delivery_state":"delivered"',
            '[Acceptance][outbound][Basic]PDF': '"delivery_state":"delivered"',
            '[Acceptance][outbound](Default) Virus Heuristic Analysis': 'Score is 100',
            '[Acceptance][outbound](Default) Sexual Enhancer': 'Score is 120',
            '[Acceptance][outbound](Default) BitDefender AV"': 'Score is 110',
            '[Acceptance][outbound](Default) BitDefender AV Cloud mode': 'Deliver',
            '[Acceptance][outbound](Default) System Malware Detection': 'Score is 218',
            '[Acceptance][outbound](Default) URL Redirect Spam': 'Score is 110',
            '[Acceptance][outbound][Custom]Possible Spam': '"final_rule_name":"Possible Spam"',
            '[Acceptance][outbound][Custom]Confirmed Spam': '"final_rule_name":"Confirmed Spam"',
            '[Acceptance][outbound][Custom]Virus': '"Score is 110"',
            '[Acceptance][outbound][Custom][secure] SecureMail': '"final_rule_name": "SecureMail",\n            "from_address": "admin@zeus.extexch.com"',
            '[Acceptance][outbound]Customers - CAC msgBody blacklist': '"Customers - CAC msgBody blacklist Company"',
            '[Acceptance][outbound]Customers - Lotus Confidential C2 gmail': '"final_rule_name":"Customers - Lotus Confidential"',
            '[Acceptance][outbound]Customers - Lotus Confidential C2 yahoo': '"final_rule_name":"Customers - Lotus Confidential"',
            '[Acceptance][outbound]Customers - Social Security Outbound Attachment': 'Customers - Social Security Outbound',
            '[Acceptance][outbound]Customers - Credit Card With Spaces Block': 'Delete',
            '[Acceptance][outbound]Customers - Allow outbound': '"final_rule_name":"Customers -  Allow outbound"'}

    out = str(data)[11:-34]  # delete json input and output data that isn't related to emails

    message_list = out.split('account_uuid')  # put email report in list divided by one email
    del message_list[0]
    # print(message_list)

    # Connection rules processing
    for key in connectionrules.keys():
        for i in message_list:
            if key in i:
                if connectionrules[key] in i:
                    passed.append(f'{key} - passed')
                else:
                    failed.append(f'{key} - failed')
            else:
                continue

    # Email size reject processing
    for key in emailsizereject.keys():
        for i in message_list:
            if key in i:
                if '"from_address":"user5@sssclient.com"' in i:
                    if emailsizereject[key] in i:
                        passed.append('Email Size reject Out - passed')
                    else:
                        continue
                elif '"from_address":"ems.testuser@outlook.com"' in i:
                    if emailsizereject[key] in i:
                        passed.append('Email Size reject In - passed')
                    else:
                        continue
                else:
                    continue
            else:
                continue

    # check if email report contains messages with the empty subject
    for i in message_list:
        if 'subject":""' in i:
            acceptanceempty.append(i)
        elif 'subject":"[spf]"' in i:
            acceptanceempty.append(i)
        else:
            continue

    # check if empty subj messages are from acceptance test users and message's delivery state
    for i in acceptanceempty:
        if '"from_address":"user5@sssclient.com"' in i:
            if 'delivered' in i:
                passed.append('Empty message from user5@sssclient - passed')
            else:
                failed.append('Empty message from user5@sssclient - failed')
        elif '"from_address":"ems.testuser@outlook.com"' in i:
            if 'delivered' in i:
                passed.append('Empty message from ems.testuser@outlook.com - passed')
            else:
                failed.append('Empty message from ems.testuser@outlook.com - failed')
        else:
            failed.append('All empty messages cases failed')

    # filter by [Acceptance] prefix
    for i in message_list:
        if "[Acceptance]" in i:
            acceptance.append(i)
        else:
            continue

    # filter by [Inbound]/[outbound] prefix
    for j in acceptance:
        if "[Inbound]" in j:
            inbound.append(j)
        else:
            outbound.append(j)

    for key in inb.keys():
        for i in inbound:
            if key in i:
                if '"from_address":"dmarc-reporting@clouduss.com"' not in i:
                    if inb[key] in i:
                        passed.append(f'{key} | In - passed')
                    else:
                        failed.append(f'{key} | In - failed')
                else:
                    continue
            else:
                continue

    for key in outm.keys():
        for i in outbound:
            if key in i:
                if 'Customers - Credit Card With Spaces Block' in i:
                    if "Delete" in i:
                        passed.append(f'{key} | Out - passed')
                    elif "Delete" not in i:
                        if '"Spoof Rule"' in i:
                            continue
                        elif '"Quarantine"' in i:
                            continue
                        else:
                            continue
                    else:
                        failed.append(f'{key} | Out - failed')
                elif outm[key] in i:
                    passed.append(f'{key} | Out - passed')
                else:
                    failed.append(f'{key} | Out - failed')
            else:
                continue

    with open(f'{result}', 'w') as file:
        file.write('')

    with open(f'{result}', 'a') as file:
        file.write(f'File updated with the last results on: {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')
        file.write('\n>>>>>Passed cases<<<<<\n\n')
        for line in passed:
            file.write(line + '\n')
        file.write('\n>>>>>Failed cases<<<<<\n\n')
        for line in failed:
            file.write(line + '\n')
        file.write(f'\nTotal passed > {len(passed)}\nTotal failed > {len(failed)}')
    print('The report was filtered and results was written in the txt file\n')

