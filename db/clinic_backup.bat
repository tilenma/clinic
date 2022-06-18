@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%-%MM%-%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
echo datestamp: "%datestamp%"
echo fullstamp: "%fullstamp%"
     
set BACKUP_FILE=clinic2_%datestamp%.backup
echo backup file name is %BACKUP_FILE%
SET PGPASSWORD=abcd1234
echo on
“C:\program files\postgreSQL\9.4\bin\pg_dump.exe" -h localhost -p 5432 -U postgres -F c -b -v Clinic2 > C:\backup\%BACKUP_FILE%