import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/login/loginScreen.dart'; // Pastikan file ini ada
import 'package:resepin/screens/login/newPasswordSucceed.dart'; // Pastikan file ini ada

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreeToTerms = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _register() {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap menyetujui syarat dan ketentuan yang tertera'),
        ),
      );
      return;
    }

    // Lakukan proses pendaftaran di sini

    // Navigasi ke halaman NewPasswordSucceed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPasswordSucceed()),
    );
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFFF9FAFB),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 83),
                          const Text(
                            "Buat akun baru.",
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Daftar resepin untuk mencari dan berkreasi dengan resep-resep yang enak.",
                            style: TextStyle(
                              color: Color(0xFF706D6D),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Alamat e-mail",
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                            ),
                            height: 52,
                            width: double.infinity,
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Nama pengguna",
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                            ),
                            height: 52,
                            width: double.infinity,
                            child: TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Kata sandi",
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFD9D9D9),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                            ),
                            height: 52,
                            width: double.infinity,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  checkboxTheme: CheckboxThemeData(
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.red; // Warna ketika dicentang
                                      }
                                      return Colors.grey; // Warna ketika tidak dicentang
                                    }),
                                  ),
                                ),
                                child: Checkbox(
                                  value: _agreeToTerms,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _agreeToTerms = value ?? false;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color(0xFF262626),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      const TextSpan(text: "Saya setuju dengan "),
                                      TextSpan(
                                        text: "syarat",
                                        style: const TextStyle(color: Colors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => print('Syarat diklik'),
                                      ),
                                      const TextSpan(text: " dan "),
                                      TextSpan(
                                        text: "ketentuan",
                                        style: const TextStyle(color: Colors.red),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => print('Ketentuan diklik'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: _register,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE6303B),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 105, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: GestureDetector(
                              onTap: _navigateToLogin,
                              child: const Text.rich(
                                TextSpan(
                                  text: "Sudah memiliki akun? ",
                                  style: TextStyle(
                                    color: Color(0xFF706D6D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Masuk di sini.",
                                      style: TextStyle(
                                        color: Color(0xFFE6303B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 201),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
