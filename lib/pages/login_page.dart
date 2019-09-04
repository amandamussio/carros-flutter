import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  Form _body() {
    return Form(
          key: _formKey, //gaurda o estado do formulario
          child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              textFormField("Login", "Digite o login", controller: _tLogin, validator: _validateLogin, keyboardType: TextInputType.emailAddress,),
              SizedBox(height: 10),
              textFormField("Senha", "Digite a senha", password: true, controller: _tSenha, validator: _validateSenha, keyboardType: TextInputType.number,),
              SizedBox(height: 20),
              _button("Entrar",_onClickLogin),
            ],
        ),
      ),
    );
  }

  void _onClickLogin() {

    if(_formKey.currentState.validate()) { //executa os validators do form
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
  }

  Container _button(String text, Function onPressed) {
    return Container(
        height: 46,
        child: RaisedButton(
          color: Colors.blue,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 22,),
          ),
          onPressed: onPressed,
        )
      );
  }

  TextFormField textFormField(String label, String hint,
      {bool password = false, TextEditingController controller, Function validator, TextInputType keyboardType}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: password,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.dark, //padrao dark
      style: TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
          )),
    );
  }

  String _validateLogin(String text) {
    if(text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if(text.isEmpty) {
      return "Digite a senha";
    }
    if(text.length < 3) {
      return "Precisa ter pelo menos 3 caracteres";
    }
    return null;
  }
}
