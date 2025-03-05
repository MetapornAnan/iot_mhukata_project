import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_mhukrata_project/views/splash_screen_ui.dart';

void main() {
  runApp(IoTMhukrataProject());
}

class IoTMhukrataProject extends StatefulWidget {
  const IoTMhukrataProject({super.key});

  @override
  State<IoTMhukrataProject> createState() => _IoTMhukrataProjectState();
}

class _IoTMhukrataProjectState extends State<IoTMhukrataProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
