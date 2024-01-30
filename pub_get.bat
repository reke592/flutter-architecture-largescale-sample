@echo off
cls
setlocal

REM target directory to run pub get
set package_dir=packages

REM call pub get in packages
if "%1" neq "" (
    :next
    if "%1" == "" goto last
    echo Executing pub get in: %package_dir%\%1
    pushd "%package_dir%\%1"
    call flutter pub get
    if %errorlevel% neq 0 ( popd && echo failed. && goto end ) else ( popd && shift && goto next )
) else (
    for /D %%i in (%package_dir%\*) do (
        echo Executing pub get in: %%i
        pushd "%%i"
        call flutter pub get
        if %errorlevel% neq 0 ( popd && echo failed. && goto end ) else ( popd )
    )
)

:last
REM finally call pub get in main project
call flutter pub get

endlocal
:end
