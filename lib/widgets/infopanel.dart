import 'package:covid/data.dart';
import 'package:covid/screens/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: (){
              Navigator.push(context , MaterialPageRoute(builder: (context) => FAQSPage()));
            },
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('FAQS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white)),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
          },
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('DONATE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white)),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () async{
                launch ('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Container(
              //width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('MYTH BUSTERS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white)),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}