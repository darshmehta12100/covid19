import 'dart:convert';

import 'package:covid/data.dart';
import 'package:covid/screens/countrypage.dart';
import 'package:covid/widgets/infopanel.dart';
import 'package:covid/widgets/mostaffected.dart';
import 'package:covid/widgets/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map worldData;

  fetchWorldData() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List affectedData;

  fetchAffectedData() async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      affectedData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  Future fetchData()async{
    fetchWorldData();
    fetchAffectedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 TRACKER',style: TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100.0,
                color: Colors.orange[100],
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(DataSource.quote,style: TextStyle(fontSize: 16.0,color: Colors.orange[800],fontWeight: FontWeight.w700),),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical : 10.0 , horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Worldwide',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
                    Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                      
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: InkWell(onTap: (){
                      
                    } ,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => CountryPage()));
                      },
                      child: Text('Regional',style: TextStyle(color: Colors.white ,fontSize: 18.0,fontWeight: FontWeight.w600),)))),
                  ],
                ),
              ),
              worldData == null ? Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)) : WorldWidePanel(worldData: worldData,),
              Padding(
                padding: EdgeInsets.symmetric(vertical : 10.0 , horizontal: 10.0),
                child: Text('Most Affected Countries',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 10.0,),
              affectedData == null ? Container() :MostAffected(affectedData: affectedData,),
              SizedBox(height: 10.0,),
              InfoPanel(),
              SizedBox(height: 50.0,),
            ],
          ),
        ),
      ),
    );
  }
}