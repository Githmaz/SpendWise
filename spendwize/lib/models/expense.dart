import 'package:flutter/material.dart';

enum Category { food, travel, leisure, work , other }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.other: Icons.airlines_sharp,
};


class Expense {
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  static Category parseCategory(String categoryString) {
    switch (categoryString) {
      case 'food':
        return Category.food;
      case 'travel':
        return Category.travel;
      case 'leisure':
        return Category.leisure;
      case 'work':
        return Category.work;
      case 'other' : 
      default:
        throw ArgumentError('Invalid category: $categoryString');
    }
  }

  Expense.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        amount = json['amount'],
        date = DateTime.parse(json['date']),
        category = parseCategory(json['category'] as String);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'date': date,
        'category': category,
      };

}
