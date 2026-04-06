# Acceptance
Acceptance test - automated parts:
===================================

For test to run: 
-----------------

Install
--------
- Install python 3.10 - 3.12. If higher than 3.12 telnetlib istn't supported so BDAT cases will be failed to run
- Install pip
- via pip Install modules (if not installed) > urllib3, telnetlib3, requests
- Install PowerShell v. 5+
- Install notepad++


Perform actions
----------------
- If download as archive > Unpack archive and place 'Acceptance' folder on Desktop or any suitable place where it won't be moved or deleted from; 
If want to clone from git > Create 'Acceptance' folder in any suitable location on PC, 'git init' in the folder, clone the code

- Download 'sensitive.csv' from the project's Confluence and place the file in the 'Acceptance' folder

- Create a config.py file in the 'Acceptance' folder, add the next code inside and save:
-------------------------------------------------------------------------------------
import os

SENSITIVE_DATA_PATH = r'<put here adddress of the acceptance folder>\sensitive.csv'
OTHER_DATA_PATH = r'<put here adddress of the acceptance folder>'
-------------------------------------------------------------------------------------


- In all present '*.ps1' files (there are only 3 of them) in the root 'Acceptance' folder find $creds variable and add address that points to the file sensitive.csv
-------------------------------------------------------------------------------------
$creds = Get-Content -Path "C:\Users\apriorit\Desktop\Acceptance\sensitive.csv"
-------------------------------------------------------------------------------------

- 'acceptance.bat' as above, edit 'cd C:\Users\apriorit\Desktop\Acceptance' so it points to the 'Acceptance' folder on your PC

- 'acceptance.bat' check that NPP_PATH="C:\Program Files\Notepad++\notepad++.exe" points to the folder with executable of notepad++

- !Not necessary! Copy 'acceptance.bat' to a place where you are comfortable to run the test 

- Connect to customer's Tailscale network (if don't then report can't be received)


Now you can run the test
------------------------
- Run 'acceptance.bat' file with admin privileges

- When test is done it'll automatically open notepad++ with two files:
    1 - 'acceptance result.txt'
    2 - 'acceptance result fileshipper.txt'

- GUIDs for emails in the 'acceptance result fileshipper.txt' will be in the cmd console

--------------------------------------------------------------------------------
NOTE: cmd might automatically close itself if user closed notepad++ application. 