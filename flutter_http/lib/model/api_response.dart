import 'api_error.dart';

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  Object? _data;

  // _apiError will hold the error object
  ApiError? _apiError;

  bool _isTokenExp = false;
  bool _isLogout = false;

  Object? get getData => _data;

  set data(Object value) {
    _data = value;
  }

  ApiError? get getError => _apiError;

  set apiError(ApiError value) {
    _apiError = value;
  }

  bool get getIsTokenExp => _isTokenExp;

  set isTokenExp(bool tokenStatus) {
    _isTokenExp = tokenStatus;
  }

  bool get getIsLogout => _isLogout;

  set isLogout(bool logoutStatus) {
    _isLogout = logoutStatus;
  }
}
