import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'group_page.dart';
import 'friends_page.dart';

class GroupInfo extends StatefulWidget {
   final String _groupName;

   GroupInfo(this._groupName);

  @override
  State<GroupInfo> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(widget._groupName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FriendsPage()));
            },
            icon: const Icon(Icons.people)),
        ]
       ),
       body: Column(
        children: [
          Prompt("Challenge: Take a photo with your friends at Dinner!", widget._groupName),
          Prompt("Challenge: Take a photo with your friends at sunset!", widget._groupName),
        ],
       )
    );
  }
}

class Prompt extends StatefulWidget {

  final String _promptName;
  final String _groupName;
  
  Prompt(this._promptName, this._groupName);

  @override
  State<Prompt> createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column(
        children: [
          MUIPrimaryButton(
            text: widget._promptName,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GroupPage(widget._promptName, widget._groupName)));
            })
        ],
        ),
      
    );
  }
}