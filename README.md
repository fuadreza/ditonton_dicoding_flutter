# Dicoding Ditonton Flutter

Project Excercise for learning Dicoding MFDE

## Status

[![Codemagic build status](https://api.codemagic.io/apps/63903aa4da0cdbd16a9d2638/63903aa4da0cdbd16a9d2637/status_badge.svg)](https://codemagic.io/apps/63903aa4da0cdbd16a9d2638/63903aa4da0cdbd16a9d2637/latest_build)

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/fuadreza/ditonton_dicoding_flutter.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

Connect device with debugging on using adb and run project with:

```
flutter run lib/main.dart
```

## Testing

**Step 1:**

Go to terminal and move to one of the modules (movie, or tvseries)

````
cd movie/
````

**Step 2:**

Run flutter test with coverage

```
flutter test --coverage
```

**Step 3:**

Generate html using third party like lcov

```
genhtml coverage/lcov.info -o coverage/html
```

**Step 4:**

After finishing with one module, go to another module and repeat the process

## Special Thanks To 

**Dicoding**
**IDCamp Indosat Ooredoo**