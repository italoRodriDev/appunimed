import 'dart:convert';

import 'package:app_colabora_unimedjp/app/data/keys/shared_preferences.keys.dart';
import 'package:app_colabora_unimedjp/app/data/models/authentication.model.dart';
import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:app_colabora_unimedjp/app/data/models/contract.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/sqlite.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/popup_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/authentication.service.dart';
import 'package:app_colabora_unimedjp/app/services/contracts.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/snackbar.component.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/colors/colors.dart';
import '../../../../services/biometric.service.dart';

class LoginController extends GetxController {
  final AuthenticationService authenticationService =
      Get.find<AuthenticationService>();
  TextEditingController editUserCtrl = TextEditingController();
  TextEditingController editPasswordCtrl = TextEditingController();
  RxBool isLoginBiometric = false.obs;
  RxBool isLoading = false.obs;
  Rx<String?> error = Rx(null);
  late ScrollController scrollController;

  @override
  void onInit() {
    isAuthenticate();
    scrollController = ScrollController(
      keepScrollOffset: true,
      initialScrollOffset: 0.0,
    );
    super.onInit();
  }

  @override
  void onReady() {
    resetForm();
    super.onReady();
  }

  isAuthenticate() async {
    final pToken = authenticationService.pToken;

    if (pToken != null) {
      isLoginBiometric.value = true;
    }
  }

  loginBiometric() async {
    if (isLoading.value) return;

    bool validBiometric = false;

    await Get.find<BiometricService>().authenticate(
      onSuccess: () async {
        validBiometric = true;
      },
      onError: () async {
        validBiometric = false;
        SnackbarAppComponent.show(
          Get.context!,
          text:
              "Não foi possível utilizar seu metodo de autenticação local, por favor ultilze sua senha.",
        );
        isLoginBiometric.value = false;
      },
    );

    if (!validBiometric) return;

    var decodedpToken = utf8.decode(
      base64.decode(authenticationService.pToken!),
    );

    sendLogin(userName: authenticationService.userId, password: decodedpToken);
  }

  loginForm() {
    final user = editUserCtrl.text.toLowerCase();
    final password = editPasswordCtrl.text;

    if (user.isEmpty) {
      error.value = "Campo usuário é obrigatório!";
      return;
    }

    if (password.isEmpty) {
      error.value = "Campo senha é obrigatório!";
      return;
    }

    sendLogin(userName: user, password: password);
  }

  sendLogin({required String userName, required String password}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    isLoading.value = true;
    String doc = userName.replaceAll('.', '').replaceAll('-', '');

    var body = AuthenticationModel(username: doc, password: password);

    Response res = await authenticationService.authenticate(body);

    if (res.statusCode == 200 || res.statusCode == 201) {
      isLoading.value = false;

      AuthResponseModel data = AuthResponseModel.fromJson(res.body);
      saveData(data);
      await resetForm();
    } else {
      isLoading.value = false;
      await SnackbarComponent.show(
        Get.context!,
        text: 'Erro na conexão, tente novamente.',
      );
    }
  }

  saveData(AuthResponseModel data) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(
        TOKEN_KEY,
        data.authBeneficiarioToken!.token.toString(),
      );

      await SqliteApi.database;
      await SqliteApi.clearDatabase();
      await saveProfileSqlite(data);

      if (data.contratos != null) {
        for (var element in data.contratos!) {
          await saveContractSqlite(element);
        }
      }

      Get.offAndToNamed(RoutesApp.HOME);
    } catch (e) {
      authenticationService.logout();
    }
  }

  Future<void> saveProfileSqlite(AuthResponseModel data) async {
    int result = await SqliteApi.insertProfile(data);
    var profile = await SqliteApi.getProfile();
    print(profile);
    print("Perfil inserido: $result");
  }

  Future<void> saveContractSqlite(ContractModel data) async {
    int result = await SqliteApi.insertContract(data);
    var contract = await SqliteApi.getContract();
    print(contract);
    print("Contrato inserido: $result");
    Get.find<ContractsService>().getContracts();
  }

  Future<void> checkIntroPage({
    required VoidCallback goToIntroPage,
    required VoidCallback goToHomePage,
  }) async {
    final sp = await SharedPreferences.getInstance();
    final viewIntroApp = sp.getBool(INTRO_APP_VIEW_KEY) ?? false;

    if (viewIntroApp == true) {
      goToHomePage();
    } else {
      goToIntroPage();
    }
  }

  Future<bool> showBiometric() async {
    final sp = await SharedPreferences.getInstance();
    final uToken = sp.getString('uToken');
    final pToken = sp.getString('pToken');
    return uToken != null && pToken != null;
  }

  resetForm() {
    editUserCtrl.clear();
    editPasswordCtrl.clear();
    editUserCtrl.text = '70301156433';
    editPasswordCtrl.text = '09101999';
    error.value = null;
  }

  showDialogForgetPassword(BuildContext context) {
    PopupAppComponent.show(
      context,
      titleText: 'Esqueci minha senha',
      contentText:
          'Use os mesmos dados que você \n já usa no portal GP, intranet ou \n no computador da empresa  \n para acessar o app. \n\n Se não conseguir acessar, \n fale com sua liderança.',
      imageUrl: '',
      titleButton: 'Voltar ao login',
      colorTitle: AppColor.pantone348C,
      colorText: AppColor.pantone348C,
      fontSizeTitle: 18,
      onPressedConfirm: () {},
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
