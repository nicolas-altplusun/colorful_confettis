import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArtisticMasterpieceApp());
}

class ArtisticMasterpieceApp extends StatelessWidget {
  const ArtisticMasterpieceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ArtisticMasterpieceCanvas(),
    );
  }
}

class ArtisticMasterpieceCanvas extends StatelessWidget {
  const ArtisticMasterpieceCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: ArtisticMasterpiecePainter(),
          ),
          const Text(
            "Colorful\nConfettis",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}

class ArtisticMasterpiecePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;
    final colors = [
      const Color(0xFFE40303),
      const Color(0xFFFF8C00),
      const Color(0xFFFFED00),
      const Color(0xFF008026),
      const Color(0xFF24408E),
      const Color(0xFF732982),
    ];
    final random = Random();
    for (int i = 0; i < 1000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final color = colors[random.nextInt(colors.length)];
      paint.color = color;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 47, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
