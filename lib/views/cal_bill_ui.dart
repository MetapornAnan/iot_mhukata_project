import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  //สร้างตัวแปรเก็บรูปที่ได้จากกล้อง-แกลอรี่
  File? imgFile;

  //ส้รางตัวแปรเก็บสถานะเลือกผู้ใหญ่และเด็ก
  bool? isAdult = false;
  bool? isChild = false;

  //สร้างตัวแปรเก็บสถานะใช้ได้-ไม่ได้ของป้อนโค้ก/น้ำเปล่า
  bool? isWater = false;

  //สร้างตัวควบคุม TextField
  TextEditingController adultCtrl = TextEditingController();
  TextEditingController childCtrl = TextEditingController();
  TextEditingController cokeCtrl = TextEditingController();
  TextEditingController pureCtrl = TextEditingController();

  //สร้างตัวแปรสำหรับ Radio เพื่อให้อยู่กลุ่มเดียว
  int? groupWater = 1;

  //สร้างตัวแปรเก็บค่าที่เลือกจาก Dropdown
  String? _selectdMember = 'ไม่เป็นสมาชิก';

  //สร้างเมธอดเปิดกล้อง-แกลอรี่
  Future<void> openCamera() async {
    //เปิดกล้องเพื่อถ่าย
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    //ตรวจสอบว่าได้ถ่ายไหม
    if (image == null) return;
    //หากได้ถ่ายก็เอารูปที่ถ่ายไปเก็บไว้ในตัวแปรที่สร้างไว้
    setState(() {
      imgFile = File(image.path);
    });
  }

  Future<void> openGallery() async {
    //เปิดแกลอรี่เพื่อเลือก
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //ตรวจสอบว่าได้เลื่อกไหม
    if (image == null) return;
    //หากได้ถ่ายก็เอารูปที่เลือกไปเก็บไว้ในตัวแปรที่สร้างไว้
    setState(() {
      imgFile = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.0,
            bottom: 50.0,
            left: 40.0,
            right: 40.0,
          ),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              openCamera()
                                  .then((value) => {Navigator.pop(context)});
                            },
                            leading: Icon(
                              Icons.camera_alt,
                              color: Colors.deepOrange,
                            ),
                            title: Text(
                              'เปิดกล้อง',
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              openGallery()
                                  .then((value) => {Navigator.pop(context)});
                            },
                            leading: Icon(
                              Icons.picture_in_picture_alt,
                              color: Colors.deepOrange,
                            ),
                            title: Text(
                              'เปิดแกลอรี่',
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          imgFile!,
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isAdult = value;
                          if (value == false) {
                            adultCtrl.clear();
                          }
                        });
                      },
                      value: isAdult,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        enabled: isAdult,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isChild = value;
                          if (value == false) {
                            childCtrl.clear();
                          }
                        });
                      },
                      value: isChild,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'เค็ก 69 บาท/คน จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        controller: childCtrl,
                        enabled: isChild,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟ่ต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: groupWater,
                      onChanged: (value) {
                        setState(() {
                          groupWater = value!;
                          isWater = false;
                          cokeCtrl.clear();
                          pureCtrl.clear();
                        });
                      },
                    ),
                    Text('รับ 25 บาท/หัว'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: groupWater,
                      onChanged: (value) {
                        setState(() {
                          groupWater = value!;
                          isWater = true;
                        });
                      },
                    ),
                    Text('ไม่รับ'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '               โค้ก 20 บาท/ขวด จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        enabled: isWater,
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '               น้ำเปล่า 15 บาท/ขวด จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        enabled: isWater,
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาฃิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      '               ',
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectdMember,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectdMember = newValue!;
                          });
                        },
                        items: <String>[
                          'ไม่เป็นสมาชิก',
                          'สมาชิกทั่วไป ลด 10%',
                          'สมาชิก VIP ลด 20%'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: _selectdMember == value
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
