import 'package:rexpay/src/core/api/model/transaction_api_response.dart';

abstract class CardServiceContract {
  Future<TransactionApiResponse> chargeCard(Map<String, String?> fields);

  Future<TransactionApiResponse> validateCharge(Map<String, String?> fields);

  Future<TransactionApiResponse> reQueryTransaction(String? trans);
}
