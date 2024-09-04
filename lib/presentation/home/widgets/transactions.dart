import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:spoti/core/configs/theme/app_colors.dart';

class Transaction {
  final String name;
  final String category;
  final double amount;
  final bool isIncome;

  Transaction({
    required this.name,
    required this.category,
    required this.amount,
    this.isIncome = false,
  });
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  Color _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    final initial = transaction.name[0].toUpperCase();
    final avatarColor = _getRandomColor();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: avatarColor,
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  transaction.category,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isIncome ? '+' : '-'} ${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: transaction.isIncome ? Colors.green : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Transactions',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionItem(transaction: transactions[index]);
            },
          ),
        ],
      ),
    );
  }
}

// Usage example:
