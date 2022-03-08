import 'package:flutter/material.dart';

//-------------------------------------------------------------------------------------------------------------------------------
// Painter that paints the radial lines at the bacground of home and
// detail veiw page---------------------------------
class RadialLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(47, 255, 255, 255)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var path1 = Path();
    path1.moveTo(size.width, size.height * 0.25);
    path1.quadraticBezierTo(
        0, size.height * 0.2, size.width * 0.25, size.height * 0.06);
    path1.lineTo(size.width * 0.27, size.height * 0.05);
    path1.quadraticBezierTo(size.width * 0.29, size.height * 0.03,
        size.width * 0.23, size.height * 0);
    canvas.drawPath(path1, paint);

    var path2 = Path();
    path2.moveTo(size.width, size.height * 0.1);
    path2.arcToPoint(Offset(size.width * 0.35, size.height * 0),
        clockwise: true, radius: const Radius.circular(100));
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//-------------------------------------------------------------------------------------------------------------------------------
// Painter that paints the rectangular for each pageview item-------
class CustomRectPainter extends CustomPainter {
  Size? size;
  BuildContext ctx;
  CustomRectPainter({this.size, required this.ctx});
  @override
  void paint(Canvas canvas, size) {
    Paint paint = Paint()
      ..color = Theme.of(ctx).cardColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Paint paint2 = Paint()
      ..color = const Color.fromARGB(255, 248, 252, 255)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    path.moveTo(size.width * 0.1, size.height * 0.2);
    //-------------------Top Line------------------------------------
    path.lineTo(size.width * 0.9, 0);
    path.quadraticBezierTo(size.width, 0, size.width, size.height * 0.1);
    //-------------------Right Line-----------------------------------
    path.lineTo(size.width, size.height * 0.9);
    path.quadraticBezierTo(
        size.width, size.height, size.width * 0.9, size.height);
    //-------------------Bottom Line-----------------------------------
    path.lineTo(size.width * 0.1, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height * 0.9);
    //-------------------Left Line---------------------------------
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.22, size.width * 0.1, size.height * 0.2);
    //----------------------------------------------------------------------------------------------------
    canvas.drawShadow(path, const Color.fromARGB(92, 0, 0, 0), 20, false);
    canvas.drawPath(path.shift(const Offset(-1, -1)),
        paint2); // This is the outer border of the card
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//-------------------------------------------------------------------------------------------------------------------------------