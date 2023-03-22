import 'package:flutter_http/model/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_http/flutter_http.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Network();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}

class NetworkListener implements NetworkCallBack {
  @override
  void onLoadComplete(ApiResponse apiResponse) {
    // TODO: implement onLoadComplete
  }

  @override
  void onLoadError(ApiResponse apiResponse) {
    // TODO: implement onLoadError
  }
}
