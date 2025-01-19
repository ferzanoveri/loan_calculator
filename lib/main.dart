
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
        Icons.notes,
        size: 30,
        color: Colors.black),
        toolbarHeight: 30,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
            Icons.info,
            size: 30,
            color: Colors.black,),
          )
        ],
      ),
      body: Body(),
    );
  }

  Widget Body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Car Loan',
                      style: GoogleFonts.robotoMono(fontSize: 35),
                    ),
                    Text(
                      'Calculator',
                      style: GoogleFonts.robotoMono(fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          InputFotm()
        ],
      ),
    );
  }

  Widget InputFotm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Testing title'),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                hintText: 'Testing hinttext'
            ),
          ),
        )
      ],
    );
  }
}
