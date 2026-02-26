import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/models/extract.model.dart';

class DeclarationsController extends GetxController {
  ValueNotifier<List<ExtractModel>> listDeclarations = ValueNotifier([
    ExtractModel(title: 'Declaração 2025', ano: '2025', mes: 'Janeiro'),
  ]);
}
