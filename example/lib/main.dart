import 'package:floating_menu_button/floating_menu_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FloatingMenuWidget(
        menuItems: [
          MenuItems(id: "1", value: "Item 1"),
          MenuItems(id: "2", value: "Item 2"),
          MenuItems(id: "3", value: "Item 3")
        ],
        onItemSelection: (menuItems){
          final snackBar = SnackBar(content: Text("${menuItems.value} Clicked"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
