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

A plugin to integrate Thawani Payment Gateway in flutter apps.

## Features

- [x] Checkout
- [ ] Subscriptions
- [ ] Plans
- [ ] Refunds

## Getting started

Add the package to your pubspec.yaml dependencies list as follows.
```yaml
dependencies:
  flutter_thawani_pay:
    git:
      url: https://github.com/isyedaliraza/flutter_thawani_pay.git
```

As this plugin uses [webview_flutter](https://pub.dev/packages/webview_flutter), make sure to follow all the configuration steps as mentioned in webview_flutter docs.

## Usage

For usage refer to the example project of this plugin.

## Additional information

### Secret and Publishable Keys
You must use your own secret and publishable keys in order to make transactions. You can get the secret and publishable keys by contacting Thawani sales team. The following are test secret and publishable keys according to Thawani docs.
- Secret Key: rRQ26GcsZzoEhbrP2HZvLYDbn9C9et
- Publishable Key: HGvTMLDssJghr9tlN9gr4DVYt0qyBy

### Test Cards
The following are the test cards that you can use in the sandbox environment. Expiration date must be a valid date in the future (use the mm/yy format). Any CVV/CVC is accepted.
- 4242 4242 4242 4242 (To test success scenario)
- 4000 0000 0000 0002 (To test reject scenario)
- 5200 8282 8282 8210 (To test 3D secure)
