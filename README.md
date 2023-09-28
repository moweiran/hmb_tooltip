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

## Usage

```dart
@override
  Widget build(BuildContext context) {
    return ASTooltip(
      content: Obx(
        () {
          return ASDurationCountdown(
            endTime: widget.endedAt.value ?? DateTime.now(),
            childBuilder: (duration) {
              return ASText14(
                'Your session is running out in ${duration.durationTime} ',
                color: ASColors.white,
                fontWeight: FontWeight.w400,
                height: 18 / 14,
              );
            },
          );
        },
      ),
      offsetRight: -20,
      offsetTop: 5,
      width: 248.w,
      color: ASColors.color5F5CB0,
      defaultShow: false,
      alignment: ArrowAlign.topRight,
      milliseconds: 0,
      child: ASDurationOnlineView(
        onlines: widget.onlines,
        duration: widget.duration,
      ),
      initialCallback: (tooltipState) {
        this.tooltipState = tooltipState;
        // Future.delayed(const Duration(seconds: 12), () {
        //   tooltipState.show(context);
        // });
      },
      dismissCallback: () {
        tooltipState = null;
      },
    );
  }
```

## Additional information

A Custom Tooltip component
