import 'dart:async';
import 'dart:convert';
import 'package:flutter_http/flutter_http.dart';
import 'package:flutter_http/model/api_response.dart';
import 'package:flutter_http/utils/common_utils.dart';
import 'package:http/http.dart' as http;

import 'contact_data.dart';

class RandomUserRepository implements ContactRepository {
  static const _kRandomUserUrl = 'http://api.randomuser.me/?results=50';
  final JsonDecoder _decoder = const JsonDecoder();

  @override
  Future<List<Contact>> fetch() async {
    ApiResponse apiResponse = await Network().callNetwork(RequestType.get, Uri.parse(_kRandomUserUrl));

    CommonUtils().printLog('Body :: ${(apiResponse.getData! is Map<String, dynamic>)}');
    if(apiResponse.getError == null && apiResponse.getData != null){
      final List contactItems = (apiResponse.getData! as Map<String, dynamic>)['results'];

      return contactItems
          .map((contactRaw) => Contact.fromMap(contactRaw))
          .toList();
    }else{
      throw FetchDataException(
          "Error while getting contacts [StatusCode:${apiResponse.getError!.code}, Error:${apiResponse.getError!.message}]");
    }
  }
}
