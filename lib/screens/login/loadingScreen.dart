import 'package:flutter/material.dart';
import 'loadingScreen1.dart'; // Pastikan untuk mengimpor loadingscr1.dart



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Menambahkan timer untuk navigasi otomatis
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFE6303B),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(top: 383, bottom: 388),
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 278,
                                  height: 81,
                                  child: Image.network(
                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/751zzkap_expires_30_days.png",
                                    fit: BoxFit.fill,
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