import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final List<Map<String, dynamic>> accounts = [
    {
      'name': 'Checking',
      'balance': 2500.00,
      'icon': Icons.account_balance_wallet
    },
    {'name': 'Savings', 'balance': 10000.00, 'icon': Icons.savings},
    {'name': 'Investment', 'balance': 5000.00, 'icon': Icons.trending_up},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Accounts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...accounts.map((account) => _buildAccountTile(account)),
            SizedBox(height: 16),
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile(Map<String, dynamic> account) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(account['icon'] as IconData, color: Colors.blue),
      ),
      title: Text(account['name'] as String),
      subtitle: Text('\$${(account['balance'] as double).toStringAsFixed(2)}'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to account details
      },
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionButton(Icons.sync, 'Transfer', Colors.green),
            _buildActionButton(Icons.payment, 'Pay Bills', Colors.orange),
            _buildActionButton(
                Icons.account_balance, 'ATM Locator', Colors.purple),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle button tap
          },
          child: Icon(icon, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: color,
            padding: EdgeInsets.all(16),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
