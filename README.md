
![Dart CI](https://github.com/erikbg7/Flutter-Project/workflows/CI/badge.svg) [![codecov](https://codecov.io/gh/erikbg7/Flutter-Project/branch/master/graph/badge.svg?token=4CSEISOEW0)](https://codecov.io/gh/erikbg7/Flutter-Project)


# Boletify :evergreen_tree: :mushroom: :camera: :deciduous_tree:

## Aim of this project
The main objective behind the project is to learn Flutter by building a fully functional Android app from the very begging to its release to the Play Store. Thus, covering the whole product life-cycle.

## Technologies

### Frontend Framework
[Flutter](https://flutter.dev/) using [BLoC pattern](https://pub.dev/packages/bloc), without null-safety. Only aiming Android platform.

### Backend Framework
I decided to go BaaS with `Firebase` to build the whole stack using Google products.
It will be used for:
- Storing the information.
- Analytics/Crashlytics

### Classifier
Tensorflow Lite model. Only two files and a package are enough to implement a client-side classifier that will -impressively- work offline, which is good news for the application we are building.
- `labels.txt` contains the list of labels of our classifier.
- `model_unquant.tflite` is the classifier itself.
- `tflite`is the package used to load and handle the classifications.

### Continuous Integration / Delivery
The whole pipeline will be build using Github Actions, I aim to perform:
- Unit Test
- Widget Test
- E2E Test
- Deployments

Some of the tools used are [Codecov](https://about.codecov.io/), [mockito](https://pub.dev/packages/mockito) and [bloc_test](https://pub.dev/packages/bloc_test).


## Features: Offline Mode
As I have said, the application will be fully functional in offline mode. This is mainly achieved in two ways:
- Moving all the classifier logic to the client-side.
- Creating a backup file in the phone storage to use that information when we can not retrieve it from `Firebase`.