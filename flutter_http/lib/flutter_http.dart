library flutter_http;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_http/utils/common_utils.dart';
import 'package:http/http.dart' as http;

import 'model/api_error.dart';
import 'model/api_response.dart';

enum RequestType { get, post, file }

abstract class NetworkCallBack {
  void onLoadComplete(ApiResponse apiResponse);

  void onLoadError(ApiResponse apiResponse);
}

/// A Networking.
class Network {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  final int requestTimeout = 30;

  // final NetworkCallBack _networkCallBack;

  // Network(this._networkCallBack);

  Network();

  Duration timeoutDuration() {
    return Duration(seconds: requestTimeout);
  }

  http.Response timeoutCallBack() {
    return http.Response(
        'Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while!',
        408);
  }

  Future<ApiResponse> callNetwork(
    RequestType requestType,
    Uri url, {
    Map<String, String>? headersMap,
    Map<String, dynamic>? bodyMap,
    Map<String, String>? fieldsMap,
    List<http.MultipartFile>? files,
  }) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      http.Response? response;

      if (requestType == RequestType.get) {
        CommonUtils().printLog(
            'Request {${requestType.toString()} || {Url} ${url.toString()} || {headersMap} : ${headersMap.toString()}');
        response = await http.get(url, headers: headersMap).timeout(
              timeoutDuration(),
              onTimeout: timeoutCallBack,
            );
      } else if (requestType == RequestType.post) {
        CommonUtils().printLog(
            'Request {${requestType.toString()} || {Url} ${url.toString()} || {body} : ${bodyMap.toString()} || {headers} : ${headersMap.toString()}');
        response =
            await http.post(url, body: bodyMap, headers: headersMap).timeout(
                  timeoutDuration(),
                  onTimeout: timeoutCallBack,
                );
      } else if (requestType == RequestType.file) {
        CommonUtils().printLog(
            'Request {${requestType.toString()} || {Url} ${url.toString()} || {fields} : ${fieldsMap.toString()} || {headers} : ${headersMap.toString()}');
        var request = http.MultipartRequest('POST', url);
        request.headers.addAll(headersMap ?? {});
        request.fields.addAll(fieldsMap ?? {});
        request.files.addAll(files ?? []);

        response = await http.Response.fromStream(await request.send()).timeout(
          timeoutDuration(),
          onTimeout: timeoutCallBack,
        );
      }

      if (response != null) {
        CommonUtils().printLog(
            "${response.statusCode} :: $bodyMap :: \n${response.body.toString().replaceAll("\n", "")}");
        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          apiResponse.data = data;
        } else {
          apiResponse = await handleError(response);
          // _networkCallBack.onLoadError(apiResponse);
        }
      } else {
        apiResponse.apiError = ApiError(
            requestCode: 408,
            error: "Error occurred while communication with Server!");
        // _networkCallBack.onLoadError(apiResponse);
      }
    } on TimeoutException catch (_) {
      // A timeout occurred.
      apiResponse.apiError = ApiError(
          requestCode: 408,
          error:
              "Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while!");
    } on SocketException {
      apiResponse.apiError = ApiError(
          requestCode: 0,
          error: "Error occurred while communication with Server!");
    }
    return Future.value(apiResponse);
  }

  Future<ApiResponse> handleError(var response) async {
    ApiResponse apiResponse = ApiResponse();

    switch (response.statusCode) {
      case 401:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        // String refreshToken = await MyPreference().getRefreshToken();
        // if (refreshToken.isNotEmpty) {
        //   ApiResponse checkForceLogout = await getRefreshToken();
        //   if (checkForceLogout.getIsLogout) apiResponse = checkForceLogout;
        //
        //   apiResponse.isTokenExp = true;
        // }

        break;
      case 400:
        apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
        break;
      case 408:
        CommonUtils().printLog(
            "handleError(408): ${response.statusCode} -> ${response.body.toString().replaceAll("\n", "")}");
        apiResponse.apiError = ApiError(
            requestCode: response.statusCode,
            error: '${response.body.toString().replaceAll("\n", "")}!');
        break;
      default:
        apiResponse.apiError = ApiError(
            requestCode: response.statusCode, error: 'Database error!');
        break;
    }
    return apiResponse;
  }
}
