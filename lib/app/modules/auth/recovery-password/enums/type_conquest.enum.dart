enum TypeConquestEnum {
  certificado('CERTIFICADO'),
  emblema('EMBLEMA');

  final String key;

  const TypeConquestEnum(this.key);
}

enum TypeIconConquestEnum {
  trofeu('TROFEU', 'setor_destaque.svg'),
  colaborador_pontual('COLABORADOR_PONTUAL', 'colaborador_pontual.svg'),
  talento_ouro('TALENTO_OURO', 'talento_ouro.svg'),
  passaport_pat_total('PASSAPORTE_PAT_TOTAL', 'passaporte.svg'),
  setorDestaque('SETOR_DESTAQUE', 'setor_destaque.svg');

  final String key;
  final String icon;

  const TypeIconConquestEnum(this.key, this.icon);

  static String getIconByKey(String key) {
    try {
      return TypeIconConquestEnum.values.firstWhere((e) => e.key == key).icon;
    } catch (e) {
      return '';
    }
  }
}
