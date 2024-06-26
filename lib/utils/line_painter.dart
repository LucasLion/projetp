import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 40
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        colors: [Colors.purple, Colors.indigo, Colors.blue, Colors.green, Colors.yellow, Colors.orange, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = createPath(size);
    canvas.drawPath(path, paint);
  }

  Path createPath(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, -30);

    double y = 0;
    while (y < size.height) {
      final x1 = size.width / 4 - (size.width/1.5 < 400 ? size.width/1.5 : 400); // Ajustez le décalage pour rendre la ligne plus incurvée
      final y1 = y + 400;
      final x2 = 3 * size.width / 4 + (size.width/1.5 < 400 ? size.width/1.5 : 400); // Ajustez le décalage pour rendre la ligne plus incurvée
      final y2 = y + 400;
      final x3 = size.width / 2;
      final y3 = y + 800;

      path.cubicTo(x1, y1, x2, y2, x3, y3);
      y += 800;
    }

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}