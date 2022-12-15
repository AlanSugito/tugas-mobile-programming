import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextBoxController = TextEditingController();
  final _emailTextBoxController = TextEditingController();
  final _passwordTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _namaTextField(),
              _emailTextField(),
              _passwordTextField(),
              _passwordKonfirmasiTextField(),
              _buttonRegistrasi()
            ],
          ),
        ),
      )),
    );
  }

  Widget _namaTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama'),
      keyboardType: TextInputType.text,
      controller: _namaTextBoxController,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.text,
      controller: _emailTextBoxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }

        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zAZ]{2,}))$';

        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return 'Email tidak valid';
        }

        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'password'),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextBoxController,
      validator: (value) {
        if (value!.length < 6) {
          return "Password harus diisi minimal 6 karakter";
        }

        return null;
      },
    );
  }

  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Konfirmasi password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (value) {
          if (value != _passwordTextBoxController.text) {
            return "Konfirmasi password tidak sama";
          }

          return null;
        });
  }

  Widget _buttonRegistrasi() {
    return ElevatedButton(
      child: Text('Registrasi'),
      onPressed: () {
        var validate = _formkey.currentState!.validate();
      },
    );
  }
}
