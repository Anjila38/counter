import 'package:counter/homepage.dart';
import 'package:counter/listprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Counter());
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers:[
        ChangeNotifierProvider(create:(context)=>NumberListProvider())
      ],
      
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
