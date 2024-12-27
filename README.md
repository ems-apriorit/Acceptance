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

<<<<<<< HEAD
- In all present '*.py' files find all the folder addresses like 'C:\Users\apriorit\Desktop\ForAcceptance\filesSendingTest...' and change this part of it 'C:\Users\apriorit\Desktop\ForAcceptance\' so it correcly point to the folder with the acceptance test files.
=======
- In 'acceptance.py' find the next line 'sys.path.append(r"C:\\Users\\apriorit\\Desktop\\ForAcceptance\\filesSendingTest")' and change address to the 'filesSendingTest' folder according to it's real location on your computer (basically change the address from the beginning to the ForAcceptance, the rest of the line leave as is)

- Repeat the previous step for the variables 'script_path1' & 'script_path2' & 'script_path3' in the 'acceptance.py'

- 'filterOutput.py' edit result = r'C:\Users\apriorit\Desktop\ForAcceptance\acceptance result.txt' as for examples in the previous steps

- 'fileshipping.py' edit result2 = r'C:\Users\apriorit\Desktop\ForAcceptance\acceptance result fileshipper.txt' as for examples in the previous steps

- 'acceptance.bat' as above, edit 'cd C:\Users\apriorit\Desktop\ForAcceptance' so it points to the 'ForAcceptance' folder on the PC
<<<<<<< HEAD
>>>>>>> 029f940c60d37aba900d750a86a332af203a1050
=======
>>>>>>> 48892ebb8d4ba7ba0b79cc3c2486847ec8352274
>>>>>>> 7c17813fad773e8f1c3696f7bb864b8aa9c29510

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
