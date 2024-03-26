import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/date_time_helper.dart';
import 'package:flutter_application_1/models/expenseitem.dart';


class ExprenseData extends ChangeNotifier{

  // list of All expenses
  List<ExpenseItem> overallExpenseList = [];

  //get expense list
  List<ExpenseItem> getAllExpenseList(){
    return overallExpenseList;
  }

  // add new expense
  void addNewExpense(ExpenseItem item){
    overallExpenseList.add(item);
    notifyListeners();
  }


  //delete Expense
  void deleteExpense(ExpenseItem expense){
    overallExpenseList.removeWhere((element) => element == expense);
    notifyListeners();
  }

  //get weekday (mon, tues, etc) from a dateTime object
  String getDayName(DateTime dateTime){
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';    
      default:
        return '';
    }
  }


  //get the date for the start of the week (sunday)
  DateTime startOfWeekDate(){

    DateTime? startOfWeek;

    DateTime today = DateTime.now();

    for(int i = 0; i < 7 ; i++){
      if(getDayName(today.subtract(Duration(days:i))) == 'Sun'){
        startOfWeek = today.subtract(Duration(days:i));
      }
    }

    return startOfWeek!;

  }


//convert
Map<String,double> calculateDailyExpenseSumary(){
  Map<String,double> dailyExpenseSumary={};

  for(var expense in overallExpenseList){
    double amount = double.parse(expense.amount);
    String day = convertDateTimeToString(expense.dateTime);
    if(dailyExpenseSumary.containsKey(day)){
      dailyExpenseSumary[day] = dailyExpenseSumary[day]! + amount;
    }else{
      dailyExpenseSumary[day] = amount;
    }
  }
  return dailyExpenseSumary;
}



 



}