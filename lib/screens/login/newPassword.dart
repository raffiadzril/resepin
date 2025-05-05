import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'newPasswordSucceed.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => NewPasswordState();
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
      if (_passwordsMatch) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewPasswordSucceed()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Switch(
                      value: isDark,
                      onChanged: (value) => themeNotifier.toggleTheme(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Buat ulang kata sandi",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Kata sandi baru Anda harus berbeda dari kata sandi yang pernah digunakan sebelumnya.",
                  style: TextStyle(
                    color: isDark ? Colors.grey[400] : const Color(0xFF706D6D),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                _buildLabel("Kata sandi baru", isDark),
                const SizedBox(height: 8),
                _buildPasswordField(_passwordController, isDark),
                const SizedBox(height: 4),
                _buildHint("Harus terdiri dari minimal 8 karakter.", isDark),
                const SizedBox(height: 24),
                _buildLabel("Konfirmasi kata sandi baru", isDark),
                const SizedBox(height: 8),
                _buildPasswordField(_confirmPasswordController, isDark),
                if (!_passwordsMatch)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "Kata sandi tidak cocok",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 24),
                _buildHint("Kata sandi harus cocok satu sama lain.", isDark),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
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

  Widget _buildLabel(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        color: isDark ? Colors.white : const Color(0xFF262626),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildHint(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        color: isDark ? Colors.grey[400] : const Color(0xFF706D6D),
        fontSize: 12,
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, bool isDark) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Colors.grey[900] : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: (value) {
        if (controller == _passwordController) {
          if (value == null || value.isEmpty) return 'Harap masukkan kata sandi';
          if (value.length < 8) return 'Minimal 8 karakter';
        } else {
          if (value == null || value.isEmpty) return 'Harap konfirmasi kata sandi';
          if (value != _passwordController.text) return 'Kata sandi tidak cocok';
        }
        return null;
      },
      onChanged: (_) => _checkPasswords(),
    );
  }
}
