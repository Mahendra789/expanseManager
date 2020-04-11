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
      child: transactionList.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Data Found',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/aaa.png'),),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
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
                    trailing: MediaQuery.of(context).size.width>360?
                    FlatButton.icon(
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                        textColor: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteTx(transactionList[index].id);
                        }
                    ) :
                     IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteTx(transactionList[index].id);
                        }),
                  ),
                );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
