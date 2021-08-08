import 'package:calculate/pages/calculate.dart';
import 'package:calculate/pages/contact.dart';
import 'package:calculate/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  //  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final primaryColor = const Color(0xFFfc584c);
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), Contact()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text("แอพคำนวณค่างวดรถ",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "puimek")),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //หน้าปัจจุบันที่เลือก
        items: [
          //ตรง(Icons.home)คือเราสามารถเลือกได้ว่าจะเลือก icon อะไร
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"), //หน้า Home
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Calculate"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Contact"),
        ],

        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
