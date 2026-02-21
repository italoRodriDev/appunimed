import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/finances.controller.dart';

class FinancesPage extends GetView<FinancesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FinancesPage')),

      body: SafeArea(child: Text('FinancesController')),
    );
  }
}
