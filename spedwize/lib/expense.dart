import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spedwize/models/expense.dart';
import 'package:spedwize/util.dart';
import 'package:spedwize/widgets/expense_list.dart';
import 'package:spedwize/widgets/new_expense.dart';

const filePath = 'assets/expense_data.json';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> expenses = [];

  @override
  void initState() {
    _loadExpenses();
    super.initState();
  }

  void _loadExpenses() async {
    List<Expense> loadedExpenses =
        (await readJsonFile(filePath)).map((dynamic item) {
      return Expense.fromJson(item as Map<String, dynamic>);
    }).toList();
        setState(() {
      expenses = loadedExpenses;
    });
  }

  void _openAddExpenseOverlay() {
    void addExpense(Expense expense) {}

    // #TODO - Add show bottom model
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addExpense));
  }

  // #TODO - addExpense function to expense List and pass to NewExpense widget;

  // #TODO - removeExpense function to expense List and pass to NewExpense widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ExpenseTracker',
            style: GoogleFonts.lato(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    );
  }
}
