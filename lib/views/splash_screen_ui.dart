import 'package:flutter/material.dart';
import 'package:iot_mhukrata_project/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    //โค้ด Slpash Screen
    Future.delayed(
      //ระยะเวลาหน่วง
      Duration(seconds: 3),
      //พอครบเวลาหน่วงแล้วจะให้ทําอะไร
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/logo.png',
                //width: 250.0,
                width: MediaQuery.of(context).size.width * 0.60,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Copyright © 2025 by Bogy',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
