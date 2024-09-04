import 'package:flutter/material.dart';
import 'package:spoti/common/widgets/appbar/app_bar.dart';
import 'package:spoti/common/widgets/button/basic_app_button.dart';
import 'package:spoti/common/widgets/textfield/dropdown.dart';
import 'package:spoti/common/widgets/textfield/squaredround.dart';

class AddDeposit extends StatelessWidget {
  AddDeposit({super.key});

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to start
            children: [
              _addMoneyText(),
              const SizedBox(height: 30),
              _depositMethodField(context),
              const SizedBox(height: 20),
              _amountField(context),
              const SizedBox(height: 20),
              _currencyField(context),
              const SizedBox(height: 20),
              Center(
                // Center the button
                child: BasicAppButton(
                  onPressed: () async {
                    // Your existing onPressed logic here
                  },
                  title: 'Add Money',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addMoneyText() {
    return const Text(
      'Add Money',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Widget _amountField(BuildContext context) {
    return SquareRoundTextField(
      controller: _amountController,
      hintText: 'Enter Amount',
    );
  }

  Widget _currencyField(BuildContext context) {
    return SquareRoundTextField(
      controller: _currencyController,
      hintText: "Select Currency",
    );
  }

  Widget _depositMethodField(BuildContext context) {
    return DepositMethodDropdown(
      onChanged: (String? newValue) {
        // Handle the new value here, e.g., update a state variable
      },
      borderRadius: 15.0, // Custom border radius
      focusedBorderColor: Colors.green, // Custom focus color
    );
  }
}
