import 'package:example/doctor_page.dart';
import 'package:example/iomtDevice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IoMT Device and Doctor page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'IoMT Device and Doctor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fullnametxt = "FULL NAME";
  String agetxt = "AGE";
  String datatxt = "YOUR MEDICAL DATA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(IoMTDevice());
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/1.jpg'),
                            fit: BoxFit.cover)),
                    child: const Center(
                        child: Text(
                      'Go To Sensor Page',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        shadows: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              spreadRadius: 10),
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              spreadRadius: 20),
                        ],
                      ),
                    ))),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(DoctorPage());
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/2.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      'Go To Doctor Page',
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: 10),
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: 20),
                          ],
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
