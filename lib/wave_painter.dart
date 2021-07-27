import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  const WavePainter();
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height * 0.2;
    double width = size.width;

    Path path = Path();
    Paint topWavePaint;
    Paint bottomWavePaint;

    //Bottom Wave Variables
    final bottomWaveColors = [
      const Color(0xff076ed8),
      const Color(0xff144387),
      const Color(0xff031f59)
    ];
    final bottomWaveStops = [0.0, 0.5, 1.0];
    final bottomWaveGradient = LinearGradient(
      begin: Alignment(-1, -1),
      end: Alignment(1, 1),
      colors: bottomWaveColors,
      stops: bottomWaveStops,
    );
    final bottomWaveShapeBounds =
        Rect.fromLTRB(0, 0, width * .95, size.height * 0.16);
    bottomWavePaint = new Paint()
      ..shader = bottomWaveGradient.createShader(bottomWaveShapeBounds);

    //Top Wave Variables
    final topWaveColors = [
      const Color(0xff3d7ff0).withOpacity(0.76),
      const Color(0xff166bff).withOpacity(0.76),
      const Color(0xff034ac7).withOpacity(0.76)
    ];
    final topWaveStops = [0.0, 0.56, 1.0];
    final topWaveGradient = LinearGradient(
      begin: Alignment(-0.5, -1),
      end: Alignment(1, 0.7),
      colors: topWaveColors,
      stops: topWaveStops,
    );
    final topWaveShapeBounds = Rect.fromLTRB(width * .22, 0, width, height);
    topWavePaint = new Paint()
      ..shader = topWaveGradient.createShader(topWaveShapeBounds);

    //Bottom Wave Shape
    path.lineTo(-width * 0.1, height * 0.2);
    path.quadraticBezierTo(
        -width * 0.012, height * 0.135, width * 0.07, height * 0.28);
    path.cubicTo(width * 0.235, height * 0.65, width * 0.28, height * 0.25,
        width * 0.48, height * 0.45);
    path.cubicTo(width * 0.78, height * .82, width * 0.85, height * .005,
        width * 0.88, 0);

    path.close();

    canvas.drawPath(path, bottomWavePaint);

    //Top Wave Shape
    path = Path();
    path.moveTo(width * .26, 0);
    path.cubicTo(width * 0.36, height * .4, width * 0.59, height * .1,
        width * .68, height * 0.45);
    path.quadraticBezierTo(width * 0.82, height * 0.97, width, height);
    path.lineTo(width, 0);
    path.close();

    canvas.drawPath(path, topWavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

//Gradient shape alignment
//https://stackoverflow.com/a/65811244
