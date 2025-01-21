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

  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  String? selected;
  double? totalInterest;
  double? monthlyInterest;
  double? monthlyInstallment;

  void loanCalculation(){
    final amount = int.parse(_controller1.text) - int.parse(_controller2.text);
    final tinterest = amount * (double.parse(_controller3.text) / 100) * int.parse(selected!);
    final minterest = tinterest/(int.parse(selected!) * 12);
    final minstall = (amount + tinterest) / (int.parse(selected!) * 12);
    setState(() {
      totalInterest = tinterest;
      monthlyInterest = minterest;
      monthlyInstallment = minstall;
    });
  }

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
      body: ListView(
        children: [
          Body(),
          SizedBox(height: 30)
        ],
      ) ,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              InputForm(title: 'Car Price', hintText: 'e.g 90000', controller: _controller1),
              InputForm(title: 'Down Payment', hintText: 'e.g 9000', controller: _controller2),
              InputForm(title: 'Interest Rate', hintText: 'e.g 3.5', controller: _controller3),
              Text(
                'Loan Period',
                style: GoogleFonts.robotoMono(fontSize: 20),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    loanPeriod('1'),
                    loanPeriod('2'),
                    loanPeriod('3'),
                    loanPeriod('4'),
                    loanPeriod('5')
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    loanPeriod('6'),
                    loanPeriod('7'),
                    loanPeriod('8'),
                    loanPeriod('9'),
                  ],
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    loanCalculation();
                    Future.delayed(Duration.zero);
                    showModalBottomSheet(
                      isDismissible: false,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                      context: context,
                      builder: (BuildContext context){
                      return Container(
                        height: 400,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Result',
                                style: GoogleFonts.robotoMono(fontSize: 20),
                              ),
                              SizedBox(height: 15,),
                              Result(title: 'Total Interest', amount: totalInterest!),
                              Result(title: 'Monthly Interest', amount: monthlyInterest!),
                              Result(title: 'Monthly Installment', amount: monthlyInstallment!)
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(
                      child: Text(
                        'Calculate',
                        style: GoogleFonts.robotoMono(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Result({required String title, required double amount}){
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          'Rp${amount.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 19)
        ),
      ),
    );
  }

  Widget loanPeriod(String title){
    return GestureDetector(
      onTap: (){
        setState(() {
          selected = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 20, 0),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: title == selected ? Border.all(color: Colors.red, width: 2): null,
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }

  Widget InputForm({required String title, required TextEditingController controller ,required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                hintText: hintText
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
