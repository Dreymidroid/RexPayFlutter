import 'package:rexpay/src/core/api/model/transaction_api_response.dart';
import 'package:rexpay/src/core/api/request/card_request_body.dart';
import 'package:rexpay/src/models/auth_keys.dart';

abstract class CardServiceContract {
  Future<TransactionApiResponse> createPayment(CardRequestBody? credentials, AuthKeys authKeys);

  Future<TransactionApiResponse> chargeCard(CardRequestBody? credentials, AuthKeys authKeys);

  Future<TransactionApiResponse> authorizeCharge(CardRequestBody? credentials, AuthKeys authKeys);

  Future<TransactionApiResponse> insertPublicKey(AuthKeys authKeys);
}
