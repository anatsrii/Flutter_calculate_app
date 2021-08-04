import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = const Color(0xFFfc584c);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("แอพคำนวณค่างวดรถ",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "puimek")),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController carPrice = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController interest = TextEditingController();
  TextEditingController installment = TextEditingController();
  TextEditingController downPayment = TextEditingController();
  TextEditingController vat = TextEditingController();
  TextEditingController result1 = TextEditingController();
  TextEditingController result2 = TextEditingController();
  TextEditingController result3 = TextEditingController();
  // TextEditingController result = TextEditingController();
  // TextEditingController puretInterest = TextEditingController();
  // TextEditingController carPriceNoTax = TextEditingController();
  // TextEditingController carPriceIncludeVat = TextEditingController();
  // TextEditingController installmentPerMonth = TextEditingController();
  // TextEditingController payment = TextEditingController();

  @override
  void initState() {
    super.initState();
    result1.text = "";
    result2.text = "";
    result3.text = "";
  }

  Widget build(BuildContext context) {
    // const primaryColor = const Color(0xFFfc584c);
    return ListView(
      children: [
        // Padding(padding: const EdgeInsets.all(0.0)),
        Image.asset("images/Vat.jpg",
            height: 300, width: 100, fit: BoxFit.fitWidth),
        Padding(
          padding: const EdgeInsets.all(15.5),
          child: Text("โปรแกรมคำนวณค่างวดรถ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "milktea",
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: Center(
            child: TextField(
                style: TextStyle(fontFamily: "puimek"),
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(20.0),
                    labelText: "รถราคา :",
                    border: OutlineInputBorder())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: Center(
            child: TextField(
                style: TextStyle(fontFamily: "puimek"),
                decoration: InputDecoration(
                    labelText: "ส่วนลด (ถ้าไม่มีให้ใส่ 0) :",
                    border: OutlineInputBorder())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: Center(
            child: TextField(
                style: TextStyle(fontFamily: "puimek"),
                decoration: InputDecoration(
                    labelText: "เงินดาวน์ (บาท) :",
                    border: OutlineInputBorder())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: Center(
            child: TextField(
                style: TextStyle(fontFamily: "puimek"),
                decoration: InputDecoration(
                    labelText: "ดอกเบี้ย ( % ) :",
                    border: OutlineInputBorder())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: Center(
            child: TextField(
                style: TextStyle(fontFamily: "puimek"),
                decoration: InputDecoration(
                    labelText: "ต้องการผ่อนกี่ปี ? :",
                    border: OutlineInputBorder())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                // calculater,
                var carDiscount = (double.parse(carPrice.text) -
                        double.parse(discount.text)) -
                    double.parse(downPayment.text);
                var totalDiscount = double.parse(carPrice.text) +
                    double.parse(discount.text) +
                    double.parse(downPayment.text);
                var vatPrice = (carDiscount * (double.parse(vat.text)) / 100);
                var carNoVat = carDiscount - vatPrice;
                var interestPrice =
                    (double.parse(interest.text) / 100) * carDiscount;
                var monthInstallment = double.parse(installment.text) * 12;
                var resultInstallment =
                    (carDiscount + interestPrice) / monthInstallment;
                print(
                    "รถราคา $carPrice บาท ส่วนลดรวมเงินดาว $totalDiscount บาท");
                print(
                    "ภาษีมูลค่าเพิ่ม = $vatPrice บาท ราคารถไม่รวมภาษี = $carNoVat บาท");
                print(
                    "ผ่อนชำระจำนวณ $monthInstallment งวด งวดละ $resultInstallment บาท");
                setState(() {
                  result1.text =
                      "รถราคา $carPrice บาท ส่วนลดรวมเงินดาว $totalDiscount บาท";
                  result2.text =
                      "ภาษีมูลค่าเพิ่ม = $vatPrice บาท ราคารถไม่รวมภาษี = $carNoVat บาท";
                  result3.text =
                      "ผ่อนชำระจำนวณ $monthInstallment งวด งวดละ $resultInstallment บาท";
                });
              },
              child: Text("คำนวณ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffeb5234)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(25, 15, 25, 15)),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 30, fontFamily: "puimek"))),
            ),
          ),
        ),
        Text(result1.text),
        Text(result2.text),
        Text(result3.text),
      ],
    );
  }

  // void calculater() {
  //   setState(() {
  //     var puretInterest = (double.parse(interest.text) / 100);
  //     var carPriceNoTax = (double.parse(carPrice.text) -
  //         double.parse(discount.text) -
  //         double.parse(downPayment.text));
  //     var carPriceIncludeVat = (carPriceNoTax * vat);
  //     var carPriceIncludeTax =
  //         (carPriceNoTax + (puretInterest * carPriceNoTax));
  //     var installmentPerMonth = double.parse(installment.text) * 12;
  //     var payment = carPriceIncludeTax / installmentPerMonth;
  //     print("ราคารถรวม Vat = ${carPriceIncludeVat} บาท");
  //     print("ค่างวดรถ = ${payment}");
  //     setState(() {
  //       result.text =
  //           "ราคารถรวม Vat = ${carPriceIncludeVat} บาท ค่างวดรถ = ${payment}";
  //     });
  //   });
  // }
}
