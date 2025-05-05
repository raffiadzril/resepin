import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/providers/theme_notifier.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final textColor = isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryTextColor = isDarkMode ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final backgroundColor = isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
    final containerColor = isDarkMode ? AppColors.darkBox : AppColors.lightBox;
    final borderColor = isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.darkBackground : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masuk ke akun anda.",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Tolong masuk ke akun anda",
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Alamat e-mail",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Masukkan e-mail",
                      hintStyle: TextStyle(color: secondaryTextColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      filled: true,
                      fillColor: containerColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Kata sandi",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: passwordController,
                    obscureText: obscureText,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Masukkan kata sandi",
                      hintStyle: TextStyle(color: secondaryTextColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      filled: true,
                      fillColor: containerColor,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: secondaryTextColor,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/new-password-succeed');
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Tidak memiliki akun? ",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "Daftar di sini.",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}