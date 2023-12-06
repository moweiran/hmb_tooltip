<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A Custom Tooltip component

## Features

A Custom Tooltip component

## Getting started

flutter pub add hmb_tooltip
![Demo](https://github.com/moweiran/hmb_tooltip/assets/8222923/f633a3da-5db5-4876-bfe1-3dc6ec8ce7d2)

## Usage

```dart
class ASTooltipDemo extends StatelessWidget {
  const ASTooltipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ASAppBar(
        title: 'tooltip demo page',
      ),
      body: Column(
        children: [
          50.vsh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomLeft,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomRight,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
            ],
          ),
          20.vsh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topLeft,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topRight,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
            ],
          ),
          200.vsh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightBottom,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightTop,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
            ],
          ),
          200.vsh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftBottom,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
              60.vsw,
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: ASColors.color5F5CB0,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftTop,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: ASColors.random,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## Additional information

A Custom Tooltip component
