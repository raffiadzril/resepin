import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/login/newPasswordSucceed.dart'; // Import the success screen


class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  NewPasswordState createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswords() {
    setState(() {
      _passwordsMatch = _passwordController.text == _confirmPasswordController.text;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text == _confirmPasswordController.text) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewPasswordSucceed(), // Using imported screen
          ),
        );
      } else {
        setState(() {
          _passwordsMatch = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Buat ulang kata sandi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Kata sandi baru Anda harus berbeda dari kata sandi yang pernah digunakan sebelumnya.",
                  style: TextStyle(
                    color: Color(0xFF706D6D),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Kata sandi baru",
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan kata sandi';
                    }
                    if (value.length < 8) {
                      return 'Minimal 8 karakter';
                    }
                    return null;
                  },
                  onChanged: (value) => _checkPasswords(),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Harus terdiri dari minimal 8 karakter.",
                  style: TextStyle(
                    color: Color(0xFF706D6D),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Konfirmasi kata sandi baru",
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap konfirmasi kata sandi';
                    }
                    if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
                  onChanged: (value) => _checkPasswords(),
                ),
                if (!_passwordsMatch)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Kata sandi tidak cocok",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                const Text(
                  "Kata sandi harus cocok satu sama lain.",
                  style: TextStyle(
                    color: Color(0xFF706D6D),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE6303B),
                      padding: const EdgeInsets.symmetric(horizontal: 86, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Lanjutkan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}