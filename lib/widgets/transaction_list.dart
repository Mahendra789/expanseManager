import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';


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
          : 
          ListView(
            children: transactionList.map((tx) => TransactionItem(
              key: ValueKey(tx.id),
              transaction: tx,
              deleteTx: deleteTx,
            )).toList(),
          )
    );
  }
}

