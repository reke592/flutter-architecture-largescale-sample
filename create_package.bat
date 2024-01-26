@echo off
cls

setlocal
:ask_package_name
set packageName=
set /P packageName="package name (lowercase no spaces): "
if "%packageName%" == "" goto ask_package_name

set packageDescription=
set /P packageDescription="description: "

call flutter create packages\%packageName% --template=package --description "%packageDescription%"
call pub_get %packageName%

echo done.
endlocal
