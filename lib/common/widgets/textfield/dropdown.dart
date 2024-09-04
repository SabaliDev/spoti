import 'package:flutter/material.dart';

class DepositMethodDropdown extends StatefulWidget {
  final void Function(String?) onChanged;
  final double borderRadius;
  final Color enabledBorderColor;
  final Color focusedBorderColor;

  const DepositMethodDropdown({
    Key? key,
    required this.onChanged,
    this.borderRadius = 10.0,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
  }) : super(key: key);

  @override
  _DepositMethodDropdownState createState() => _DepositMethodDropdownState();
}

class _DepositMethodDropdownState extends State<DepositMethodDropdown> {
  String? _selectedMethod;

  final List<String> _depositMethods = ['Bank', 'Mobile Money', 'Crypto'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedMethod,
      hint: Text('Select deposit method'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedMethod = newValue;
        });
        widget.onChanged(newValue);
      },
      items: _depositMethods.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: widget.focusedBorderColor),
        ),
      ),
    );
  }
}
