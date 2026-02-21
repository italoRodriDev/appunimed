import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/wallet.repository.dart';

class PreviewWalletController extends GetxController {
  WalletRepository repo = WalletRepository();
  final ValueNotifier<int> timeSendCode = ValueNotifier(0);

  startTime() {
    timeSendCode.value = 60;
    Timer.periodic(Duration(seconds: 1), (timer) {
      timeSendCode.value--;
      if (timeSendCode.value == 0) {
        timer.cancel();
      }
    });
  }
}
