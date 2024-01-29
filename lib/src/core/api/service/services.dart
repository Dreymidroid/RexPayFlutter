import 'package:rexpay/src/core/api/service/base_service.dart';

class HomeRepo with Services {
  Future<Map<String, dynamic>> getUSSDPaymentDetails(String transRef) async {
    try {
      return apiGetRequests('pgs/payment/v1/getPaymentDetails/$transRef');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createPayment({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('pgs/payment/v2/createPayment', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> chargeCard({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('cps/v1/chargeCard', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> authorizeCard({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('cps/v1/authorizeTransaction', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> chargeByTransfer({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('cps/v1/initiateBankTransfer', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getTransactionStatus({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('cps/v1/getTransactionStatus', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> chargeUSSD({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('pgs/payment/v1/makePayment', {});
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> inserPublicKey({String userId = "", String slug = ""}) async {
    try {
      return apiPostRequests('pgs/clients/v1/publicKey', {});
    } catch (e) {
      rethrow;
    }
  }
}
