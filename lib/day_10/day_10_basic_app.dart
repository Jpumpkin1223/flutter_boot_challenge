import 'package:flutter/material.dart';

class Day10BasicApp extends StatefulWidget {
  const Day10BasicApp({super.key});

  @override
  State<Day10BasicApp> createState() => _Day10BasicAppState();
}

class _Day10BasicAppState extends State<Day10BasicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Boot'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Select a profile to start the Flutter Boot.', style: TextStyle(fontSize: 30, color: Colors.white)),
          const SizedBox(height: 20),
          SizedBox(
              height: 400,
              width: 350,
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    accountBox(Colors.blue, 'aaaa'),
                    accountBox(Colors.yellow, 'bbbb'),
                    accountBox(Colors.red, 'cccc'),
                    accountBox(Colors.black, 'Add profile'),
                  ],
                ),
              )),
        ],
      )),
    );
  }

  Column accountBox(Color color, String name) {
    var gradient = LinearGradient(
      colors: [color, color.withOpacity(0.8)],
      begin: const Alignment(0, 0.7),
      end: Alignment.bottomCenter,
    );
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: name == 'Add profile' ? Border.all(color: Colors.white, width: 1) : null,
            gradient: gradient,
          ),
          clipBehavior: Clip.hardEdge,
          width: 120,
          height: 120,
          child: name == 'Add profile'
              ? const Icon(Icons.add, color: Colors.white, size: 36)
              : CustomPaint(
                  painter: CharacterPainter(),
                ),
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 18, color: Colors.white54),
        )
      ],
    );
  }
}

class CharacterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    var path = Path();
    path.moveTo(size.width * 1 / 3, size.height / 2);
    var controlPoint = Offset(size.width * 3 / 5, size.height * 3 / 5);
    var endPoint = Offset(size.width * 4 / 5, size.height / 2);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);

    var circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Offset circle1Center = Offset(size.width * 1 / 5, size.height / 3);
    Offset circle2Center = Offset(size.width * 4 / 5, size.height / 3);

    double radius = 10.0;
    canvas.drawCircle(circle1Center, radius, circlePaint);
    canvas.drawCircle(circle2Center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(CharacterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CharacterPainter oldDelegate) => false;
}
