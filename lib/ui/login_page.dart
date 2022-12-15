import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextBoxController = TextEditingController();
  final _passwordTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _emailTextField(),
                  _passwordTextField(),
                  _buttonLogin(),
                  SizedBox(
                    height: 30,
                  ),
                  _menuRegistrasi()
                ]),
              ))),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextBoxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }

        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      controller: _emailTextBoxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password harus diisi';
        }

        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
        onPressed: () {
          var validate = _formKey.currentState!.validate();
        },
        child: Text('Login'));
  }

  Widget _menuRegistrasi() {
    return Center(
        child: InkWell(
      child: Text(
        "Registrasi",
        style: TextStyle(color: Colors.blue),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegistrasiPage()));
      },
    ));
  }
}
