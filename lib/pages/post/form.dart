import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/bloc/comment/comment_bloc.dart';
import 'package:social_network/bloc/comment/comment_event.dart';
import 'package:social_network/bloc/comment/comment_state.dart';
import 'package:social_network/model/comment.dart';

class NewTaskForm extends StatefulWidget {
  int postId;
  NewTaskForm({
    this.postId,
    Key key,
  }) : super(key: key);

  @override
  NewTaskFormState createState() => NewTaskFormState();
}

class NewTaskFormState extends State<NewTaskForm> {
  final _formKey = GlobalKey<FormState>();
  Comment comment = new Comment();
  var rng = Random();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Expanded(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: TextFormField(
                    key: Key("nameField"),
                    onSaved: (val) => comment.name = val,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter a name for your task";
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: TextFormField(
                    key: Key("mailField"),
                    onSaved: (val) => comment.email = val,
                    decoration: InputDecoration(
                      labelText: "mail",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: TextFormField(
                    maxLines: 4,
                    onSaved: (val) => comment.body = val,
                    decoration: InputDecoration(
                      labelText: "Notes",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Create Task"),
                  onPressed: () => _submitForm(context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _submitForm(BuildContext context) {
    // More to be added here
    if (_formKey.currentState.validate()) {
          final CommentBloc commentBloc = BlocProvider.of<CommentBloc>(context);

      _formKey.currentState.save();
      Navigator.of(context).pop();
      print(widget.postId.toString());
      comment.postId = widget.postId;
      comment.id = rng.nextInt(10000);
      print(comment.toString());
      commentBloc.add(CommentAddEvent(comment));
    }
  }
}

class NewTaskScreen extends StatelessWidget {
  int postId;
  NewTaskScreen({this.postId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 24, left: 16, right: 16),
                  child: Text(
                    "New Transaction",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Adding the form here
            NewTaskForm(
              postId: postId,
            ),
          ],
        ),
      ),
    );
  }
}
