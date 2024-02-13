import 'package:rexpay/src/core/common/my_strings.dart';

class RexpayException implements Exception {
  String? message;

  RexpayException(this.message);

  @override
  String toString() {
    if (message == null) return Strings.unKnownError;
    return message!;
  }
}

class AuthenticationException extends RexpayException {
  AuthenticationException(String message) : super(message);
}

class CardException extends RexpayException {
  CardException(String message) : super(message);
}

class ChargeException extends RexpayException {
  ChargeException(String? message) : super(message);
}

class InvalidAmountException extends RexpayException {
  int amount = 0;

  InvalidAmountException(this.amount)
      : super('$amount is not a valid '
            'amount. only positive non-zero values are allowed.');
}

class InvalidEmailException extends RexpayException {
  String? email;

  InvalidEmailException(this.email) : super('$email  is not a valid email');
}

class ProcessingException extends ChargeException {
  ProcessingException() : super('A transaction is currently processing, please wait till it concludes before attempting a new charge.');
}
