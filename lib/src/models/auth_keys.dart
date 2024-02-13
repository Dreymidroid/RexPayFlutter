class AuthKeys {
  String rexPayPublicKey;
  String publicKey;
  String privateKey;
  String username;
  String password;
  String passPhrase;
  Mode mode;

  AuthKeys({
    required this.rexPayPublicKey,
    required this.publicKey,
    required this.privateKey,
    required this.username,
    required this.password,
    required this.passPhrase,
    this.mode  = Mode.test,
  });
}

enum Mode { test, live }
