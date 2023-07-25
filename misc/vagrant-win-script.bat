@echo off

set profile=dev
@REM set profile=test

set src=input_your_path\%profile%

cd %src%

if "%1"=="stat" (
    vagrant status
) else if "%1"=="gstat" (
    vagrant global-status
) else if "%1"=="start" (
    vagrant up
) else if "%1"=="stop" (
    vagrant halt
) else if "%1"=="ssh" (
    vagrant ssh
) else if "%1"=="up" (
    vagrant up
    vagrant ssh
) else if "%1"=="del" (
    echo y| vagrant destroy
) else if "%1"=="deli" (
    vagrant destroy
) else if "%1"=="sns" (
    vagrant snapshot save %2
) else if "%1"=="snd" (
    vagrant snapshot delete %2
) else if "%1"=="snr" (
    vagrant snapshot restore %2
) else (
    echo not supported command
)
