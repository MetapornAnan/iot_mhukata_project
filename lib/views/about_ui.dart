import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: 250.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'แอปพลิเคชันร้านหมูกระทะ',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.0,
              ),
            ),
            Text(
              'เพื่อคนไทย',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.0,
              ),
            ),
            Text(
              'โดยเด็กไทย',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.0,
              ),
            ),
            Text(
              'สนใจแอปพลิเคชันติดต่อ',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.0,
              ),
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 35.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Image.asset(
              'assets/images/sauqr.png',
              width: 130.0,
            ),
          ],
        ),
      ),
    );
  }
}
