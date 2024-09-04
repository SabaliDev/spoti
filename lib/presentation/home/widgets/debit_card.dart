import 'package:flutter/material.dart';

class DebitCardWidget extends StatefulWidget {
  const DebitCardWidget({Key? key}) : super(key: key);

  @override
  _DebitCardWidgetState createState() => _DebitCardWidgetState();
}

class _DebitCardWidgetState extends State<DebitCardWidget> {
  bool isBlocked = false;
  bool repeatPaymentsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue[600],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.credit_card, color: Colors.white, size: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Balance', style: TextStyle(color: Colors.white)),
                        Text('\$1,234.56',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('**** **** **** 1234',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('John Doe', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Options',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                SwitchListTile(
                  title: Text('Block Card'),
                  secondary: Icon(Icons.lock),
                  value: isBlocked,
                  onChanged: (bool value) {
                    setState(() {
                      isBlocked = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Enable Repeat Payments'),
                  secondary: Icon(Icons.repeat),
                  value: repeatPaymentsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      repeatPaymentsEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 8),
                      Text('More Card Options'),
                    ],
                  ),
                  onPressed: () {
                    // Handle more options
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
