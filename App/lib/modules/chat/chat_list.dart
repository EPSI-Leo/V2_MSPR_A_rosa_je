import 'package:arosa_je/modules/chat/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class PeoplePage extends StatelessWidget {
  final List<types.User> users = [
    types.User(id: '1', firstName: 'John', lastName: 'Doe'),
    types.User(id: '2', firstName: 'Jane', lastName: 'Smith'),
    types.User(id: '3', firstName: 'Alice', lastName: 'Johnson'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('People')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('${user.firstName} ${user.lastName}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
