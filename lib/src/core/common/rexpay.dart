import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rexpay/rexpay.dart';
import 'package:rexpay/src/core/api/service/bank_service.dart';
import 'package:rexpay/src/core/api/service/card_service.dart';
import 'package:rexpay/src/core/api/service/ussd_services.dart';
import 'package:rexpay/src/core/common/exceptions.dart';
import 'package:rexpay/src/core/common/my_strings.dart';
import 'package:rexpay/src/core/common/string_utils.dart';
import 'package:rexpay/src/models/card.dart';
import 'package:rexpay/src/models/charge.dart';
import 'package:rexpay/src/models/checkout_response.dart';
import 'package:rexpay/src/views/checkout/checkout_widget.dart';

class RexpayPlugin {
  late AuthKeys _authKeys;

  /// Initialize the Rexpay object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  ///
  /// [authKeys] - your rexpay public key, private key, username, password and passphrase. This is mandatory
  ///
  /// use [checkout] and you want this plugin to initialize the transaction for you.
  /// Please check [checkout] for more information
  ///
  initialize({required AuthKeys authKeys}) async {
    assert(() {
      if (authKeys.publicKey.isEmpty) {
        throw RexpayException('authKeys cannot be null or empty');
      }

      if (authKeys.privateKey.isEmpty) {
        throw RexpayException('PrivateKey cannot be null or empty');
      }

      if (authKeys.username.isEmpty) {
        throw RexpayException('Username cannot be null or empty');
      }

      if (authKeys.password.isEmpty) {
        throw RexpayException('Password cannot be null or empty');
      }

      if (authKeys.passPhrase.isEmpty) {
        throw RexpayException('Passphrase cannot be null or empty');
      }

      if (authKeys.rexPayPublicKey.isEmpty) {
        throw RexpayException('Passphrase cannot be null or empty');
      }

      return true;
    }());

    _authKeys = authKeys;
  }

  dispose() {
    _authKeys = AuthKeys(rexPayPublicKey: "", publicKey: "", privateKey: "", username: "", password: "", passPhrase: "");
   
  }

  AuthKeys get authKeys {
    return _authKeys;
  }


  /// Make payment by charging the user's card
  ///
  /// [context] - the widgets BuildContext
  ///
  /// [charge] - the charge object.

  // Future<CheckoutResponse> chargeCard(BuildContext context, {required Charge charge}) {
  //   // _performChecks();

  //   return _Rexpay(authKeys).chargeCard(context: context, charge: charge);
  // }

  /// Make payment using Rexpay's checkout form. The plugin will handle the whole
  /// processes involved.
  ///
  /// [context] - the widget's BuildContext
  ///
  /// [charge] - the charge object.
  ///
  /// [method] - The payment method to use(card, bank). It defaults to
  /// [CheckoutMethod.selectable] to allow the user to select. For [CheckoutMethod.bank]
  ///  or [CheckoutMethod.selectable], it is
  /// required that you supply an access code to the [Charge] object passed to [charge].
  /// For [CheckoutMethod.card], though not recommended, passing a reference to the
  /// [Charge] object will do just fine.
  ///
  /// Notes:
  ///
  /// * You can also pass the [PaymentCard] object and we'll use it to prepopulate the
  /// card  fields if card payment is being used
  ///
  /// [fullscreen] - Whether to display the payment in a full screen dialog or not
  ///
  /// [logo] - The widget to display at the top left of the payment prompt.
  /// Defaults to an Image widget with Rexpay's logo.
  ///
  /// [hideEmail] - Whether to hide the email from the user. When
  /// `false` and an email is passed to the [charge] object, the email
  /// will be displayed at the top right edge of the UI prompt. Defaults to
  /// `false`
  ///
  /// [hideAmount]  - Whether to hide the amount from the  payment prompt.
  /// When `false` the payment amount and currency is displayed at the
  /// top of payment prompt, just under the email. Also the payment
  /// call-to-action will display the amount, otherwise it will display
  /// "Continue". Defaults to `false`
  Future<CheckoutResponse> checkout(
    BuildContext context, {
    required Charge charge,
    CheckoutMethod method = CheckoutMethod.selectable,
    bool fullscreen = false,
    Widget? logo,
    bool hideEmail = false,
    bool hideAmount = false,
  }) async {
    return _Rexpay(authKeys).checkout(
      context,
      charge: charge,
      method: method,
      fullscreen: fullscreen,
      logo: logo,
      hideAmount: hideAmount,
      hideEmail: hideEmail,
    );
  }
}

class _Rexpay {
  final AuthKeys authKeys;

  _Rexpay(this.authKeys);

  Future<CheckoutResponse> checkout(
    BuildContext context, {
    required Charge charge,
    required CheckoutMethod method,
    required bool fullscreen,
    bool hideEmail = false,
    bool hideAmount = false,
    Widget? logo,
  }) async {
    assert(() {
      _validateChargeAndKey(charge);
      switch (method) {
        case CheckoutMethod.card:
          if (charge.reference == null) {
            throw ChargeException(Strings.noReference);
          }
          break;
        case CheckoutMethod.bank:
        case CheckoutMethod.USSD:
        case CheckoutMethod.selectable:
          if (charge.reference == null) {
            throw ChargeException(Strings.noReference);
          }
          break;
      }
      return true;
    }());

    CheckoutResponse? response = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CheckoutWidget(
        authKeys: authKeys,
        bankService: BankService(),
        cardsService: CardService(),
        ussdSService: USSDService(),
        method: method,
        charge: charge,
        fullscreen: fullscreen,
        logo: logo,
        hideAmount: hideAmount,
        hideEmail: hideEmail,
      ),
    );
    return response == null ? CheckoutResponse.defaults() : response;
  }

  _validateChargeAndKey(Charge charge) {
    if (charge.amount.isNegative) {
      throw InvalidAmountException(charge.amount);
    }
    if (!StringUtils.isValidEmail(charge.email)) {
      throw InvalidEmailException(charge.email);
    }
  }
}

typedef void OnTransactionChange<Transaction>(Transaction transaction);
typedef void OnTransactionError<Object, Transaction>(Object e, Transaction transaction);

enum CheckoutMethod { card, bank, USSD, selectable }
