import 'package:flutter/material.dart';

import '../constants.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(fontSize: 25),
            ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Home'),
            onTap: () => {Navigator.pushNamed(context, '/')},
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Users'),
            onTap: () => {Navigator.pushNamed(context, '/users')},
          ),
          ListTile(
            leading: Icon(Icons.model_training),
            title: Text('v${packageInfo.version}'),
          ),
        ],
      ),
    );
  }
}
