import 'package:flutter/material.dart';
import 'package:techtalk/wave_painter.dart';

import 'homepage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          painter: WavePainter(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Anand Kumar",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "We are happy to see you here in the mobile app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300, height: 1.5),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Text("Get Started".toUpperCase())),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff1666ee)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)))),
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
