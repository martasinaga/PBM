// import 'package:flutter/material.dart';
// import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

// String username = "";
// String password = "";

// class RegisterPage extends StatelessWidget {
//   RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //TODO : Buat tampilan register
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


String username = "";
String password = "";

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  void _register(BuildContext context) {
    if (_passwordController.text == _confirmPasswordController.text) {
      // register berhasil
      username = _usernameController.text;
      password = _passwordController.text;
      Navigator.pushReplacementNamed(context, '/');
    } else {
      // password dan confirm password tidak cocok
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Password dan Confirm Password tidak cocok."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 122, 152, 250)
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _register(context);
              },
              child: Text("Register"),
              style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text("Login",
                  style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
