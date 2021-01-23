import 'package:flutter/material.dart';
import 'package:social_network/widgets/nav_drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavDrawer(),
      body: Text("asd"),
    );
  }
}