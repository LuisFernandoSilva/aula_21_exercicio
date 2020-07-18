import 'package:aula_21_fllutter_exercicio/entites/user.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  User _user = User();

  bool _controll = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro de Usuário'),
        leading: Icon(Icons.account_circle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(color: Colors.teal),
                  labelText: 'Nome completo',
                ),
                validator: (valor) {
                  if (valor.length < 3) return 'Nome muito curto';
                  if (valor.length > 30) return 'Nome muito longo';
                  return null;
                },
                onSaved: (newValue) {
                  _user.name = newValue;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(color: Colors.teal),
                  labelText: 'Idade',
                ),
                keyboardType: TextInputType.number,
                validator: (valor) {
                  if ((int.tryParse(valor) ?? 0) <= 0) return 'Idade Inválida';
                  return null;
                },
                onSaved: (newValue) {
                  _user.age = int.tryParse(newValue);
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  labelStyle: TextStyle(color: Colors.teal),
                  labelText: 'Email',
                ),
                validator: (value) {
                  final bool isValid = EmailValidator.validate(value);
                  if (!isValid) {
                    return 'invalido';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _user.email = newValue;
                },
              ),
              SizedBox(height: 8),
              Container(
                width: double.maxFinite,
                child: OutlineButton(
                  onPressed: () {
                    saveUser();
                    if (_controll) {
                      Navigator.of(context).pop(_user);
                    }
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.teal,
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveUser() {
    _form.currentState.save();
    snackValidate();
  }

  void snackValidate() {
    if (!_form.currentState.validate()) {
      _controll = false;
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: Duration(
              seconds: 2,
            ),
            content: Text(
              'Dados inválidos!',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.red,
          ),
        );

      return;
    }
    _controll = true;
  }
}
