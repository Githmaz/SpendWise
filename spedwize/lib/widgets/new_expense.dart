import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spedwize/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // #TODO - onChange function
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory;

  final formatter = DateFormat.yMd();

  // #TODO - titileController & _amountController with TextEditingController
  // #TODO - selectedCategory
  // #TODO - selectedDate

  // #TODO - dispose
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  _showDateTimePicker() async {
    final now = DateTime.now();

    final firstdate = DateTime(now.year - 1, now.month - 1, now.day);
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      _selectedDate = _pickedDate;
    });
  }

  _onSubmit(){
    
  }

  // #TODO - showDatePicker Function

  // #TODO - onSubmit Function with validations

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
                  borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixText: "LKR .",
              label: Text('Amount'),
            ),
          ),
          // #TODO - Amount with keyboardType: TextInputType.number
          // #TODO - Date Picker Selection Icon Button with a Text
          // #TODO - Category Dropdown
          DropdownButton<Category>(
            value: _selectedCategory,
            items: Category.values.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category
                    .name),
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
            // #TDOD - Add Cancel TextButton with Navigator.pop(context)
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Title ${titleController.text}");
                  print("Title ${amountController.text}");
                  print("Title ${_selectedCategory.toString()}");
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print("Title ${titleController.text}");
                  print("Title ${amountController.text}");
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
