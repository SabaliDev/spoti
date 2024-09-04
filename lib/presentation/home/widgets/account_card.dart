import 'package:flutter/material.dart';


import 'package:spoti/core/configs/theme/app_colors.dart';

class AccountBalanceCard extends StatelessWidget {
  final String balance;
  final String accountNumber;

  const AccountBalanceCard({
    Key? key,
    required this.balance,
    required this.accountNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        width: 350,
        child: Stack(
          children: [
            // Memphis style background
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              left: 19,
              top: 19,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Balance',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      balance,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Account $accountNumber',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Memphis style decorative elements
            Positioned(
              right: 20,
              bottom: 20,
              child: CustomPaint(
                painter: MemphisElementsPainter(),
                size: const Size(100, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemphisElementsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Circle
    paint.color = Colors.blue[300]!;
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), 20, paint);

    // Triangle
    paint.color = Colors.green[300]!;
    var path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.8);
    path.lineTo(size.width * 0.4, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.8);
    path.close();
    canvas.drawPath(path, paint);

    // Zigzag
    paint.color = Colors.orange[300]!;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    path = Path();
    path.moveTo(0, size.height * 0.5);
    for (var i = 0; i < 5; i++) {
      path.lineTo(size.width * (i + 1) / 5,
          i % 2 == 0 ? size.height * 0.3 : size.height * 0.7);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
