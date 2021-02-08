import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_admin/Views/%20%20diseases_Board.dart';
import 'package:web_admin/Views/Notifications.dart';

class SinglePersonScreen extends StatefulWidget {
  String singleEmail;
  SinglePersonScreen(this.singleEmail);
  @override
  _SinglePersonScreenState createState() => _SinglePersonScreenState();
}

class _SinglePersonScreenState extends State<SinglePersonScreen> {
  var bpValue,
      bodyTempatatureValue,
      respirationValue,
      glucoseValue,
      heartRateValue,
      oxygenSaturationValue,
      electroCardiogramValue,
      updateTimeValue;

  var bp,
      bodyTempatature,
      respiration,
      glucose,
      heartRate,
      oxygenSaturation,
      electroCardiogram,
      name,
      age,
      photoUrl,
      email,
      id,
      mobile;

  @override
  void initState() {
    super.initState();
    getDocData();
    getData();
    getUserData();
  }

  DocumentSnapshot document, userDetailsdocument, docDocument;
  QuerySnapshot qs;

  final usersDetailsReference = Firestore.instance.collection("Users");

  getUserData() async {
    userDetailsdocument =
        await usersDetailsReference.document(widget.singleEmail).get();
    setState(() {
      // print(userDetailsdocument.data["email"]);
      name = userDetailsdocument.data["name"];
      age = userDetailsdocument.data["age"];
      email = userDetailsdocument.data["email"];
      id = userDetailsdocument.data["id"];
      photoUrl = userDetailsdocument.data["photoUrl"];
      mobile = userDetailsdocument.data["mobile"];
    });
  }

  getDocData() async {
    final usersDocReference = Firestore.instance
        .collection("Users")
        .document(widget.singleEmail)
        .collection("EachPara")
        .document("DocumentDetails")
        .collection("Docs");
    qs = await usersDocReference.getDocuments();
  }

  Future<dynamic> getData() async {
    final usersReference = Firestore.instance
        .collection("Users")
        .document(widget.singleEmail)
        .collection("EachPara");
    document = await usersReference.document("EachPara").get();
    // print(document.data["EachPara"][document.data.length - 1]["bp"]);

    setState(() {
      bpValue = double.parse(
          document.data["EachPara"][document.data.length - 1]["bp"]);

      bodyTempatatureValue = double.parse(document.data["EachPara"]
          [document.data.length - 1]["Body_Tempatature"]);
      respirationValue = double.parse(
          document.data["EachPara"][document.data.length - 1]["Respiration"]);
      glucoseValue = double.parse(
          document.data["EachPara"][document.data.length - 1]["Glucose"]);
      heartRateValue = double.parse(
          document.data["EachPara"][document.data.length - 1]["Heart_Rate"]);
      oxygenSaturationValue = double.parse(document.data["EachPara"]
          [document.data.length - 1]["Oxygen_Saturation"]);
      electroCardiogramValue = double.parse(document.data["EachPara"]
          [document.data.length - 1]["Electro_Cardiogram"]);

      bp = bpValue / 120 - 0.25;
      // snapshot.data.documents[0]['EachPara'].last['bp']
      // ) /
      // 1000;

      bodyTempatature = bodyTempatatureValue / 99 - 0.25;

      // snapshot.data
      // .documents[0]['EachPara'].last['Body_Tempatature']) /
      // 105 -
      // 0.25;

      respiration = respirationValue / 16 - 0.25;

      // snapshot
      // .data.documents[0]['EachPara'].last['Respiration']) /
      // 20 -
      // 0.25;
      glucose = glucoseValue / 200 - 0.25;
      // snapshot
      //           .data.documents[0]['EachPara'].last['Glucose']) /
      //       200 -
      //   0.25;
      heartRate = heartRateValue / 80 - 0.25;
      // snapshot
      //           .data.documents[0]['EachPara'].last['Heart_Rate']) /
      //       100 -
      //   0.25;

      oxygenSaturation = oxygenSaturationValue / 100 - 0.25;
      //snapshot.data
      //           .documents[0]['EachPara'].last['Oxygen_Saturation']) /
      //       120 -
      //   0.25;

      electroCardiogram = electroCardiogramValue / 100 - 0.25;
    });
  }

  downloadPdf(pdfUrl) async {
    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.singleEmail,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: bpValue != null
          ? SingleChildScrollView(
              child: Container(
                color: Colors.indigo[50],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Health Summary",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.black,
                                      backgroundImage:
                                          NetworkImage(photoUrl ?? ""),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 65.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: bp,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: (bp < 0.5 || bp > 0.75)
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 80.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: bodyTempatature,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: (bodyTempatature <
                                                      0.7196969696969697 ||
                                                  bodyTempatature > 0.75)
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 95.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: respiration,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: (respiration < 0.35 ||
                                                  respiration > 0.55)
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 110.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: glucose,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: (glucose < 0.4499 ||
                                                  glucose > 0.75)
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 125.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: heartRate,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: (heartRate < 0.5 ||
                                                  heartRate > 0.75)
                                              ? Colors.red
                                              : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 140.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: oxygenSaturation,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor:
                                              (oxygenSaturation < 0.70 ||
                                                      oxygenSaturation > 0.75)
                                                  ? Colors.red
                                                  : Colors.green),
                                    ),
                                    Center(
                                      child: CircularPercentIndicator(
                                          radius: 155.0,
                                          lineWidth: 6.0,
                                          animation: true,
                                          percent: electroCardiogram,
                                          backgroundColor: Colors.transparent,
                                          animationDuration: 1000,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor:
                                              (electroCardiogram < 0.35 ||
                                                      electroCardiogram > 0.75)
                                                  ? Colors.red
                                                  : Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Last Updated : ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Container(
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Blood Presure",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("$bpValue mmHG"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (bp < 0.5 ||
                                                                  bp > 0.75)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Body Tempatature",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "$bodyTempatatureValue F",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (bodyTempatature <
                                                                      0.7196969696969697 ||
                                                                  bodyTempatature >
                                                                      0.75)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Respiration",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("$respirationValue B/M"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (respiration < 0.35 ||
                                                                  respiration >
                                                                      0.55)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                            // Text("$respirationValue"),
                                            // CircleAvatar(
                                            //   radius: 6,
                                            //   backgroundColor: Colors.green,
                                            // )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Glucose",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "$glucoseValue mg/dl",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (glucose < 0.4499 ||
                                                                  glucose >
                                                                      0.75)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Heart Rate",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "$heartRateValue B/M",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (heartRate < 0.5 ||
                                                                  heartRate >
                                                                      0.75)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                            // Text("$heartRateValue"),
                                            // CircleAvatar(
                                            //   radius: 6,
                                            //   backgroundColor: Colors.green,
                                            // )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Oxygen Saturation",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "$oxygenSaturationValue %",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                      radius: 6,
                                                      backgroundColor:
                                                          (oxygenSaturation <
                                                                      0.70 ||
                                                                  oxygenSaturation >
                                                                      0.75)
                                                              ? Colors.red
                                                              : Colors.green),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Electro Cardiogram",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "$electroCardiogramValue B/M",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: CircleAvatar(
                                                    radius: 6,
                                                    backgroundColor:
                                                        (electroCardiogram <
                                                                    0.35 ||
                                                                electroCardiogram >
                                                                    0.75)
                                                            ? Colors.red
                                                            : Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Personal Details",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Name :: "),
                                        Text(name ?? ""),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Email :: "),
                                      Text(email ?? ""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Age :: "),
                                      Text(age ?? ""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Mobile :: "),
                                      Text(mobile ?? ""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("id :: "),
                                      Text(id ?? ""),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            height: 200,
                            width: 350,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            child: Diseases(email) ?? Container(),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            child: Notifications(email) ?? Container(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Health Documents",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 10),
                          if (qs.documents.length != 0)
                            Container(
                              child: ListView.builder(
                                itemCount: qs.documents.length ?? 0,
                                itemBuilder: (BuildContext context, int i) {
                                  return Card(
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Name : ${qs.documents[i]["Name"].toString()}" ??
                                                      "Name",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "Updated Date : ${qs.documents[i]["Date"].toString()}" ??
                                                      "Date",
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                                Text(
                                                  "Description : ${qs.documents[i]["Description"].toString()}" ??
                                                      "Description",
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              downloadPdf((qs.documents[i]
                                                      ["DocUrl"]) ??
                                                  " ");
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CircleAvatar(
                                                radius: 20,
                                                child: Icon(
                                                    Icons.download_rounded),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              height: 1000,
                              width: 400,
                            )
                          else
                            Center(
                              child: Container(
                                child: Text("No Documents are there"),
                              ),
                            ),

                          // Container(
                          //   color: Colors.green,
                          //   height: 200,
                          //   width: 200,
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularPercentIndicator(
                radius: 50,
                progressColor: Colors.red,
              ),
            ),
    );
  }
}
