import 'package:flutter/material.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onSendPressed;
  final VoidCallback onWithdrawPressed;

  const ActionButtons({
    Key? key,
    required this.onAddPressed,
    required this.onSendPressed,
    required this.onWithdrawPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(Icons.add, 'Add', onAddPressed),
        _buildActionButton(Icons.send, 'Send', onSendPressed),
        _buildActionButton(
            Icons.account_balance_wallet, 'Withdraw', onWithdrawPressed),
      ],
    );
  }

  Widget _buildActionButton(
      IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: AppColors.grey,
            padding: const EdgeInsets.all(16),
            elevation: 4,
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
