# Acceptance
Acceptance test - automated parts:
===================================

For test to run: 
-----------------

Install
--------
- Install python 3.11 or higher
- Install pip
- via pip Install modules (if not installed) > urllib3, telnetlib3, requests
- Install PowerShell v. 5+
- Install notepad++


Perform actions
----------------
- If download as archive > Unpack archive and place 'ForAcceptance' folder on Desktop or any suitable place where it won't be moved or deleted from; If want to clone > Create 'ForAcceptance' folder in any suitable location on PC, 'git init' in the folder, clone the code

- In all present '*.py' files find all the folder addresses like 'C:\Users\apriorit\Desktop\ForAcceptance\filesSendingTest...' and change this part of it 'C:\Users\apriorit\Desktop\ForAcceptance\' so it correcly point to the folder with the acceptance test files.

- 'acceptance.bat' as above, edit 'cd C:\Users\apriorit\Desktop\ForAcceptance' so it points to the 'ForAcceptance' folder on the PC

- 'acceptance.bat' check that NPP_PATH="C:\Program Files\Notepad++\notepad++.exe" points to the folder with executable of notepad++

- Connect to customer's Tailscale network (if don't then report can't be received)

- Download 'sensitive.csv' from the project's Confluence and place the file in the 'ForAcceptance' folder


Now you can run the test
------------------------
- Run 'acceptance.bat' file with admin privileges

- When test is done it'll automatically open notepad++ with two files:
    1 - 'acceptance result.txt'
    2 - 'acceptance result fileshipper.txt'

- GUIDs for emails in the 'acceptance result fileshipper.txt' will be in the cmd console

--------------------------------------------------------------------------------
NOTE: cmd might automatically close itself if user closed notepad++ application. 
      So, please make sure to save GUIDs if you plan to use them in the future.
