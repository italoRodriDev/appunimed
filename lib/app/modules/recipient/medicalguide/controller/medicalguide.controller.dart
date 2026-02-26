import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/medical_guide.model.dart';

class MedicalGuideController extends GetxController {
  ValueNotifier<List<MedicalGuideModel>> listMedicalGuide =
      ValueNotifier<List<MedicalGuideModel>>([
        MedicalGuideModel(
          id: 1,
          nome: "Dr. João Silva",
          especialidade: "Cardiologia",
          crm: "CRM 12345",
          endereco: "Rua A, 123",
          tipo: "Clínica",
          telefone: "(11) 99999-0000",
          whatsapp: "(11) 98888-0000",
          localizacao: "São Paulo - SP",
          cidade: "São Paulo",
          bairro: "Centro",
        ),
        MedicalGuideModel(
          id: 2,
          nome: "Dra. Maria Souza",
          especialidade: "Dermatologia",
          crm: "CRM 67890",
          endereco: "Av. Central, 456",
          tipo: "Consultório",
          telefone: "(11) 97777-0000",
          whatsapp: "(11) 96666-0000",
          localizacao: "Rio de Janeiro - RJ",
          cidade: "Rio de Janeiro",
          bairro: "Copacabana",
        ),
      ]);

  ValueNotifier<List<MedicalGuideModel>> listMedicalGuideFavorites =
      ValueNotifier<List<MedicalGuideModel>>([]);

  void favoriteMedicalGuide(MedicalGuideModel medical) {
    final currentList = List<MedicalGuideModel>.from(
      listMedicalGuideFavorites.value,
    );

    final exists = currentList.any((item) => item.id == medical.id);
    if (!exists) {
      currentList.add(medical);
      listMedicalGuideFavorites.value = currentList;
    }
  }

  void unfavoriteMedicalGuide(MedicalGuideModel medical) {
    final updatedList = listMedicalGuideFavorites.value
        .where((item) => item.id != medical.id)
        .toList();

    listMedicalGuideFavorites.value = updatedList;
  }

  void clearList() {
    listMedicalGuide.value = [];
  }
}
