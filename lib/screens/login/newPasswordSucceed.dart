import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepin/core/constants/app_colors.dart';
import 'package:resepin/providers/theme_notifier.dart';

class NewPasswordSucceed extends StatefulWidget {
  const NewPasswordSucceed({super.key});

  @override
  NewPasswordSucceedState createState() => NewPasswordSucceedState();
}

class NewPasswordSucceedState extends State<NewPasswordSucceed> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: isDark ? AppColors.darkBackground : const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: isDark ? Colors.grey[900] : const Color(0xFFF9FAFB),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(47),
                              color: isDark ? Colors.grey[800] : const Color(0xFF706D6D),
                            ),
                            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tombol kembali & toggle tema
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.arrow_back,
                                          color: isDark ? Colors.white : Colors.black),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    const Spacer(),
                                    Switch(
                                      value: isDark,
                                      onChanged: (value) => themeNotifier.toggleTheme(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  child: Text(
                                    "Buat ulang kata sandi",
                                    style: TextStyle(
                                      color: isDark ? Colors.white : Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 6, left: 21),
                                  child: Text(
                                    "Kata sandi baru",
                                    style: TextStyle(
                                      color: isDark ? Colors.white : const Color(0xFF262626),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(11),
                                    color: isDark ? Colors.grey[800] : Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 34),
                                  margin: const EdgeInsets.symmetric(horizontal: 21),
                                  width: double.infinity,
                                  child: Center(
                                    child: Image.network(
                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/2cb8y5o2_expires_30_days.png",
                                      width: 17,
                                      height: 17,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 57),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: const Color(0xFFD9D9D9),
                                        ),
                                        margin: const EdgeInsets.only(bottom: 23),
                                        width: 157,
                                        height: 6,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 244,
                                            height: 203,
                                            child: Image.network(
                                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/kri5ajtx_expires_30_days.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(height: 32),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 12),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE6303B),
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            child: const Text(
                                              '',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          Text(
                                            "Kata sandi berhasil diubah",
                                            style: TextStyle(
                                              color: isDark ? Colors.white : Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          SizedBox(
                                            width: 272,
                                            child: Text(
                                              "Kata sandi berhasil diubah, Anda dapat masuk kembali dengan kata sandi baru.",
                                              style: TextStyle(
                                                color: isDark
                                                    ? Colors.grey[300]
                                                    : const Color(0xFF706D6D),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(height: 32),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
