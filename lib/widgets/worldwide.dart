import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(panelColor: Colors.red[100],textColor: Colors.red,title: 'CONFIRMED',count: worldData['cases'].toString(),),
          StatusPanel(panelColor: Colors.blue[100],textColor: Colors.blue,title: 'ACTIVE',count: worldData['active'].toString(),),
          StatusPanel(panelColor: Colors.green[100],textColor: Colors.green,title: 'RECOVERED',count: worldData['recovered'].toString(),),
          StatusPanel(panelColor: Colors.grey[100],textColor: Colors.grey,title: 'DEATHS',count: worldData['deaths'].toString(),),
        ],
      ),
      
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel({this.panelColor,this.textColor,this.title,this.count});
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 80.0,
      width: width/2,
      color: panelColor,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: textColor),),
          Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: textColor),),
        ],
      ),
    );
  }
}