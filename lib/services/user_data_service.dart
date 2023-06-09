import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserDataService extends ChangeNotifier{
  String userUrl = 'https://reqres.in/api/users';

  bool _isLoading = false;
  int _isLoadingBuildAgain = 0;

  bool get isLoading => _isLoading;


  int get isLoadingBuildAgain => _isLoadingBuildAgain;

  setIsLoadingBuildAgain(){
    _isLoadingBuildAgain++;
    notifyListeners();
  }

  List<Data>? users = [];

  Future<List<Data>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      if (kDebugMode) {
        print('Error Fetching Users');
      }
    });

    if(result.statusCode == 200){
      Map<String, dynamic> data = json.decode(result.body);
      var users = data["data"];
      if (users != null) {
        users = User.fromJson(data).data;
      }
      _isLoading = false;
      notifyListeners();
      return users;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
