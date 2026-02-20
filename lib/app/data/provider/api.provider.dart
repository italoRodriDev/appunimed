// Refaça de forma que eu possa passar headers personalizado tratando
import 'dart:async';
import 'dart:io';

import 'package:app_colabora_unimedjp/app/data/environments/environment.dart';
import 'package:app_colabora_unimedjp/app/data/keys/shared_preferences.keys.dart';
import 'package:app_colabora_unimedjp/app/data/utils/token_validator.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/authentication.service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/config.service.dart';

const baseUrl = EnvironmentDev.URL_DNS;

class ApiProvider extends GetConnect {
  final ConfigService configService = Get.find<ConfigService>();

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 40);
    httpClient.errorSafety = false;
  }

  Future<Response> _handleRequest(
    Future<Response> Function(Map<String, String> headers) request, {
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    String? token,
    Map<String, String>? customHeaders,
  }) async {
    const int maxRetries = 5;
    int attempt = 0;

    try {
      if (!skipLoading) {
        configService.increasseLoadingQueue();
      }

      final defaultHeaders = await TokenValidator.getHeaders(
        skipAuthorization: skipAuthorization,
        token: token,
      );

      final mergedHeaders = {
        ...defaultHeaders,
        if (customHeaders != null) ...customHeaders,
      };

      while (attempt < maxRetries) {
        attempt++;

        final response = await request(mergedHeaders).timeout(
          const Duration(seconds: 40),
          onTimeout: () => const Response(
            statusCode: 1501,
            body: {
              "message": "Tempo de resposta excedido, verifique sua conexão.",
            },
            statusText: "Timeout",
          ),
        );

        if (response.statusCode == null) {
          if (attempt < maxRetries) {
            await Future.delayed(
              Duration(milliseconds: millisecondsRequest ?? 500 * attempt),
            );
            continue;
          }

          return const Response(
            statusCode: 1503,
            body: {"message": "Sem resposta do servidor."},
          );
        }

        if (response.statusCode != 403) {
          return response;
        }

        if (attempt < maxRetries) {
          await Future.delayed(
            Duration(milliseconds: millisecondsRequest ?? 500 * attempt),
          );
        }
      }

      // Se chegou aqui → token inválido
      final authService = Get.find<AuthenticationService>();
      authService.deleteDataAuthentication();
      Get.offAllNamed(RoutesApp.LOGIN);

      return const Response(
        statusCode: 1502,
        body: {"message": "Sessão expirada. Faça login novamente."},
        statusText: "Sessão expirada",
      );
    } on InvalidTokenException {
      final authService = Get.find<AuthenticationService>();
      authService.deleteDataAuthentication();
      Get.offAllNamed(RoutesApp.LOGIN);

      return const Response(
        statusCode: 1502,
        body: {"message": "Token inválido ou expirado."},
      );
    } on SocketException {
      return const Response(
        statusCode: 1500,
        body: {"message": "Sem conexão com a internet."},
      );
    } on TimeoutException {
      return const Response(
        statusCode: 1501,
        body: {"message": "Tempo de resposta excedido."},
      );
    } catch (e) {
      return Response(
        statusCode: 1503,
        body: {"message": "Erro inesperado: ${e.toString()}"},
      );
    } finally {
      if (!skipLoading) {
        configService.decreasseLoadingQueue();
      }
    }
  }

  Future<Response> sendGet({
    required String router,
    Map<String, dynamic>? query,
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    String? token,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      (mergedHeaders) =>
          get(baseUrl + router, headers: mergedHeaders, query: query),
      skipAuthorization: skipAuthorization,
      skipLoading: skipLoading,
      millisecondsRequest: millisecondsRequest,
      token: token,
      customHeaders: headers,
    );
  }

  Future<Response> sendPost({
    required String router,
    dynamic body,
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    Map<String, String>? headers,
  }) async {
    return await _handleRequest(
      (mergedHeaders) => post(baseUrl + router, body, headers: mergedHeaders),
      skipAuthorization: skipAuthorization,
      skipLoading: skipLoading,
      millisecondsRequest: millisecondsRequest,
      customHeaders: headers,
    );
  }

  Future<Response> sendPatch({
    required String router,
    dynamic body,
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      (mergedHeaders) => patch(baseUrl + router, body, headers: mergedHeaders),
      skipAuthorization: skipAuthorization,
      skipLoading: skipLoading,
      millisecondsRequest: millisecondsRequest,
      customHeaders: headers,
    );
  }

  Future<Response> sendPut({
    required String router,
    dynamic body,
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      (mergedHeaders) => put(baseUrl + router, body, headers: mergedHeaders),
      skipAuthorization: skipAuthorization,
      skipLoading: skipLoading,
      millisecondsRequest: millisecondsRequest,
      customHeaders: headers,
    );
  }

  Future<Response> sendDelete({
    required String router,
    bool skipAuthorization = false,
    bool skipLoading = false,
    int? millisecondsRequest,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      (mergedHeaders) => delete(baseUrl + router, headers: mergedHeaders),
      skipAuthorization: skipAuthorization,
      skipLoading: skipLoading,
      millisecondsRequest: millisecondsRequest,
      customHeaders: headers,
    );
  }
}
