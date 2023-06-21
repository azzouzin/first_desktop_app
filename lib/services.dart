import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Services {
  String fullname = 'empty';
  String age = 'empty';
  int results = 0;
  int medicaldata = 0;
  void sendData(String fullname, String age, int medicaldata) {
    var msg = jsonEncode(
        {"medicaldata": medicaldata, "age": age, "fullname": fullname});

    http
        .post(Uri.parse("http://127.0.0.1:8000/server/send"),
            headers: {"Content-Type": "application/json"}, body: msg)
        .then((value) {
      print(value.statusCode);
      print(value.body);
      if (value.statusCode == 200) {
        Get.showSnackbar(GetSnackBar(
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          icon: const Icon(
            Icons.sensor_occupied,
            color: Colors.white,
          ),
          title: 'Your data was sent successfully',
          message:
              'Your Data fullname : $fullname  age : $age medicale data : $medicaldata  was sent successfully',
        ));
      } else {}
    });
  }

  void getData() {
    http
        .get(
      Uri.parse("http://localhost:8000/server/getdata"),
    )
        .then((value) {
      print(value.statusCode);
      print(value.body);
      var msg = jsonDecode(value.body);
      fullname = msg["fullname"];
      age = msg["age"];
      medicaldata = msg["medicaldata"];
      print(fullname);
      print(age);
      print(medicaldata);
    });
  }

  Future<void> getRuselts() async {
    proccessData();
    print('get results called');
    await http
        .get(
      Uri.parse("http://localhost:8000/server/recieve"),
    )
        .then((value) {
      print('get results end');
      print(value.statusCode);
      print(value.body);
      var msg = jsonDecode(value.body);
      results = msg["results"];
      print(results);
    });
  }

  void proccessData() {
    http
        .get(
      Uri.parse("http://localhost:8000/server/process_data"),
    )
        .then((value) {
      print(value.statusCode);
      print(value.body);
      if (value.statusCode == 200) {
        Get.dialog(
            barrierColor: Colors.red.withOpacity(0.1),
            transitionDuration: Duration(seconds: 1),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Your data is processed you can see the results now"),
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Got Back to Doctor page"))
                  ],
                ),
              ),
            ));
      }
    });
  }
}
