class Bank {
  String? name;
  String? code;
  String? display;
  int? id;

  Bank(this.name, this.id, this.code, this.display);

  @override
  String toString() {
    return 'Bank{name: $name, id: $id}';
  }
}

class BankAccount {
  Bank? bank;
  String? number;
  String? accountName;

  BankAccount(this.bank, this.number, this.accountName);

  bool isValid() {
    if (number == null || number!.length < 10) {
      return false;
    }

    if (bank == null || bank!.id == null) {
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'BankAccount{bank: $bank, number: $number}';
  }
}
