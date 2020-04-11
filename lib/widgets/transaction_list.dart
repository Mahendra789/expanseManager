import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTx;
  TransactionList(this.transactionList, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
                      DateFormat.yMMMd().format(transactionList[index].date),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: (){deleteTx(transactionList[index].id);} ),
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
