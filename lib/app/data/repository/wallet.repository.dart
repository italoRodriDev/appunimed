import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:get/get.dart';

import '../../modules/utils/extensions/async_extensions.dart';

class WalletRepository {
  ApiProvider api = ApiProvider();

  Future<Response> getWallets() async {
    return await AsyncExtension.retry(
      () => api.sendGet(router: '/wallet'),
      logDebug: 'getWallet',
    );
  }
}
