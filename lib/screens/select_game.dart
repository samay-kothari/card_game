import 'package:cards/functions/createGame.dart';
import 'package:cards/functions/joinGame.dart';
import 'package:cards/helpers/input_box.dart';
import 'package:flutter/material.dart';

class SelectGame extends StatefulWidget {
  @override
  _SelectGameState createState() => _SelectGameState();
}

class _SelectGameState extends State<SelectGame> {

  final _formKeyCreate = GlobalKey<FormState>();
  final _formKeyJoin = GlobalKey<FormState>();

  String _createName;
  String _joinName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Game"),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.white10,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKeyCreate,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val){
                      return val.isEmpty ? "Enter name" : null;
                    },
                    onChanged: (val) {
                      setState(() {
                        _createName = val;
                      });
                    },
                    decoration: inputBox("Enter name"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.grey[500],
                    child: Text("Create new game"),
                    onPressed: () async {
                      if(_formKeyCreate.currentState.validate()) {
                        if(await createGame(_createName) == false) {
                          // TODO: add pop up
                          print("exists");
                        }
                        else {
                          // TODO: redirect to select user page
                          print("created");
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Form(
              key: _formKeyJoin,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val){
                      return val.isEmpty ? "Enter name" : null;
                    },
                    onChanged: (val) {
                      setState(() {
                        _joinName = val;
                      });
                    },
                    decoration: inputBox("Enter name"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.grey[500],
                    child: Text("Join game"),
                    onPressed: () async {
                      if(_formKeyJoin.currentState.validate()) {
                        if(await joinGame(_joinName) == false) {
                          // TODO: pop up
                          print("doesnt exist");
                        }
                        else {
                          // TODO: redirect to select player
                          print("joining");
                        }
                      }
                    },
                  ),
                ],
              )
            )
          ],
          ),
      ),
    );
  }
}