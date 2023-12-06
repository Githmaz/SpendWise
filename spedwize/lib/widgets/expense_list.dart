import 'package:flutter/material.dart';
import 'package:spedwize/models/expense.dart';
import 'package:spedwize/widgets/expense_item_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expenses[index]));
  }
}
