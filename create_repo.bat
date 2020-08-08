@echo off
call :create %1 %2

goto :eof

:create
    set projectFolder=%2
    cd C:\Users\AlexN\Documents\Python Projects\CreateProjectAutomation
    python create.py %2
    cd C:\Users\AlexN\Documents
    if "%~1" == "" goto :help
    if "%~2" == "" goto :help
    
    if "%~1" == "-p" goto :pythonProject
    if "%~1" == "-f" goto :flutterProject

goto :eof

rem Create python project
:pythonProject
setlocal
    cd Python Projects
    mkdir %projectFolder%
    cd %projectFolder%
    break > README.md
    goto :gitCommands
endlocal
goto :eof

rem Create flutter project
:flutterProject
setlocal
    cd Flutter Projects
    mkdir %projectFolder%
    cd %projectFolder%
    break > README.md
    goto :gitCommands
endlocal
goto :eof

rem Commands to create github repository
:gitCommands
setlocal
    echo %projectFolder%
    git init
    git add README.md
    git commit -m "Initial Commit"
    git remote add origin https://github.com/alex-t-nguyen/%2.git

    git push -u origin master
    echo Github repository for project ^"%projectFolder%^" created
endlocal
goto :openIDE

rem If wrong input is entered
:help
setlocal
    echo Usage: create_repo ^<project_type^> ^<folder_name^>
endlocal
goto :eof

:openIDE
    if "%~1" == "-p" goto :PyCharm
    goto :VSC

:PyCharm
    pycharm64 .
    goto :eof

:VSC
    code .
    goto :eof