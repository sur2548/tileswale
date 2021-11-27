import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tileswale/services/preference_service.dart';

import '../../get.dart';

class ProfileScreen extends StatelessWidget {
  final pref = locate<PreferenceService>();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = pref.getUser()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.indigo,
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
