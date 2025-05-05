import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        leading: BackButton(color: isDarkMode ? Colors.white : Colors.black),
        title: const Text(
          'Ubah Kata Sandi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 20,
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildPasswordField(
              label: 'Masukan Kata Sandi Lama',
              obscureText: _obscureOld,
              onToggle: () => setState(() => _obscureOld = !_obscureOld),
              isDarkMode: isDarkMode,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Masukan Kata Sandi Baru',
              obscureText: _obscureNew,
              onToggle: () => setState(() => _obscureNew = !_obscureNew),
              isDarkMode: isDarkMode,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Konfirmasi Kata Sandi Baru',
              obscureText: _obscureConfirm,
              onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
              isDarkMode: isDarkMode,
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi ubah kata sandi
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 4,
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required bool obscureText,
    required VoidCallback onToggle,
    required bool isDarkMode,
  }) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
        filled: true,
        fillColor: isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF1F1F1),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: isDarkMode ? Colors.white70 : Colors.black87,
          ),
          onPressed: onToggle,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}