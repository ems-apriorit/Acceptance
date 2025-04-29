$creds = Get-Content -Path "C:\Users\apriorit\Desktop\Acceptance\sensitive.csv"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject " "
$receiverEmails1 = "$($creds[17])", "$($creds[18])"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To $receiverEmails1 -Subject "[Acceptance][Inbound][Basic]SeveralRecipients in TO" -BodyAsHtml "[stagein]SeveralRecipients" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Basic]ZIP" -BodyAsHtml "[stagein]ZIP" -Attachments "attachment\acceptance_fts.zip"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Basic]DOCX" -BodyAsHtml "[stagein]DOCX" -Attachments "attachment\acceptance_fts.docx"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Basic]XLSX" -BodyAsHtml "[stagein]XLSX" -Attachments "attachment\acceptance_fts.xlsx"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Basic]PDF" -BodyAsHtml "[stagein]PDF" -Attachments "attachment\acceptance_fts.pdf"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[20])" -Subject "[Acceptance][Inbound][Connection]DHA rule" -BodyAsHtml "[stagein]DHA rule" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "deny@extexch.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Connection]DENY_IN" -BodyAsHtml "[stagein]DENY_IN" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Connection]Email Size Reject" -BodyAsHtml "[stagein]Email Size Reject" -Attachments "attachment\Big_file.rar"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Signature Verification" -BodyAsHtml "[stagein](Default) Signature Verification" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "mail@yabadabaduoooo.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Invalid Sending Domain" -BodyAsHtml "[stagein](Default) Invalid Sending Domain" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Suspicious RTF Invoice" -BodyAsHtml "[stagein](Default) Suspicious RTF Invoice" -Attachments "attachment\acceptance_rtf.rtf"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) CoreService Malware. Vade Secure Virus test" -BodyAsHtml "cJ7ig62u425nRaF2bXEJS919ZU6tlR-Virus-zkysi9P1COdW2lBJ58n057OtVU1j5Wgx7Q" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) CoreService Phishing. Vade Secure Phishing test" -BodyAsHtml "HAlqdeteLRT8jXYDYyLkKqACgwnrRo-Phishing-eNIhe9WdwDWTT09TGWAWIJuH9KvN2yHXsJ" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) CoreService Suspect. Vade Secure Suspect test" -BodyAsHtml "BJ83tgVMZgNx6LzvL2M817palv9fzh-Suspect-5t0T3Qk462BgI264tbcPX3648rLWRYINg9" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Password Protected Attachment zip" -BodyAsHtml "[stagein](Default) Password Protected Attachment zip" -Attachments "attachment\acceptance_password_ANSI.zip"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Password Protected Attachment pdf" -BodyAsHtml "[stagein](Default) Password Protected Attachment pdf" -Attachments "attachment\acceptance_password_ANSI.pdf"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Virus Heuristic Analysis" -BodyAsHtml "Macros inside" -Attachments "attachment\acceptance_macro.xls"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Sexually Explicit" -BodyAsHtml "[stagein]hottest girls. pleasure source. some nasty girl" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Sexual Enhancer/Explicit Spam" -BodyAsHtml "[stagein]Viagr4" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) BitDefender AV" -BodyAsHtml "[stagein](Default) BitDefender AV" -Attachments "attachment\acceptance_dummyscan_infected.txt"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) BitDefender AV Cloud mode" -BodyAsHtml "[stagein](Default) BitDefender AV Cloud mode" -Attachments "attachment\acceptance_dummyscan_excepted.txt"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) System Malware Detection" -BodyAsHtml "X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*" -Attachments "attachment\acceptance_eicar.com"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Blog Spam" -BodyAsHtml "[stagein](Default) Blog Spam rule blog.yahoo" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) URL Scanner" -BodyAsHtml "[stagein](Default) URL Scanner http://dbltest.com" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) URL Redirect Spam" -BodyAsHtml "[stagein]migre.me/ " 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "test@sssclient.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound](Default) Domain Name Detection" -BodyAsHtml "[stagein](Default) Domain Name Detection" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Possible Spam" -BodyAsHtml "[stagein]migre.me/ " 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Confirmed Spam" -BodyAsHtml "http://dbltest.com http://migre.me/ blog.yahoo" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Virus" "Virus inside" -BodyAsHtml -Attachments "attachment\acceptance_dummyscan_infected.txt"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Archive" -BodyAsHtml "[stagein]Archive" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "test@ququ.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Nearby" -BodyAsHtml "[stagein]Nearby" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "user@zoho.eu" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]SPF" -BodyAsHtml "SPF" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Send notification RCP" -BodyAsHtml "[stagein]Send notification" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "Edward Newgate <$($creds[19])>" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Executive Tracking" -BodyAsHtml "[stagein]Executive Tracking" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "Edward Newgate <$($creds[22])>" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Executive Tracking Whitelist" -BodyAsHtml "[stagein]Executive Tracking" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Confirmed Phishing. Vade Secure Phishing test" -BodyAsHtml "HAlqdeteLRT8jXYDYyLkKqACgwnrRo-Phishing-eNIhe9WdwDWTT09TGWAWIJuH9KvN2yHXsJ" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]High Reputation Marketing. Vade Secure PCE test" -BodyAsHtml "q7jn9Fz78mVR8RJo07S8so4dq5XQ5Q-PCE-h2IOKyecOh2f5W428NzVM769YB1bnWxPj0" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Medium Reputation Marketing. Vade Secure MCE test" -BodyAsHtml "3eKPY1dCsmec85LatqwNQkoDa37Q42-MCE-DQaDFBp73950znTC105Q2LVO0m69s1wH3p" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[21])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Low Reputation Marketing. Vade Secure DCE test" -BodyAsHtml "AJ16M96ZqpNn9fht4k2215NvhWz02B-DCE-2B6hvNbbBgICOKRr2xPoZj71F9f5M70Cu7" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "ems.testuser@gmail.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound]Customers - CAC msgBody blacklist" -BodyAsHtml "online låneudbyder
memory booster
3B Boligrenovering
udglatter huden
udligner rynker
rejuve
mecindo
online apotek
HelseTips &amp; Tracks
søger en bolleven
GraspSkills
Facebook Funds Manager
PMI-PBA Certification
Technocerts
uforpligtende dating
Udglatte huden
HusCompagniet
Smartlånet
Casual Lounge
potensmiddel
naturlig gel.
Partnermedniveau.dk
Hvis du ønsker at beholde din konto eller betale din saldo, bedes du bekræfte din konto via denne email
LeoVegas
Unibet
Akutbolig.dk
Spilnu.dk
boligportalen
Enroll now...
Gratis spil
anmodning forretning
disponible saldo? Kan vi betale
erekt!on
udbetalning
kan lærer dog bedre
Bit-Danmark" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "ems.testuser@gmail.com" -To "$($creds[18])" -Subject "[Acceptance][Inbound]Customers - Greymail recipients Avsluta nyhetsbrevet nu!" -BodyAsHtml "[stagein] Greymail recipients Avsluta nyhetsbrevet nu!" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[19])" -To "$($creds[17])" -Subject "[Acceptance][Inbound]Customers - Allow KK mail list" -BodyAsHtml "moveto@kalundborg.dk www.sundhedsoplysning.dk DenOffentlige Schiller Instituttet BeredskabsInfo arbejdsmiljoweb.dk kontakt@kulturtjenesten.dk EduLab ADHD-foreningen Dafolo dp@dp.dk www.danskevv.dk Økonomidirektørforeningen hej@cyklingudenalder.dk info@biometric.dk www.seminarer.dk mge@oim.dk ungdomsringen@ungdomsringen.dk nfo@esmiley.dk skolelederne@skolelederne.org forlag@dafolo.dk KOMBITs projekter www.vsbv.dk brandvæsen vestsjællands migre.me/" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "ems.testuser@gmail.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound]Customers - NewsLetters" -BodyAsHtml "Click here if you are unable to view this email" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "ems.testuser@gmail.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound]Customers - Dangerous file" -BodyAsHtml -Attachments "attachment\acceptance.wsh"
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "mnm@dsfgdf.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound]Customers - Safe sender" -BodyAsHtml "Safe sender" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[14])" -From "$($creds[17])" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Custom]Spoof" -BodyAsHtml "[stagein]Spoof" 
Write-Host "Inbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject " "
$receiverEmails2 = "$($creds[22])", "$($creds[22])"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To $receiverEmails2 -Subject "[Acceptance][outbound][Basic]SeveralRecipients in TO" -BodyAsHtml "[stageout]SeveralRecipients" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Basic]ZIP" -BodyAsHtml "[stageout]ZIP" -Attachments "attachment\acceptance_fts.zip"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Basic]DOCX" -BodyAsHtml "[stageout]DOCX" -Attachments "attachment\acceptance_fts.docx"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Basic]XLSX" -BodyAsHtml "[stageout]XLSX" -Attachments "attachment\acceptance_fts.xlsx"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Basic]PDF" -BodyAsHtml "[stageout]PDF" -Attachments "attachment\acceptance_fts.pdf"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "deny_acceptance@deny.loc" -Subject "[Acceptance][outbound][Connection]Deny_Out" -BodyAsHtml "[stageout]Deny_Out" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Connection]Email Size Reject" -BodyAsHtml "[stageout]Email Size Reject" -Attachments "attachment\Big_file.rar"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) Password Protected Attachment zip" -BodyAsHtml "[stageout](Default) Password Protected Attachment zip" -Attachments "attachment\acceptance_password_ANSI.zip"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) Password Protected Attachment pdf" -BodyAsHtml "[stageout](Default) Password Protected Attachment pdf" -Attachments "attachment\acceptance_password_ANSI.pdf"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) Virus Heuristic Analysis" -BodyAsHtml "[stageout](Default) Virus Heuristic Analysis" -Attachments "attachment\acceptance_macro.xls"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) Sexual Enhancer/Explicit Spam" -BodyAsHtml "[stageout]Viagr4" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) BitDefender AV" -BodyAsHtml "[stageout](Default) BitDefender AV" -Attachments "attachment\acceptance_dummyscan_infected.txt"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) BitDefender AV Cloud mode" -BodyAsHtml "[stageout](Default) BitDefender AV Cloud mode" -Attachments "attachment\acceptance_dummyscan_excepted.txt"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) System Malware Detection" -BodyAsHtml " X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H* " -Attachments "attachment\acceptance_eicar.com"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) URL Redirect Spam" -BodyAsHtml "[stageout]migre.me/" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound](Default) Email Banner" -BodyAsHtml "[stageout] Email Banner" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "smiletesttest90@gmail.com" -Subject "[Acceptance][outbound](Default) Apply DKIM signing (to do manually)" -BodyAsHtml "[stageout] Apply DKIM signing" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Custom]Possible Spam" -BodyAsHtml "[stageout] migre.me/" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Custom]Confirmed Spam" -BodyAsHtml "[stageout] V1agra migre.me/" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Custom]Virus" -BodyAsHtml "[stageout] Virus" -Attachments "attachment\acceptance_dummyscan_infected.txt"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Custom]Archive" -BodyAsHtml "[stageout]Archive" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "admin@emailsecurity.extexch.com" -Subject "[Acceptance][outbound][Custom][secure] SecureMail" -BodyAsHtml "[stageout]SecureMail" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound][Custom]Notification to sender" -BodyAsHtml "Notification" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound]Customers - CAC msgBody blacklist" -BodyAsHtml "online låneudbyder
memory booster
3B Boligrenovering
udglatter huden
udligner rynker
rejuve
mecindo
online apotek
HelseTips &amp; Tracks
søger en bolleven
GraspSkills
Facebook Funds Manager
PMI-PBA Certification
Technocerts
uforpligtende dating
Udglatte huden
HusCompagniet
Smartlånet
Casual Lounge
potensmiddel
naturlig gel.
Partnermedniveau.dk
Hvis du ønsker at beholde din konto eller betale din saldo, bedes du bekræfte din konto via denne email
LeoVegas
Unibet
Akutbolig.dk
Spilnu.dk
boligportalen
Enroll now...
Gratis spil
anmodning forretning
disponible saldo? Kan vi betale
erekt!on
udbetalning
kan lærer dog bedre
Bit-Danmark" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "smiletest@yahoo.com" -Subject "[Acceptance][outbound]Customers - Lotus Confidential C2 yahoo" -BodyAsHtml "[stageout] Lotus Confidential C2 yahoo" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound]Customers - Social Security Outbound Attachment" -BodyAsHtml "[stageout] Social Security Outbound Attachment" -Attachments "attachment\acceptance_!121888-1111d.docx"
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "sub@sssclient.com" -To "$($creds[22])" -Subject "[Acceptance][outbound]Customers - Credit Card With Spaces Block" -BodyAsHtml "6161-6724-5685-2342" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[18])" -To "$($creds[22])" -Subject "[Acceptance][outbound]Customers - Allow outbound" -BodyAsHtml "[stageout] Allow outbound" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "mnm@dsfgdf.com" -Subject "[Acceptance][outbound]Customers - Safe sender" -BodyAsHtml "Safe sender" 
Write-Host "Outbound Message sent"
Send-MailMessage -SmtpServer "$($creds[15])" -From "$($creds[17])" -To "$($creds[22])" -Subject "[Acceptance][outbound]Customers - Dangerous file" -BodyAsHtml "Dangerous file" -Attachments "attachment\acceptance.wsh"
Write-Host "Outbound Message sent"
Write-Host "ZRD connection rule check. Inbound"
Send-MailMessage -SmtpServer "$($creds[14])" -From "example@zrdtest.com" -To "$($creds[17])" -Subject "[Acceptance][Inbound][Connection](Default) Zero Reputation Domain service" -BodyAsHtml "[stagein](Default) Zero Reputation Domain service"
Write-Host "65 sec wait"
Start-Sleep -Seconds 65