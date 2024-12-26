@echo off
cd C:\Users\apriorit\Desktop\ForAcceptance
python acceptance.py
python fileshipping.py
:: Path to Notepad++
set NPP_PATH="C:\Program Files\Notepad++\notepad++.exe"

:: File paths
set FILE1="acceptance result.txt"
set FILE2="acceptance result fileshipper.txt"

:: Open files in Notepad++
%NPP_PATH% %FILE1% %FILE2%
pause