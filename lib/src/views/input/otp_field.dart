import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rexpay/src/views/input/base_field.dart';

class OtpField extends TextFormField {
  OtpField({FormFieldSetter<String>? onSaved, required Color borderColor})
      : super(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          autofocus: true,
          maxLines: 1,
          onSaved: onSaved,
          validator: (String? value) => value!.isEmpty ? 'Enter OTP' : null,
          obscureText: false,
          decoration: new InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            hintText: 'ENTER',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0)),
          ),
        );
}

class CardOTPField extends BaseTextField {
  CardOTPField({
    Key? key,
    required FormFieldSetter<String> onSaved,
    TextEditingController? controller,
  }) : super(
          key: key,
          labelText: 'OTP',
          hintText: 'Enter OTP',
          onSaved: onSaved,
          controller: controller,
          validator: (String? value) => value!.isEmpty ? 'Enter OTP' : null,
          initialValue: null,
          obscureText: false,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            // new LengthLimitingTextInputFormatter(4),
          ],
        );
}


