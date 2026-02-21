import 'package:app_colabora_unimedjp/app/data/models/contract.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/sqlite.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContractsService extends GetxService {
  ValueNotifier<List<ContractModel>> listContracts = ValueNotifier([]);
  ValueNotifier<ContractModel?> contract = ValueNotifier(null);

  Future<ContractsService> init() async {
    return this;
  }

  getContracts() async {
    var data = await SqliteApi.getContract();
    if (data.isNotEmpty) {
      listContracts.value = data;
      contract.value = data[0];
    }
  }

  setContract(int idContract) async {
    var data = await SqliteApi.getContract();
    var result = data.where((el) => el.id == idContract);
    if (result.isNotEmpty) {
      contract.value = result.first;
    }
  }
}
