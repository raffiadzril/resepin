import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/core/constants/recipe_model.dart';
import 'package:resepin/providers/theme_notifier.dart';
import 'package:resepin/screens/login/newPassword.dart'; // Make sure this import exists

class EmailVerify extends StatefulWidget {
  final String email;

  const EmailVerify({super.key, required this.email});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  List<String> code = ['', '', '', ''];
  int currentIndex = 0;
  Timer? _timer;
  int _remainingSeconds = 120;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        setState(() {
          _isResendEnabled = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void handleKeyTap(String value) {
    if (currentIndex < 4) {
      setState(() {
        code[currentIndex] = value;
        currentIndex++;
      });
    }
  }

  void handleDelete() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        code[currentIndex] = '';
      });
    }
  }

  void handleSubmit() {
    if (code.every((digit) => digit.isNotEmpty)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewPassword(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap lengkapi kode verifikasi')),
      );
    }
  }

  void handleResend() {
    if (_isResendEnabled) {
      setState(() {
        _remainingSeconds = 120;
        _isResendEnabled = false;
        code = ['', '', '', ''];
        currentIndex = 0;
      });
      _startTimer();
    }
  }

  Widget _buildDigitBox(int index) {
    return Container(
      width: 60,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: code[index].isEmpty ? Colors.grey.shade300 : const Color(0xFFE6303B),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          code[index],
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String label, {VoidCallback? onTap}) {
    return Container(
      width: 72,
      height: 72,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFE6303B),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          child: Center(
            child: label == '⌫'
                ? const Icon(Icons.backspace, size: 28, color: Colors.white)
                : Text(
                    label,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    final isCodeComplete = code.every((digit) => digit.isNotEmpty);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Verifikasi Email',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Masukkan kode verifikasi yang kami kirim ke:\n${widget.email}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => _buildDigitBox(index)),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak menerima kode? ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: _isResendEnabled ? handleResend : null,
                      child: Text(
                        'Kirim Ulang',
                        style: TextStyle(
                          color: _isResendEnabled 
                              ? const Color(0xFFE6303B)
                              : Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _isResendEnabled ? '' : '$minutes:$seconds',
                  style: const TextStyle(
                    color: Color(0xFFE6303B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isCodeComplete ? handleSubmit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE6303B),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildKeypadButton('1', onTap: () => handleKeyTap('1')),
                          _buildKeypadButton('2', onTap: () => handleKeyTap('2')),
                          _buildKeypadButton('3', onTap: () => handleKeyTap('3')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildKeypadButton('4', onTap: () => handleKeyTap('4')),
                          _buildKeypadButton('5', onTap: () => handleKeyTap('5')),
                          _buildKeypadButton('6', onTap: () => handleKeyTap('6')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildKeypadButton('7', onTap: () => handleKeyTap('7')),
                          _buildKeypadButton('8', onTap: () => handleKeyTap('8')),
                          _buildKeypadButton('9', onTap: () => handleKeyTap('9')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 72, height: 72),
                          _buildKeypadButton('0', onTap: () => handleKeyTap('0')),
                          _buildKeypadButton('⌫', onTap: handleDelete),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}