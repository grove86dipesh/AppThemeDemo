import '../utils/common_utils.dart';

class ApiError {
  int code = 0;
  String message = '';
  dynamic data;

  ApiError({required int requestCode, required String? error}) {
    code = requestCode;
    message = error!;
  }

  /*String get error => _error;
  set error(String error) => _error = error;*/

  ApiError.fromJson(Map<String, dynamic> json) {
    code = json.containsKey('responseCode') ? json['responseCode'] : -1;
    message = json.containsKey('message') ? json['message'] : '';
    if (json.containsKey('error') && json['error'] != null) {
      if (json['error'] is List) {
        CommonUtils().printLog('Error Is List ${json['error']}');
        data = json['error'];
        // json['error'].forEach((v) {
        //   data.add(ErrorResponse.fromJson(v));
        // });
      } else if (json['error'] is Map) {
        CommonUtils().printLog('Error Is Map ${json['error']}');
        data = ErrorResponse.fromJson(json['error']);
      } else if (json['error'] is bool) {
        CommonUtils().printLog('Error Is Bool');
        data = true;
      } else if (json['error'] is Object) {
        CommonUtils().printLog('Error Is Object');
        data = ErrorResponse.fromJson(json['error']);
      } else if (json['error'] is String) {
        CommonUtils().printLog('Error Is String');
        data = json['error'];
      } else {
        data = json['error'];
      }
      /**/
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataInner = <String, dynamic>{};
    dataInner['responseCode'] = code;
    dataInner['message'] = message;
    if (data != null) {
      dataInner['error'] = data;
    }
    return dataInner;
  }
}

class ErrorResponse {
  String? _code;
  String? _message;
  String? _errMsg;

  ErrorResponse(
      {required String code, required String message, required String errMsg}) {
    _code = code;
    _message = message;
    _errMsg = errMsg;
  }

  String get code => _code ?? '';

  set code(String code) => _code = code;

  String get message => _message ?? '';

  set message(String message) => _message = message;

  String get errMsg => _errMsg ?? '';

  set errMsg(String message) => _errMsg = message;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    _code = json.containsKey('code') ? '${json['code']}' : '-1';

    if (json.containsKey('errMsg') && json['errMsg'] != null) {
      json['message'] = json['errMsg'];
    }
    _message = json.containsKey('message') ? json['message'] : '';
    _errMsg = json.containsKey('errMsg') ? json['errMsg'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    data['message'] = _message;
    data['errMsg'] = _errMsg;
    return data;
  }
}
