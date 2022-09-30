abstract class ThawaniConfig {
  const ThawaniConfig({
    required this.domain,
    required this.secretKey,
    required this.publishableKey,
  });

  final String domain;
  final String secretKey;
  final String publishableKey;
}

class ThawaniConfigUAT extends ThawaniConfig {
  const ThawaniConfigUAT({
    required String secretKey,
    required String publishableKey,
  }) : super(
          domain: 'https://uatcheckout.thawani.om',
          secretKey: secretKey,
          publishableKey: publishableKey,
        );
}

class ThawaniConfigProd extends ThawaniConfig {
  const ThawaniConfigProd({
    required String secretKey,
    required String publishableKey,
  }) : super(
          domain: 'https://checkout.thawani.om',
          secretKey: secretKey,
          publishableKey: publishableKey,
        );
}
