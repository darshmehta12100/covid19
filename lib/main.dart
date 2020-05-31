import 'package:covid/data.dart';
import 'package:covid/screens/faqs.dart';
import 'package:covid/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        brightness: Brightness.light,
      ),
      home: Home(),
    );
  }
}

// return DynamicTheme(
//       data : (brightness){
//         return ThemeData(
//           primaryColor: primaryColor,
//           brightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
//           scaffoldBackgroundColor: brightness == Brightness.light ? Colors.white : Colors.blueGrey[900],
//         );
//       },

//       themedWidgetBuilder: (context , theme){
//         return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: theme,
//         home: Home(),
//       );
//       },
        
//     );
//   }
// }

