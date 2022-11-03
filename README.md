## Assessment

[![N|Solid](https://media-exp2.licdn.com/dms/image/C4D0BAQG_UkB5AOqHcw/company-logo_200_200/0/1585822589802?e=2147483647&v=beta&t=sdISMMUetCZDGV2AT6vtFPO5ivz--EUoHWqhnhPz5fU)](https://www.wit-software.com/)


## Description

##### Build a flutter app that shows the stock market report of 10 random companies. Add a date range and an auto complete search box to the UI. The autocomplete feature should filter the list returned from the API. Also, notify the user if the device is offline. Add a production-grade README file to your project and upload it on GitHub..

- [x] Build a flutter app that shows the stock market report of 10 random companies
- [x] Add a date range and an auto complete feature on search box to filter the list returned from the API.
- [x] Notify the user if the device is offline
- [x] README

## Environment

```sh
flutter doctor -v
```
> [✓] Flutter (Channel stable, 3.3.7, on macOS 12.6 21G115 darwin-arm, locale pt-BR)
    • Flutter version 3.3.7 on channel stable at /Users/seventh/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision e99c9c7cd9 (34 hours ago), 2022-11-01 16:59:00 -0700
    • Engine revision 857bd6b74c
    • Dart version 2.18.4
    • DevTools version 2.15.0

> [✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
    • Android SDK at /Users/seventh/Library/Android/sdk
    • Platform android-33, build-tools 31.0.0
    • Java binary at: /Applications/Android Studio.app/Contents/jre/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.12+0-b1504.28-7817840)
    • All Android licenses accepted.

> [✓] Xcode - develop for iOS and macOS (Xcode 14.0.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14A400
    • CocoaPods version 1.11.2

> [✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

> [✓] Android Studio (version 2021.2)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.12+0-b1504.28-7817840)

> [✓] VS Code (version 1.73.0)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.52.0

> [✓] Connected device (4 available)
    • Mi Note 10 Lite (mobile) • acd36229                             • android-arm64  • Android 12 (API 31)
    • iPhone 11 (mobile)       • F85EEE29-5B82-4444-AEA9-0144E11B598E • ios            • com.apple.CoreSimulator.SimRuntime.iOS-15-2 (simulator)
    • macOS (desktop)          • macos                                • darwin-arm64   • macOS 12.6 21G115 darwin-arm
    • Chrome (web)             • chrome                               • web-javascript • Google Chrome 107.0.5304.87

> [✓] HTTP Host Availability
    • All required HTTP hosts are available

## Packages
| Plugin | pub.dev |
| ------ | ------ |
| Dio | [https://pub.dev/packages/dio][PlD] |
| Flutter Bloc | [https://pub.dev/packages/flutter_bloc][PlB] |
| Internet Connection Checker | [https://pub.dev/packages/internet_connection_checker][PlI] |
| GetIt | [https://pub.dev/packages/get_it][PlG] |
| Intl | [https://pub.dev/packages/intl][PlIntl] |
| Shimmer | [https://pub.dev/packages/shimmer][PlS] |

## App Resume

The app only has one screen:
[x] Home
The home screen is where eveything happens. When the app is opened, the user is redirected to the `HomeView` and the cubit run the `fetchData()` function, returning the `List<EodModel>` or the `status code(integer)` obtained from the API.
While the function is running, a loadscreen is shown to the user with the `Shimmer` effect.
If everything goes ok with the API, a `ListView` is builded. Each component from this list is a `Card` showing the company name, date, open and close value.
The business-logic from the leading icon is:
If the open value is lower than close value from that day, the icon will be green.
The search box was created with the `Autocomplete` widget, and the date range picker was created with `showDateRangePicker` function, both are native from Flutter.

## Pattern and State Management

> The app was developed with the BLoC(Cubit) state management.

> The project was created always thinking and applying the S.O.L.I.D principles and the best development practices.

> Focused on the deadline, complex components were not used for app development, only those that the Flutter provides.

## Tests

Created the unit test to API connexion. To pass the test, is expected a `List<EodModel>`, and if the API request get failure, it will return an `int` or a `null`.


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [DIO]: <https://pub.dev/packages/dio>
   [Shimmer]: <https://pub.dev/packages/shimmer>

   [PlD]: <https://pub.dev/packages/dio>
   [PlB]: <https://pub.dev/packages/flutter_bloc>
   [PlI]: <https://pub.dev/packages/location>
   [PlG]: <https://pub.dev/packages/get_it>
   [PlIntl]: <https://pub.dev/packages/intl>
   [PlS]: <https://pub.dev/packages/shimmer>
