import 'package:flutter/material.dart';
import 'package:rexpay/src/core/common/rexpay.dart';
import 'package:rexpay/src/models/checkout_response.dart';
import 'package:rexpay/src/views/animated_widget.dart';
import 'package:rexpay/src/views/checkout/checkout_widget.dart';

abstract class BaseCheckoutMethodState<T extends StatefulWidget> extends BaseAnimatedState<T> {
  final OnResponse<CheckoutResponse> onResponse;
  final CheckoutMethod _method;

  BaseCheckoutMethodState(this.onResponse, this._method);

  CheckoutMethod get method => _method;
}
