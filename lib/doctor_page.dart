import 'package:example/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  String fullname = 'There is no data to display';
  String age = 'There is no data to display';
  int medicaldata = 0;
  int results = 0;
  Services services = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctor page'),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(
                'assets/2.svg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    'This page is playing the role of a doctor node. It receives the medical data, requests computation on it, and receives the results',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blue,
                        color: Colors.white,
                        child: Container(
                          width: 250,
                          height: 100,
                          child: Center(
                              child: Text(
                            "FULL NAME : $fullname",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 70, 99)),
                          )),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blue,
                        color: Colors.white,
                        child: Container(
                          width: 250,
                          height: 100,
                          child: Center(
                              child: Text(
                            "AGE  : $age",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 70, 99)),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blue,
                        color: Colors.white,
                        child: SizedBox(
                          width: 250,
                          height: 100,
                          child: Center(
                              child: Text(
                            "MEDICAL DATA  : $medicaldata",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 70, 99)),
                          )),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blue,
                        color: Colors.white,
                        child: Container(
                          width: 250,
                          height: 100,
                          child: Center(
                              child: Text(
                            "RESULTS  : $results",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 70, 99)),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          print("button get clicked");

                          services.getData();
                          setState(() {
                            fullname = services.fullname;
                            age = services.age;
                            medicaldata = services.medicaldata;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Get your data",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          print("button send clicked");
                          Services services = Services();
                          await services.getRuselts();
                          setState(() {
                            results = services.results;
                          });
                          print(results);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Get the Results",
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
        ));
  }
}
