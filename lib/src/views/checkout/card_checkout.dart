import 'package:flutter/material.dart';
import 'package:rexpay/src/core/api/service/contracts/cards_service_contract.dart';
import 'package:rexpay/src/core/common/exceptions.dart';
import 'package:rexpay/src/core/common/my_strings.dart';
import 'package:rexpay/src/core/common/rexpay.dart';
import 'package:rexpay/src/core/common/utils.dart';
import 'package:rexpay/src/models/card.dart';
import 'package:rexpay/src/models/charge.dart';
import 'package:rexpay/src/models/checkout_response.dart';
import 'package:rexpay/src/transaction/card_transaction_manager.dart';
import 'package:rexpay/src/views/checkout/base_checkout.dart';
import 'package:rexpay/src/views/checkout/checkout_widget.dart';
import 'package:rexpay/src/views/input/card_input.dart';

class CardCheckout extends StatefulWidget {
  final Charge charge;
  final OnResponse<CheckoutResponse> onResponse;
  final ValueChanged<bool> onProcessingChange;
  final ValueChanged<PaymentCard?> onCardChange;
  final bool hideAmount;
  final CardServiceContract service;
  final String publicKey;

  CardCheckout({
    Key? key,
    required this.charge,
    required this.onResponse,
    required this.onProcessingChange,
    required this.onCardChange,
    required this.service,
    required this.publicKey,
    this.hideAmount = false,
  }) : super(key: key);

  @override
  _CardCheckoutState createState() => _CardCheckoutState(charge, onResponse);
}

class _CardCheckoutState extends BaseCheckoutMethodState<CardCheckout> {
  final Charge _charge;

  _CardCheckoutState(this._charge, OnResponse<CheckoutResponse> onResponse) : super(onResponse, CheckoutMethod.card);

  @override
  Widget buildAnimatedChild() {
    var amountText = _charge.amount.isNegative ? '' : Utils.formatAmount(_charge.amount);

    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Text(
            Strings.cardInputInstruction,
            key: Key("InstructionKey"),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          new SizedBox(
            height: 20.0,
          ),
          new CardInput(
            key: Key("CardInput"),
            buttonText: widget.hideAmount ? "Continue" : 'Pay $amountText',
            card: _charge.card,
            onValidated: _onCardValidated,
          ),
        ],
      ),
    );
  }

  void _onCardValidated(PaymentCard? card) {
    if (card == null) return;
    _charge.card = card;
    widget.onCardChange(_charge.card);
    widget.onProcessingChange(true);

    if (_charge.reference != null && _charge.reference!.isNotEmpty) {
      _chargeCard(_charge);
    } else {
      // This should never happen. Validation has already been done in [RexPayPlugin .checkout]
      throw new ChargeException(Strings.noReference);
    }
  }

  void _chargeCard(Charge charge) async {
    final response = await CardTransactionManager(
      charge: charge,
      context: context,
      service: widget.service,
      publicKey: widget.publicKey,
    ).chargeCard();
    onResponse(response);
  }
}
