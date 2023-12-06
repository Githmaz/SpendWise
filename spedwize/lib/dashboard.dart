import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Category {
  final String name;
  final double value;

  Category({required this.name, required this.value});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker Dashboard'),
      ),
      drawer: DrawerMenu(), // Menu Drawer
      body: Column(
        children: [
          // Pie Chart
          Container(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    title: 'Category 1',
                    value: 30,
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    title: 'Category 2',
                    value: 20,
                    color: Colors.green,
                  ),
                  // Add more sections as needed
                ],
                sectionsSpace: 0,
              ),
            ),
          ),

          // Expense Cards
          Expanded(
            child: ExpenseTable(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new expense logic
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to home
              Navigator.pop(context);
            },
          ),
          // Add more menu items as needed
        ],
      ),
    );
  }
}

class ExpenseTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpenseCard(name: 'Expense 1', amount: 50),
        ExpenseCard(name: 'Expense 2', amount: 30),
        // Add more expense cards as needed
      ],
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final String name;
  final double amount;

  ExpenseCard({required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(name),
        subtitle: Text('Amount: \$${amount.toString()}'),
      ),
    );
  }
}
