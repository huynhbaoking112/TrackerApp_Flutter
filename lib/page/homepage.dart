import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/expense_summary.dart';
import 'package:flutter_application_1/components/expense_tile.dart';
import 'package:flutter_application_1/data/expense_data.dart';
import 'package:flutter_application_1/models/expenseitem.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  void addExpense() {
    //showDialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        title: const Text("Add new expense"),
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: "Enter expense name...",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                icon: Icon(Icons.abc),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: "Enter your amount...",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                icon: Icon(Icons.price_change),
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),

          //cancel button
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  void save() {
    if (nameController.text != '' && amountController.text != '') {
      DateTime dateTime = DateTime.now();
      ExpenseItem item = ExpenseItem(
          name: nameController.text,
          amount: amountController.text,
          dateTime: dateTime);
      Provider.of<ExprenseData>(context, listen: false).addNewExpense(item);
      nameController.clear();
      amountController.clear();
      Navigator.pop(context);
    }
  }

  void cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExprenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addExpense,
          shape: const CircleBorder(),
          backgroundColor: Colors.blue[500],
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            //weekly summary
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),

            //expense list
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => MyTile(
                    name: value.getAllExpenseList()[index].name,
                    amount: value.getAllExpenseList()[index].amount,
                    dateTime: value.getAllExpenseList()[index].dateTime))
          ],
        ),
        // body: Text(nameController.text),
      ),
    );
  }
}
