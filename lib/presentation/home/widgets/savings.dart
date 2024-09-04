import 'package:flutter/material.dart';
import 'dart:math' as math;

class SavingsWidget extends StatefulWidget {
  const SavingsWidget({Key? key}) : super(key: key);

  @override
  _SavingsWidgetState createState() => _SavingsWidgetState();
}

class _SavingsWidgetState extends State<SavingsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _currentSavings = 500.0;
  double _savingsGoal = 1000.0;
  String _selectedGoal = 'Vacation';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Savings Goal: $_selectedGoal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: SavingsProgressPainter(
                          progress: _currentSavings / _savingsGoal,
                          animation: _controller,
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$${_currentSavings.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'of \$${_savingsGoal.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentSavings =
                          math.min(_currentSavings + 50, _savingsGoal);
                      _controller.forward(from: 0);
                    });
                  },
                  child: Text('Add \$50'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showGoalSelectionDialog();
                  },
                  child: Text('Change Goal'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showGoalSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Savings Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGoalOption('Vacation', 1000.0),
              _buildGoalOption('New Phone', 800.0),
              _buildGoalOption('Emergency Fund', 5000.0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGoalOption(String goal, double amount) {
    return ListTile(
      title: Text(goal),
      subtitle: Text('\$${amount.toStringAsFixed(2)}'),
      onTap: () {
        setState(() {
          _selectedGoal = goal;
          _savingsGoal = amount;
          _currentSavings = math.min(_currentSavings, _savingsGoal);
          _controller.forward(from: 0);
        });
        Navigator.of(context).pop();
      },
    );
  }
}

class SavingsProgressPainter extends CustomPainter {
  final double progress;
  final Animation<double> animation;

  SavingsProgressPainter({required this.progress, required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    paint.color = Colors.blue;
    paint.strokeCap = StrokeCap.round;

    double sweepAngle = 2 * math.pi * progress * animation.value;
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -math.pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
