import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);
  


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    return (
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final suggestionList = query.isEmpty ? countryList : countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
    
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context , int index){
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
                      Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(suggestionList[index]['countryInfo']['flag'],height: 60.0,width: 50.0,),

                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Column(
                      children: <Widget>[
                        Text('CONFIRMED: '+ suggestionList[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red.withOpacity(0.5)),),
                        SizedBox(height: 5.0,),
                        Text('ACTIVE: '+ suggestionList[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blue.withOpacity(0.5))),
                        SizedBox(height: 5.0,),
                        Text('RECOVERED: '+ suggestionList[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.green.withOpacity(0.5))),
                        SizedBox(height: 5.0,),
                        Text('DEATH: '+ suggestionList[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.5))),
                      ],
                    ),
                  ),
                ),)
              ],
            ),
          );
      }
      );
  }

}
