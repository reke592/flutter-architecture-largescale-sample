# Largescale 🚀
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Test architecture for large scale project.

## Target
Design a project architecture that can support the following:
- Clean architecture
- Modular development and testing
- Feature customization

## Getting Started
- Run `pub_get.bat` to fetch all project dependencies. This will execute `flutter pub get` in all projects inside the `packages` directory and, finally, in the main project.
- For selective dependency fetching, *eg.,* `pub_get.bat auth commons`. This command will run `flutter pub get` only in the `./packages/auth` and `./packages/commons` directories, and finally in the main project.

## Creating new package
- Run `create_package.bat`, supply the new package name in **lowercase_without_spaces**, and provide an optional description. This will create a new Flutter project with the `--template=package` option inside the packages directory. It will automatically add `publish_to: 'none'` in the pubspec and include `packages/commons` as a dependency. Finally, the batch file will call pub add in the main project to include the newly created package.
