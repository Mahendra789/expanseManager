import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Data Found',
                  style: Theme.of(context).textTheme.title,
                ),
                Image.asset('assets/images/aaa.png')
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(' ₹ ${transactionList[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactionList[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactionList[index].date)),
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
