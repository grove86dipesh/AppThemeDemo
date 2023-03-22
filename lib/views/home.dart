import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locators.dart';
import '../models/user.dart';
import '../services/user_data_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    locator<UserDataService>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List<Data>? users = Provider.of<UserDataService>(context).users;
    bool isLoading = Provider.of<UserDataService>(context).isLoading;
    int countValue = Provider.of<UserDataService>(context).isLoadingBuildAgain;
    if (kDebugMode) {
      print('##### Build Load Again');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVC Demo'),
      ),
      body: Column(
        children: [

          InkWell(
            onTap: () => locator<UserDataService>().setIsLoadingBuildAgain(),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('$countValue'),
            ),
          ),
          Expanded(
            child: (isLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: users!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Image.network(users[index].avatar!),
                          title: Text(
                            "${users[index].firstName!} ${users[index].lastName!}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          subtitle: Text(
                            users[index].email!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                          trailing: Text('ID: ${users[index].id}'),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
