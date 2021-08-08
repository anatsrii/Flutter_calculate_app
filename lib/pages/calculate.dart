import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  // const Calculate({ Key? key }) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  TextEditingController carPrice = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController downPayment = TextEditingController();
  TextEditingController interest = TextEditingController();
  TextEditingController installment = TextEditingController();
  TextEditingController result1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    result1.text = "";
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Padding(padding: const EdgeInsets.all(0.0)),
        Image.asset(
          "assets/images/Vat.jpg",
          fit: BoxFit.contain,

          // width: 100,
          // height: 100,
        ),
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
                controller: carPrice,
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
                controller: discount,
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
                controller: downPayment,
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
                controller: interest,
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
                controller: installment,
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
                var carDiscount = double.parse(carPrice.text) -
                    double.parse(discount.text) -
                    double.parse(downPayment.text);
                print(carDiscount);

                var carInterest =
                    (double.parse(interest.text) / 100) * carDiscount +
                        carDiscount;
                print(carInterest);
                var vat = 0.07;
                var monthInstallment = double.parse(installment.text) * 12;
                var resultInstallment = carInterest / monthInstallment;
                var priceIncludeVat =
                    (resultInstallment * vat) + resultInstallment;
                print(
                    "รถราคา ${carPrice.text} บาท ส่วนลดรวมเงินดาว = $carDiscount บาท");
                print("ราคารถรวมดอกเบี้ย = $carInterest บาท");
                print(
                    "ผ่อนชำระจำนวณ $monthInstallment งวด งวดละ $resultInstallment บาท");
                setState(() {
                  result1.text = "รถราคา ${carPrice.text} บาท"
                      "\nส่วนลดรวมเงินดาวน์ = $carDiscount บาท"
                      "\nยอดจัด = $carInterest บาท"
                      "\nดอกเบี้ย = ${interest.text} %"
                      "\nต้องการผ่อนชำระจำนวณ $monthInstallment งวด"
                      "\nจะต้องชำระงวดละ $priceIncludeVat บาท";
                });
              },
              child: Text("คำนวณ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffeb5234)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(25, 15, 25, 15)),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 30, fontFamily: "milktea"))),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),

        Center(
          child: Text(result1.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "milktea", fontSize: 21)),
        ),

        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
