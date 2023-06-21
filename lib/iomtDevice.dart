import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import 'services.dart';

class IoMTDevice extends StatefulWidget {
  const IoMTDevice({super.key});

  @override
  State<IoMTDevice> createState() => _IoMTDeviceState();
}

class _IoMTDeviceState extends State<IoMTDevice> {
  TextEditingController fullname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController medicaldata = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IoMT Page"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              'assets/3.svg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'This page is playing the role of an IoMT (Internet of Medical Things) device. It collects data and sends it to the fog server.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: fullname,
                  decoration: const InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: age,
                  decoration: InputDecoration(
                      hintText: 'age',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                  controller: medicaldata,
                  decoration: InputDecoration(
                      hintText: 'Collected Medical Data From Sensor',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        print("button send clicked");
                        Services().sendData(
                          fullname.value.text,
                          age.value.text,
                          int.parse(medicaldata.value.text),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: 150,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: const Center(
                          child: Text(
                            "Send your data",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
