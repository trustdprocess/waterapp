import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterapp/login/login.dart';
import 'package:waterapp/theme/theme.dart';
import 'package:waterapp/themeChanger/mode.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => loginpage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              theme.toggle();
            },
            icon: theme.defaultTheme == darkmode
                ? Icon(CupertinoIcons.moon)
                : Icon(
                    Icons.sunny,
                    color: Colors.yellow,
                  ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text("1"),
          ),
          IconButton(onPressed: _logout, icon: Icon(Icons.exit_to_app)),
        ],
      ),
    );
  }
}
