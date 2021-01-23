import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/user/user_bloc.dart';
import 'package:social_network/bloc/user/user_state.dart';
import 'package:social_network/model/user.dart';
import 'package:social_network/pages/user/about_user.dart';

import 'package:social_network/widgets/nav_drawer.dart';

class UsersPage extends StatelessWidget {
  final String title;
  UsersPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: NavDrawer(),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserEmptyState) {
            return Center(
              child: Text('No data. Press button "Load"'),
            );
          }

          if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            return UsersList(users: state.loadedUser);
          }
        }));
  }
}

class UsersList extends StatelessWidget {
  final List<User> users;

  UsersList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AboutUser(
                          user: users[index],
                        )),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(users[index].name),
                      Text(users[index].username)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
