import 'package:flutter/material.dart';
import 'package:flutter_thawani_pay/flutter_thawani_pay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Thawani Pay Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Thawani Pay Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);

            final result = await Navigator.of(context).push<bool>(
              MaterialPageRoute(
                builder: (_) => const PaymentPage(),
              ),
            );

            late final String message;

            if (result == true) {
              message = 'Payment Successful';
            } else {
              message = 'Payment Failed';
            }

            scaffoldMessenger.showSnackBar(SnackBar(
              content: Text(message),
              padding: const EdgeInsets.all(16.0),
              duration: const Duration(seconds: 8),
            ));
          },
          child: const Text(
            'Proceed to Payment',
          ),
        ),
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final thawaniRepository = const ThawaniRepository(
      // In production code provide the ThawaniConfigProd
      // instance:

      // config: ThawaniConfigProd(
      //   secretKey: secretKey,
      //   publishableKey: publishableKey,
      // ),
      );

  final payload = <String, dynamic>{
    "client_reference_id": 'your_user_id',
    "products": [
      {
        "name": "Total",
        "quantity": 1,
        "unit_amount": (4.500 * 1000).toInt(),
      }
    ],
    "success_url": 'https://mydomain.com/thawani/success',
    "cancel_url": 'https://mydomain.com/thawani/cancel',
    "metadata": {
      "order_id": 'your_order_id',
      "customer_email": 'john.doe@example.com',
      "customer_phone": '+123 4567890',
      "customer_name": 'John Doe',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: ThawaniPaymentView(
        thawaniRepository: thawaniRepository,
        payload: payload,
        onSuccess: () => Navigator.of(context).pop(true),
        onFailure: () => Navigator.of(context).pop(false),
      ),
    );
  }
}
