import 'package:rexpay/src/core/api/model/api_response.dart';

class TransactionApiResponse extends ApiResponse {
  String? reference;
  String? trans;
  String? auth;
  String? otpMessage;
  String? displayText;

  String? clientId;
  String? paymentUrl;
  String? status;
  String? paymentChannel;
  String? paymentUrlReference;
  String? providerExtraInfo;
  String? providerResponse;
  String? externalPaymentReference;
  String? amount;
  String? message;
  String? currency;

  String? transactionReference;
  String? accountNumber;
  String? accountName;
  String? bankName;
  String? responseCode;
  String? responseDescription;
  String? paymentId;
  Map<String, dynamic>? rawResponse;

  TransactionApiResponse.unknownServerResponse() {
    status = '0';
    message = 'Unknown server response';
  }

  TransactionApiResponse.fromMap(Map<String, dynamic> map) {
    this.reference = map['reference'];
    if (map.containsKey('trans')) {
      trans = map['trans'];
    } else if (map.containsKey('id')) {
      trans = map['id'].toString();
    }
    auth = map['auth'];
    otpMessage = map['otpmessage'];
    status = map['status'];
    message = map['message'];
    displayText = !map.containsKey('display_text') ? message : map['display_text'];

    if (status != null) {
      status = status!.toLowerCase();
    }

    if (auth != null) {
      auth = auth!.toLowerCase();
    }
  }

  TransactionApiResponse.fromCreateTransaction(Map<String, dynamic> map) {
    reference = map['reference'].toString();
    clientId = map['clientId'];
    paymentUrl = map['paymentUrl'];
    status = map['status'];
    paymentChannel = map['paymentChannel'];
    paymentUrlReference = map['paymentUrlReference'];
    externalPaymentReference = map['externalPaymentReference'];
    amount = map['fees'].toString();
    currency = map['currency'];
  }

  TransactionApiResponse.fromGetTransactionStatus(Map<String, dynamic> map) {
    reference = map['referenceId'].toString();
    clientId = map['clientId'];
    paymentUrl = map['paymentUrl'];
    status = map['status'];
    message = map['statusMessage'];
    paymentChannel = map['paymentChannel'];
    amount = map['amount'].toString();
    currency = map['currency'];
    providerResponse = map['providerResponse'];
    rawResponse = map;
  }

  TransactionApiResponse.fromGetUSSDTransactionStatus(Map<String, dynamic> map) {
    reference = map['paymentReference'].toString();
    paymentChannel = "BANK";
    amount = map['amount'].toString();
    responseCode = map['responseCode'];
    responseDescription = map['responseDescription'];
    rawResponse = map;
  }

  TransactionApiResponse.fromUSSDCreateTransaction(Map<String, dynamic> map) {
    reference = map['reference'].toString();
    clientId = map['clientId'];
    paymentUrl = map['paymentUrl'];
    status = map['status'];
    paymentChannel = map['paymentChannel'];
    paymentUrlReference = map['paymentUrlReference'];
    externalPaymentReference = map['externalPaymentReference'];
    amount = map['fees'].toString();
    currency = map['currency'];
    providerResponse = map['providerResponse'];
    providerExtraInfo = map['providerExtraInfo'];
    rawResponse = map;
  }

  TransactionApiResponse.fromCreateUSSDPayment(Map<String, dynamic> map) {
    reference = map['reference'].toString();
    clientId = map['clientId'];
    paymentUrl = map['paymentUrl'];
    status = map['status'];
    paymentChannel = map['paymentChannel'];
    providerResponse = map['providerResponse'];
    paymentUrlReference = map['paymentUrlReference'];
    providerExtraInfo = map['providerExtraInfo'];
    externalPaymentReference = map['externalPaymentReference'];
    amount = map['fees'].toString();
    currency = map['currency'];
    rawResponse = map;
  }

  TransactionApiResponse.fromChargeCardMap(Map<String, dynamic> map) {
    amount = map['amount'];
    transactionReference = map['transactionReference'];
    accountNumber = map['accountNumber'];
    accountName = map['accountName'];
    bankName = map['bankName'];
    responseCode = map['responseCode'];
    responseDescription = map['responseDescription'];
    paymentId = map['paymentId'];
    rawResponse = map;
  }

  TransactionApiResponse.fromAuthorizeCardMap(Map<String, dynamic> map) {
    amount = map['amount'];
    transactionReference = map['transactionRef'];
    responseCode = map['responseCode'];
    paymentId = map['paymentId'];
    rawResponse = map;
  }

  TransactionApiResponse.fromUploadeKeyMap(Map<String, dynamic> map) {
    status = map['status'];
  }

  TransactionApiResponse.fromAccessCodeVerification(Map<String, dynamic> map) {
    var data = map['data'];
    trans = data['id'].toString();
    status = data['transaction_status'];
    message = map['message'];
    rawResponse = map;
  }

  bool hasValidReferenceAndTrans() {
    return (reference != null) && (trans != null);
  }

  bool hasValidUrl() {
    if (otpMessage == null || otpMessage!.length == 0) {
      return false;
    }

    return RegExp(r'^https?://', caseSensitive: false).hasMatch(otpMessage!);
  }

  bool hasValidOtpMessage() {
    return otpMessage != null;
  }

  bool hasValidAuth() {
    return auth != null;
  }

  @override
  String toString() {
    return 'TransactionApiResponse{reference: $reference, trans: $trans, auth: $auth, '
        'otpMessage: $otpMessage, displayText: $displayText, message: $message, '
        'status: $status}';
  }
}
