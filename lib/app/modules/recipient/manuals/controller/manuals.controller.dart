import 'package:app_colabora_unimedjp/app/data/models/manual.model%20copy.dart';
import 'package:app_colabora_unimedjp/app/data/repository/manuals.repository.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/utils/statuscode_validator.dart';

class ManualsController extends GetxController {
  ManualsRepository repo = ManualsRepository();
  ValueNotifier<List<ManualModel>> listManuals = ValueNotifier([]);

  @override
  void onReady() {
    getFaq();
    super.onReady();
  }

  getFaq() async {
    Response res = await repo.getManuals();
    await AuthStatusCode.getStatus(
      res,
      (success) {
        List<ManualModel> list = [];
        if (res.body != null) {
          for (var i in res.body['content']) {
            ManualModel data = ManualModel.fromJson(i);
            list.add(data);
          }
          listManuals.value = list;
        }
      },
      (error) async {
        await SnackbarAppComponent.show(Get.context!, text: error);
      },
    );
  }
}
