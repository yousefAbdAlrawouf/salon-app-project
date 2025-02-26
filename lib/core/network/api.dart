import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:salon_app/core/network/api_request.dart';
import 'package:salon_app/core/network/api_response.dart';

class API {
  final Dio dio;
  API({required this.dio});

  final List<CancelToken> _cancelTokens = [];

  Future<ApiResponse> get(ApiRequest apirequest) async {
    if (apirequest.allowCancel) {
      cancelAllRequests();
    }

    final CancelToken _cancelToken = CancelToken();
    _cancelTokens.add(_cancelToken);

    final response = await dio.get(
      apirequest.url,
      cancelToken: _cancelToken,
    );
    return ApiResponse(
      statusCode: response.statusCode ?? -1,
      body: response.data,
    );
  }

  Future<ApiResponse> post(ApiRequest apirequest) async {
    final response = await dio.post(
      apirequest.url,
      data: apirequest.body,
    );
    return ApiResponse(
      statusCode: response.statusCode ?? -1,
      body: response.data,
    );
  }

  Future<ApiResponse> delete(ApiRequest apirequest) async {
    final response = await dio.delete(
      apirequest.url,
      data: apirequest.body, 
    );
    return ApiResponse(
      statusCode: response.statusCode ?? -1,
      body: response.data,
    );
  }

  Future<ApiResponse> put(ApiRequest apirequest) async {
    final response = await dio.put(
      apirequest.url,
      data: apirequest.body,
    );
    return ApiResponse(
      statusCode: response.statusCode ?? -1,
      body: response.data,
    );
  }

  void cancelAllRequests() {
    for (CancelToken cancelToken in _cancelTokens) {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel("All requests canceled by user.");
      }
    }
    _cancelTokens.clear();
    log("Cleared Successfully");
  }
}
