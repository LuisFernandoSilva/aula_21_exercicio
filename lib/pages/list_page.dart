import 'package:aula_21_fllutter_exercicio/data/data.dart';
import 'package:aula_21_fllutter_exercicio/entites/user.dart';
import 'package:flutter/material.dart';

class ListRegister extends StatefulWidget {
  @override
  _ListRegisterState createState() => _ListRegisterState();
}

class _ListRegisterState extends State<ListRegister> {
  var users = registerList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Lista de Cadastros'),
          centerTitle: true,
        ),
        body: ListView(
          children: users.map((user) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text('${user.name}, ${user.age}'),
              subtitle: Text(user.email),
              onLongPress: () {
                setState(() {
                  users.remove(user);
                });
              },
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var user = await Navigator.of(context).pushNamed('register_page');
            setState(() {
              users.add(user as User);
            });
          },
          child: Icon(Icons.add),
        ));
  }
}
