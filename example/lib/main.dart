import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rexpay/rexpay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  var publicKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';
  var privateKey = '[YOUR_PAYSTACK_PUBLIC_KEY]';
  var username = 'talk2phasahsyyahoocom';
  var passPhrase = 'talk2phasahsyyahoocom';
  var password = 'f0bedbea93df09264a4f09a6b38de6e9b924b6cb92bf4a0c07ce46f26f85';

// Authorisation: Basic Auth 
  final plugin = RexpayPlugin();

  @override
  void initState() {
    super.initState();

    plugin.initialize(
      publicKey: publicKey,
      privateKey: privateKey,
      username: username,
      password: password,
      passPhrase: passPhrase,
    );

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      //     await plugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
         floatingActionButton: FloatingActionButton(
        onPressed: pullCharge,
        tooltip: 'Pay',
        child: const Icon(Icons.add),
      ),
      ),
    );
  }

  void pullCharge() async {
    Charge charge = Charge()
      ..amount = 10000
      ..reference = "hdgdgfhhfueuejejejjeeuuej"
      ..email = 'customer@email.com';
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.selectable, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
  }
}
