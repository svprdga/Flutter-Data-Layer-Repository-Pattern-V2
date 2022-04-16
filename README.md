# Data layer in Flutter V2 | Use the Repository Pattern to keep a local copy of your API data

This is the sample project for a video and article related on how to implement the Repository Pattern to keep a local copy of the fetched data from a remote API.

You can find the text version of the tutorial [here](https://davidserrano.io/data-layer-in-flutter-use-the-repository-pattern-to-keep-a-local-copy-of-your-api-data).

You can find the video version of the tutorial on [Youtube](https://youtu.be/7mAhzINqKMI) and [Odysee](https://odysee.com/@svprdga:d/data-layer-in-flutter-use-the-repository-pattern-to-keep-a-local-copy-of-your-api-data).

## How to execute this sample project

If you try to execute this sample just after downloading it it will fail. To fix it, create a file `lib/data.dart` with the API key obtained from [here](https://rapidapi.com/apidojo/api/tasty/):

`const apiKey = 'YOUR API KEY HERE';`

## Build entities

`flutter pub run build_runner build`