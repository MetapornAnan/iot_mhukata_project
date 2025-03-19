import 'dart:io';

import 'package:flutter/material.dart';

class ShowBillUI extends StatefulWidget {
  //สร้างตัวแปรเพื่อรับข้อมูลที่มาจากหน้า CalBillUI()
  int? numAdult;
  int? numChild;
  int? numCoke;
  int? numPure;
  double? payWaterBuffet;
  double? payBuffetTotalNoSale;
  double? paySale;
  double? payBuffetTotal;
  File? imageFile;

  //เอาตัวแปรที่สร้างไปรับข้อมูลที่ส่งมา
  ShowBillUI({
    super.key,
    this.numAdult,
    this.numChild,
    this.numCoke,
    this.numPure,
    this.payWaterBuffet,
    this.payBuffetTotalNoSale,
    this.paySale,
    this.payBuffetTotal,
    this.imageFile,
  });

  @override
  State<ShowBillUI> createState() => _ShowBillUIState();
}

class _ShowBillUIState extends State<ShowBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'ใบเสร็จรับเงิน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              widget.imageFile == null
                  ? Image.asset(
                      'assets/images/camera.jpg',
                      width: 150.0,
                      height: 150.0,
                    )
                  : Image.file(
                      widget.imageFile!,
                      width: 200.0,
                      height: 200.0,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'รายละเอียดใบเสร็จรับเงิน',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนผู้ใหญ่ ${widget.numAdult} คน',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเด็ก ${widget.numChild} คน',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินน้ำเปล่า ${widget.numPure} ขวด',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินบุฟเฟ่ต์น้ำ ${widget.payWaterBuffet} บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'ส่วนลดเป็นเงิน ${widget.paySale} บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'รวมต้องจ่าย ${widget.payBuffetTotal} บาท',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/payqr.png',
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
