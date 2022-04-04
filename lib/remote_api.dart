import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_example/model/user_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<UserModel>> _getUserList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Remote API with DIO',
        ),
      ),
      body: const Center(
        child: Text(''),
      ),
    );
  }
}
