import 'package:covid/data.dart';
import 'package:flutter/material.dart';

class FAQSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('FAQs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: ((BuildContext context,int index){
          return ExpansionTile(
            title: Text(DataSource.questionAnswers[index]['question']),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(DataSource.questionAnswers[index]['answer']),
              ),
            ],
          );
        })
      ),
    );
  }
}