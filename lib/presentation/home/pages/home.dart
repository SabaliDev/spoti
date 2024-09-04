import 'package:flutter/material.dart';
import 'package:spoti/common/widgets/appbar/app_bar.dart';
import 'package:spoti/common/widgets/bottomnav/bottom_nav.dart';
import 'package:spoti/presentation/deposit/pages/deposit.dart';
import 'package:spoti/presentation/home/widgets/action_buttons.dart';
import 'package:spoti/presentation/home/widgets/account_card.dart';
import 'package:spoti/presentation/home/widgets/debit_card.dart';
import 'package:spoti/presentation/home/widgets/savings.dart';
import 'package:spoti/presentation/home/widgets/transactions.dart';
import 'package:spoti/presentation/home/widgets/user_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Transaction> transactions = [
    Transaction(name: 'AirBnb', category: 'Housing', amount: 16.55),
    Transaction(
        name: 'Add your card or account',
        category: 'Add unlimited cards and account',
        amount: 0),
    Transaction(name: 'McDonald\'s', category: 'Restaurant', amount: 1123.10),
    Transaction(
        name: 'Transfer', category: '*4243', amount: 1135.00, isIncome: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        userInitials: 'PM',
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          _buildCardContent(),
          _buildSavingsContent(),
          _buildAccountContent(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AccountBalanceCard(
            balance: '\$ 2,500.00',
            accountNumber: '*****',
          ),
          const SizedBox(height: 40),
          ActionButtons(
            onAddPressed: () {
              // Handle Add button press
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddDeposit()));
            },
            onSendPressed: () {
              // Handle Send button press
            },
            onWithdrawPressed: () {
              // Handle Withdraw button press
            },
          ),
          const SizedBox(height: 40),
          TransactionsWidget(transactions: transactions),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return DebitCardWidget();
  }

  Widget _buildSavingsContent() {
    return SavingsWidget();
  }

  Widget _buildAccountContent() {
    return AccountWidget();
  }
}
