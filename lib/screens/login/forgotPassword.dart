import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/login/emailVerift.dart'; 

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    });
  }

  void _navigateToEmailVerify() {
    if (_isEmailValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailVerify(email: _emailController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Masukkan alamat email yang valid',
            style: TextStyle(
              color: Provider.of<ThemeNotifier>(context, listen: false).isDarkMode
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          backgroundColor: Provider.of<ThemeNotifier>(context, listen: false).isDarkMode
              ? AppColors.darkBox
              : AppColors.lightBox,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    final textColor = isDarkMode ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryTextColor = isDarkMode ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final backgroundColor = isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
    final containerColor = isDarkMode ? AppColors.darkBox : AppColors.lightBox;
    final borderColor = isDarkMode ? Colors.grey.shade700 : const Color(0xFFD9D9D9);

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
          constraints: const BoxConstraints.expand(),
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: isDarkMode ? AppColors.darkBackground : const Color(0xFFF9FAFB),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 5, left: 20, right: 54),
                            child: Text(
                              "Lupa kata sandi",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16, left: 21),
                            child: Text(
                              "Masukkan email Anda untuk menerima kode verifikasi",
                              style: TextStyle(
                                color: secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 6, left: 20),
                            child: Text(
                              "Alamat e-mail",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(11),
                              color: containerColor,
                            ),
                            margin: const EdgeInsets.only(bottom: 35, left: 21, right: 21),
                            height: 52,
                            width: double.infinity,
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: textColor),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'contoh@email.com',
                                hintStyle: TextStyle(color: secondaryTextColor),
                              ),
                              onChanged: _validateEmail,
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: _navigateToEmailVerify,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
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
                          const SizedBox(height: 20),
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