import 'package:app_colabora_unimedjp/app/data/environments/environment.prod.dart';
import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/extensions/async_extensions.dart';
import 'package:get/get.dart';

class OneSignalRepository {
  ApiProvider api = ApiProvider();

  Future<Response> postSubscribeOneSignal({
    required String externalId,
    String? phoneNumber,
    String? email,
  }) async {
    const baseUrl = EnvironmentProd.ONE_SIGNAL_API_URL;
    const appId = EnvironmentProd.ONE_SIGNAL_APP_ID;
    const apiKey = EnvironmentProd.ONE_SIGNAL_API_KEY;
    final List<Map<String, String>> subscriptions = [];

    const headers = {
      "Authorization": "Basic $apiKey",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

     if (phoneNumber != null && phoneNumber.isNotEmpty) {
      subscriptions.add({
        'type': 'SMS',
        'token': phoneNumber,
      });
    }

     if (email != null && email.isNotEmpty) {
      subscriptions.add({
        'type': 'Email',
        'token': email,
      });
    }

    final payload = {
      'app_id': appId,
      'identity': {'external_id': externalId},
      'subscriptions': subscriptions,
    };

    return await AsyncExtension.retry(
      () => api.sendPost(
        router: '$baseUrl/apps/$appId/users',
        headers: headers,
        body: payload,
      ),
      logDebug: 'postSubscribeOneSignal',
    );
  }
}
