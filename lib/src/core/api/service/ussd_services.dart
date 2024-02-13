import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rexpay/src/core/api/model/transaction_api_response.dart';
import 'package:rexpay/src/core/api/request/ussd_request_body.dart';
import 'package:rexpay/src/core/api/service/base_service.dart';
import 'package:rexpay/src/core/api/service/contracts/ussd_services_contract.dart';
import 'package:rexpay/src/core/common/exceptions.dart';
import 'package:rexpay/src/core/constants/constants.dart';
import 'package:rexpay/src/models/auth_keys.dart';
import 'package:rexpay/src/models/bank.dart';

class USSDService with BaseApiService implements USSDServiceContract {
  @override
  Future<TransactionApiResponse> getPaymantDetails(String transRef, AuthKeys authKeys) async {
    Response response = await apiGetRequests(
      "${getBaseUrl(authKeys.mode, type: 'pgs')}pgs/payment/v1/getPaymentDetails/$transRef",
      header: {'authorization': 'Basic ${base64Encode(utf8.encode('${authKeys.username}:${authKeys.password}'))}'},
    );

    var body = response.data;
    var statusCode = response.statusCode;

    if (statusCode == HttpStatus.ok) {
      return TransactionApiResponse.fromGetUSSDTransactionStatus(body!);
    } else {
      throw CardException('Bank transaction failed with '
          'status code: $statusCode and response: $body');
    }
  }

  @override
  Future<TransactionApiResponse> chargeUSSD(USSDChargeRequestBody? credentials, AuthKeys authKeys) async {
    try {
      Response response = await apiPostRequests(
        "${getBaseUrl(authKeys.mode, type: 'pgs')}pgs/payment/v1/makePayment",
        credentials!.toChargeUSSDJson(),
        header: {'authorization': 'Basic ${base64Encode(utf8.encode('${authKeys.username}:${authKeys.password}'))}'},
      );

      var body = response.data;
      var statusCode = response.statusCode;

      if (statusCode == HttpStatus.ok) {
        return TransactionApiResponse.fromCreateUSSDPayment(body!);
      } else {
        throw CardException('Bank transaction failed with '
            'status code: $statusCode and response: $body');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionApiResponse> createPayment(USSDChargeRequestBody? credentials, AuthKeys authKeys) async {
    try {
      Response response = await apiPostRequests(
        "${getBaseUrl(authKeys.mode, type: 'pgs')}pgs/payment/v2/createPayment",
        credentials!.toInitialJson(),
        header: {'authorization': 'Basic ${base64Encode(utf8.encode('${authKeys.username}:${authKeys.password}'))}'},
      );

      var body = response.data;
      var statusCode = response.statusCode;

      if (statusCode == HttpStatus.ok) {
        return TransactionApiResponse.fromUSSDCreateTransaction(body!);
      } else {
        throw CardException('Bank transaction failed with '
            'status code: $statusCode and response: $body');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Bank>?> fetchSupportedBanks(USSDChargeRequestBody? credentials, AuthKeys authKeys) async {
    try {
      Response response = await apiPostRequests(
        "${getBaseUrl(authKeys.mode, type: 'pgs')}pgs/payment/v2/createPayment",
        credentials!.toInitialJson(),
        header: {'authorization': 'Basic ${base64Encode(utf8.encode('${authKeys.username}:${authKeys.password}'))}'},
      );

      var body = response.data;
      var statusCode = response.statusCode;

      if (statusCode == HttpStatus.ok) {
        return [];
      } else {
        throw CardException('Bank transaction failed with '
            'status code: $statusCode and response: $body');
      }
    } catch (e) {
      rethrow;
    }
  }

  String getBaseUrl(Mode mode, {String type = 'cps'}) {
    if (mode == Mode.live) {
      if (type == 'pgs') {
         return "$LIVE_PGS_BASE_URL/api/";
      }
      return "$LIVE_CPS_BASE_URL/api/";
    }
    return "$TEST_BASE_URL/api/";
  }
}
