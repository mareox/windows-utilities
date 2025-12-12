@echo off

set "known_hosts=%USERPROFILE%\.ssh\known_hosts"

if not exist "%known_hosts%" (
    echo %known_hosts% not found.
    exit /b
)

del "%known_hosts%"

echo %known_hosts% cleaned successfully.
