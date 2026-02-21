import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/faq.model.dart';
import '../../../../data/repository/faq.repository.dart';
import '../../../../data/utils/statuscode_validator.dart';
import '../../../utils/components/alerts/snackbar_app.component.dart';

class FaqController extends GetxController {
  FaqRepository repo = FaqRepository();
  ValueNotifier<List<FaqModel>> listFAQs = ValueNotifier([]);

  @override
  void onReady() {
    getFaq();
    super.onReady();
  }

  getFaq() async {
    Response res = await repo.getFaqs();
    await AuthStatusCode.getStatus(
      res,
      (success) {
        List<FaqModel> list = [];
        if (res.body != null) {
          for (var i in res.body['content']) {
            FaqModel data = FaqModel.fromJson(i);
            list.add(data);
          }
          listFAQs.value = list;
        }
      },
      (error) async {
        await SnackbarAppComponent.show(Get.context!, text: error);
      },
    );
  }
}
