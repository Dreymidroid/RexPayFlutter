import 'dart:async';
import 'package:flutter/services.dart';
import 'package:openpgp/openpgp.dart';
import 'package:rexpay/src/models/auth_keys.dart';


class Crypto {
  static Future<String> encrypt(String data, String publicKey) async {
    var completer = Completer<String>();

    try {
      var encrypted = await OpenPGP.encrypt(data, publicKey);

      completer.complete(encrypted);
    } on PlatformException catch (e) {
      completer.completeError(e);
    }

    return completer.future;
  }

  static Future<String> decrypt(String data, AuthKeys authKeys) async {
    try {
      final message = await OpenPGP.decrypt(data, authKeys.privateKey, authKeys.passPhrase);

      return message;
    } on OpenPGPException catch (e) {
      print(e.cause);
      // Well, let's hope we'll never decrypt
      throw UnimplementedError('Error Decrypting data');
    }
    catch (e){
      throw UnimplementedError('Error Decrypting data');
    }
  }
}

