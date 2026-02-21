import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:get/get.dart';

import '../../modules/utils/extensions/async_extensions.dart';

class ManualsRepository {
  ApiProvider api = ApiProvider();

  Future<Response> getManuals() async {
    return await AsyncExtension.retry(
      () => api.sendGet(router: '/manuals'),
      logDebug: 'getManuals',
    );
  }
}
