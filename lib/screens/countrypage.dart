import 'package:covid/data.dart';
import 'package:covid/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List countryData;

  fetchCountryData() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('COUNTRY STATS',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: Search(countryData));
              },
            )
          ],
        ),
        body: countryData == null ? Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)) : ListView.builder(
        itemCount: countryData == null ? 0 : countryData.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 120.0,
            margin: EdgeInsets.symmetric(horizontal:10.0,vertical:10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100],
                  blurRadius: 10.0,
                  offset: Offset(0,10.0),
                )
              ]
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(countryData[index]['countryInfo']['flag'],height: 60.0,width: 50.0,),

                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Column(
                      children: <Widget>[
                        Text('CONFIRMED: '+ countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red.withOpacity(0.5)),),
                        SizedBox(height: 5.0,),
                        Text('ACTIVE: '+ countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blue.withOpacity(0.5))),
                        SizedBox(height: 5.0,),
                        Text('RECOVERED: '+ countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.green.withOpacity(0.5))),
                        SizedBox(height: 5.0,),
                        Text('DEATH: '+ countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.5))),
                      ],
                    ),
                  ),
                ),)
              ],
            ),
          );
        },
      ),
    );
  }
}