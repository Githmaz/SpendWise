import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spedwize/models/expense.dart';
import 'package:spedwize/widgets/parallelogram_button.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<AddExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<AddExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory;

  final formatter = DateFormat.yMd();

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  _showDateTimePicker() async {
    final now = DateTime.now();

    final firstdate = DateTime(now.year - 1, now.month - 12, now.day);
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      _selectedDate = _pickedDate;
    });
  }

  _onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Add New Expense",
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: titleController,
            onChanged: (e) => {},
            maxLength: 50,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            onChanged: (e) => {},
            maxLength: 50,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              prefixText: "LKR .",
              label: Text('Amount'),
            ),
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            items: Category.values.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: (Category? value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          Row(
            children: [
              Text(_selectedDate != null
                  ? formatter.format(_selectedDate!)
                  : "No date selected"),
              IconButton(
                  onPressed: _showDateTimePicker,
                  icon: const Icon(Icons.calendar_month_outlined))
            ],
          ),
         Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
  children: [
    ParallelogramButton(
      label: "Cancel",
      onPressed: () {
        dispose();
        Navigator.pop(context);
      },
      shape: "left-trapezoid",
      width: MediaQuery.of(context).size.width * 0.3,
      buttonColor: Colors.blue,
      fontSize: 12,
    ),const SizedBox(),
    ParallelogramButton(
      label: "Cancel",
      onPressed: () {
        dispose();
        Navigator.pop(context);
      },
      shape: "left-parallelogram",
      width: MediaQuery.of(context).size.width * 0.3,
      buttonColor: Colors.blue,
      fontSize: 12,
    ),
    ParallelogramButton(
      label: "Cancel",
      onPressed: () {
        dispose();
        Navigator.pop(context);
      },
      shape: "top-right-trapezoid",
      width: MediaQuery.of(context).size.width * 0.3,
      buttonColor: Colors.blue,
      fontSize: 12,
    ),
  ],
),
        ],
      ),
    );
  }
}
