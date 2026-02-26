import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/brasil_cep.model.dart';
import '../../../../data/models/profile.model.dart';
import '../../../../data/repository/update_profile.repository.dart';
import '../../../../services/config.service.dart';
import '../../../../services/process_image.service.dart';
import '../../../utils/components/alerts/snackbar_app.component.dart';

class UpdateAccountController extends GetxController {
  final UpdateRepository repo = UpdateRepository();
  final ConfigService configService = Get.find<ConfigService>();
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();

  final TextEditingController editTextEmailCtrl = TextEditingController();
  final TextEditingController editTextCepCtrl = TextEditingController();
  final TextEditingController editTextRoadCtrl = TextEditingController();
  final TextEditingController editTextNeighborhoodCtrl =
      TextEditingController();
  final TextEditingController editTextStateCtrl = TextEditingController();
  final TextEditingController editTextCityCtrl = TextEditingController();
  final TextEditingController editTextComplementCtrl = TextEditingController();
  final TextEditingController editTextNumberCtrl = TextEditingController();
  final TextEditingController editTextPhoneCtrl = TextEditingController();

  final ValueNotifier<BrasilCepModel?> apiCepData = ValueNotifier(null);
  final ValueNotifier<dynamic> docBase64 = ValueNotifier(null);

  final Rx<bool> loadContent = false.obs;
  final RxBool acceptTerms = false.obs;

  RxBool isLoading = false.obs;

  Future<void> searchCep(BuildContext context) async {
    final String cep = editTextCepCtrl.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length == 8) {
      FocusScope.of(context).unfocus();
      final res = await repo.getDataCEP(cep);
      if (res.statusCode == 200 && res.body != null) {
        final BrasilCepModel data = BrasilCepModel.fromJson(res.body);
        apiCepData.value = data;
        editTextRoadCtrl.text = data.logradouro;
        editTextNeighborhoodCtrl.text = data.bairro;
        editTextStateCtrl.text = data.estado;
        editTextCityCtrl.text = data.localidade;
      }
    }
  }

  Future<void> validFormAddress({required BuildContext context}) async {
    if (_areAddressFieldsFilled()) {
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos antes de continuar.',
      );
    }
  }

  Future<void> validFormContact({required BuildContext context}) async {
    if (editTextPhoneCtrl.text.isNotEmpty) {
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos antes de continuar.',
      );
    }
  }

  Future<void> validFormEmail({required BuildContext context}) async {
    if (editTextEmailCtrl.text.isNotEmpty) {
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos antes de continuar.',
      );
    }
  }

  bool _areAllFieldsFilled() {
    return editTextCepCtrl.text.isNotEmpty &&
        editTextStateCtrl.text.isNotEmpty &&
        editTextCityCtrl.text.isNotEmpty &&
        editTextRoadCtrl.text.isNotEmpty &&
        editTextNeighborhoodCtrl.text.isNotEmpty &&
        editTextNumberCtrl.text.isNotEmpty &&
        editTextPhoneCtrl.text.isNotEmpty;
  }

  bool _areAddressFieldsFilled() {
    return editTextCepCtrl.text.isNotEmpty &&
        editTextStateCtrl.text.isNotEmpty &&
        editTextCityCtrl.text.isNotEmpty &&
        editTextRoadCtrl.text.isNotEmpty &&
        editTextNeighborhoodCtrl.text.isNotEmpty &&
        editTextNumberCtrl.text.isNotEmpty;
  }

  String getAddress(ProfileModel data) {
    return '${data.rua}, ${data.numero}, ${data.cep}, ${data.bairro ?? ''} - ${data.cidade}, ${data.estado}'
        .toString();
  }

  void resetData() {
    editTextCepCtrl.clear();
    editTextRoadCtrl.clear();
    editTextNeighborhoodCtrl.clear();
    editTextNumberCtrl.clear();
    editTextPhoneCtrl.clear();
    docBase64.value = null;
    apiCepData.value = null;
  }
}
