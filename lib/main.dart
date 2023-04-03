import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 50,
            width: 100,
            child: CustomPaint(
              painter: MyShape(),
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(size.width * 0 + 4, size.height * 0);
    path.relativeArcToPoint(
      const Offset(-4, 4),
      radius: const Radius.circular(4),
      clockwise: false,
    );
    //left line

    path.lineTo(size.width * 0, size.height * 1 - 4);
    path.relativeArcToPoint(
      const Offset(4, 4),
      radius: const Radius.circular(4),
      clockwise: false,
    );
    //bottom line

    path.lineTo(size.width * 0.8-3, size.height * 0.7);
    path.relativeArcToPoint(
      const Offset(3, -2),
      radius: const Radius.circular(4),
      clockwise: false,
    );

    
    //right line

    path.lineTo(size.width * 1, size.height * 0 + 4);
    path.relativeArcToPoint(
      const Offset(-4, -4),
      radius: const Radius.circular(4),
      clockwise: false,
    );

    //top line

    path.lineTo(size.width * 1, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
