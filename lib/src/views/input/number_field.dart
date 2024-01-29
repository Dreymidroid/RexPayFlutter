import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rexpay/src/core/common/card_utils.dart';
import 'package:rexpay/src/core/common/my_strings.dart';
import 'package:rexpay/src/models/card.dart';
import 'package:rexpay/src/views/common/input_formatters.dart';
import 'package:rexpay/src/views/input/base_field.dart';

class NumberField extends BaseTextField {
  NumberField(
      {Key? key,
      required PaymentCard? card,
      required TextEditingController? controller,
      required FormFieldSetter<String> onSaved,
      required Widget suffix})
      : super(
          key: key,
          labelText: 'CARD NUMBER',
          hintText: '0000 0000 0000 0000',
          controller: controller,
          onSaved: onSaved,
          suffix: suffix,
          validator: (String? value) => validateCardNum(value, card),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, new LengthLimitingTextInputFormatter(19), new CardNumberInputFormatter()],
        );

  static String? validateCardNum(String? input, PaymentCard? card) {
    if (input == null || input.isEmpty) {
      return Strings.invalidNumber;
    }

    input = CardUtils.getCleanedNumber(input);

    return card!.validNumber(input) ? null : Strings.invalidNumber;
  }
}
