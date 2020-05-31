import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {

  final List affectedData;

  const MostAffected({Key key, this.affectedData}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,int index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
          child: Row(
            children: <Widget>[
              Image.network(affectedData[index]['countryInfo']['flag'],height: 25.0,),
              SizedBox(width: 10.0,),
              Text(affectedData[index]['country'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 10.0,),
              Text('Deaths: '+affectedData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
            ],
          ),
        );
      },
      itemCount: 5,
      ),
    );
  }
}