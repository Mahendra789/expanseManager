import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionList.isEmpty? 
      Column(children: <Widget>[
        Text('No Data Found', 
          style: Theme.of(context).textTheme.title,
        ),
        Image.asset('assets/images/aaa.png')
      ],) 
      
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                        style: BorderStyle.solid)),
                child: Text(
                  '₹ ${transactionList[index].amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactionList[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    formatDate(
                        transactionList[index].date, [yyyy, '/', mm, '/', dd]),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )
            ]),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
