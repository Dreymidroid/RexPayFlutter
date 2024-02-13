import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rexpay/src/core/api/model/transaction_api_response.dart';
import 'package:rexpay/src/core/common/exceptions.dart';
import 'package:rexpay/src/core/common/rexpay.dart';
import 'package:rexpay/src/models/auth_keys.dart';
import 'package:rexpay/src/models/charge.dart';
import 'package:rexpay/src/models/checkout_response.dart';
import 'package:rexpay/src/models/transaction.dart';

abstract class BaseTransactionManager {
  bool processing = false;
  final Charge charge;
  final BuildContext context;
  final Transaction transaction = Transaction();
  final AuthKeys authKeys;

  BaseTransactionManager({
    required this.charge,
    required this.context,
    required this.authKeys,
  });

  initiate() async {
    if (processing) throw ProcessingException();

    setProcessingOn();
    await postInitiate();
  }

  Future<CheckoutResponse> sendCharge() async {
    try {
      return sendChargeOnServer();
    } catch (e) {
      return notifyProcessingError(e);
    }
  }

  Future<CheckoutResponse> handleApiResponse(TransactionApiResponse apiResponse);

  Future<CheckoutResponse> _initApiResponse(TransactionApiResponse? apiResponse) {
    if (apiResponse == null) {
      apiResponse = TransactionApiResponse.unknownServerResponse();
    }

    transaction.loadFromResponse(apiResponse);

    return handleApiResponse(apiResponse);
  }

  Future<CheckoutResponse> handleServerResponse(Future<TransactionApiResponse> future) async {
    try {
      final apiResponse = await future;
      return _initApiResponse(apiResponse);
    } catch (e) {
      return notifyProcessingError(e);
    }
  }

  CheckoutResponse notifyProcessingError(Object e) {
    setProcessingOff();

    if (e is TimeoutException || e is SocketException) {
      e = 'Please  check your internet connection or try again later';
    }
    return CheckoutResponse(
        message: e.toString(),
        reference: transaction.reference,
        status: "FAILED",
        serverResponse: {},
        method: checkoutMethod(),);
  }

  setProcessingOff() => processing = false;

  setProcessingOn() => processing = true;

  Future<CheckoutResponse> getPinFrmUI() async {
      return notifyProcessingError(RexpayException("PIN must be exactly 4 digits"));
    
  }

  CheckoutResponse onSuccess(Transaction transaction) {
    return CheckoutResponse(
        message: transaction.message,
        reference: transaction.reference,
        status: "SUCCESS",
        serverResponse: {},
        method: checkoutMethod(),);
  }

  Future<CheckoutResponse> handleCardInput() {
    throw UnsupportedError("Handling of card input not supported for Bank payment method");
  }

  Future<CheckoutResponse> handleOtpInput(String otp, TransactionApiResponse? response);

  Future<CheckoutResponse> handlePinInput(String pin) {
    throw UnsupportedError("Pin Input not supported for ${checkoutMethod()}");
  }

  postInitiate();

  CheckoutMethod checkoutMethod();

  Future<CheckoutResponse> sendChargeOnServer();
}
