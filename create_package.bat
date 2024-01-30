@echo off
cls

setlocal
:ask_package_name
set packageName=
set /P packageName="package name (lowercase no spaces): "
if "%packageName%" == "" goto ask_package_name
if exist "packages\%packageName%" (
    echo packages\%packageName% already exist.
    goto ask_package_name
)

set packageDescription=
set /P packageDescription="description: "

call flutter create packages\%packageName% --template=package --description "%packageDescription%"
pushd packages\%packageName%

REM only include publish_to: none if not exist in package pubspec
findstr /C:"publish_to: none" "pubspec.yaml" > nul
if errorlevel 1 (
    echo publish_to: 'none' > pubspec.yaml.tmp
    type pubspec.yaml >> pubspec.yaml.tmp
    move pubspec.yaml.tmp pubspec.yaml
)
call flutter pub add commons --path="../commons"
call flutter pub add dev:very_good_analysis

REM core library defaults
if not exist "lib\src\core" mkdir "lib\src\core"
echo // constant declarations for this package > "lib\src\core\constants.dart"
echo library %packageName%; > "lib\%packageName%.dart"

REM default exports
echo export "src/core/constants.dart"; >> "lib\%packageName%.dart"

REM apply main code analysis options
echo ../../analysis_options.yaml > "analysis_options.yaml"

REM add default feature installer test file
type ..\..\templates\feature_installer_test_file.template > "test\%packageName%_test.dart"
popd

REM only include the new package if not exist in main pubspec
findstr /C:"%packageName%" "pubspec.yaml" > nul
if errorlevel 1 (
    call flutter pub add %packageName% --path="./packages/%packageName%"
)

echo done.
endlocal
