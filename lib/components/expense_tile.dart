
import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {

  final String name;
  final String amount;
  final DateTime dateTime;

  const MyTile({super.key, required this.name, required this.amount, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
            title: Text(name),
            subtitle: Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
            trailing: Text('\$' +amount),
          );
  }
}