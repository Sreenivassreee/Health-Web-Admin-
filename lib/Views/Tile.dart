import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:web_admin/Views/SinglePersonScreen.dart';

class Tile extends StatefulWidget {
  String email, photo, updateTime;
  Tile(this.email, this.photo, this.updateTime);
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _query2 = Firestore.instance
        .collection('Users')
        .document(widget.email)
        .collection("EachPara")
        // .where('email', isEqualTo: widget.email ?? "")
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _query2,
      builder: (BuildContext context, snapshot2) {
        if (snapshot2.data.documents[1]['EachPara'] == null) {
          return Center(child: Text("NO Data Found"));
        } else {
          // print("Lenght is ${snapshot2.data.documents.length}");

          return Container(
            child: GridView.builder(
              shrinkWrap: false,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemBuilder: (_, i) {
                // var bbbbp =
                //                   snapshot2.data.documents.last['EachPara'].last['bp'];
                //               print("bbbp" + bbbbp);
                //               decripte(data) async {
                //                 // print("Decripted" + data);
                //                 bpp = await cryptor.decrypt(data, "Sree");
                //                 print("After Decripted" + bpp);
                //                 return bpp;
                //               }

                var bpValue = double.parse(
                    snapshot2.data.documents[1]['EachPara'].last["bp"]);
                print(bpValue);

                var bodyTempatatureValue = double.parse(snapshot2
                    .data.documents[1]['EachPara'].last["Body_Tempatature"]);
                var respirationValue = double.parse(snapshot2
                    .data.documents[1]['EachPara'].last["Respiration"]);
                var glucoseValue = double.parse(
                    snapshot2.data.documents[1]['EachPara'].last["Glucose"]);
                var heartRateValue = double.parse(
                    snapshot2.data.documents[1]['EachPara'].last["Heart_Rate"]);
                var oxygenSaturationValue = double.parse(snapshot2
                    .data.documents[1]['EachPara'].last["Oxygen_Saturation"]);
                var electroCardiogramValue = double.parse(snapshot2
                    .data.documents[1]['EachPara'].last["Electro_Cardiogram"]);
                var updateTimeValue =
                    snapshot2.data.documents[1]['EachPara'].last["UpdateTime"];
                var bp = bpValue / 120 - 0.25;
                // snapshot.data.documents[0]['EachPara'].last['bp']
                // ) /
                // 1000;

                var bodyTempatature = bodyTempatatureValue / 99 - 0.25;

                // snapshot.data
                // .documents[0]['EachPara'].last['Body_Tempatature']) /
                // 105 -
                // 0.25;

                var respiration = respirationValue / 16 - 0.25;

                // snapshot
                // .data.documents[0]['EachPara'].last['Respiration']) /
                // 20 -
                // 0.25;
                var glucose = glucoseValue / 200 - 0.25;
                // snapshot
                //           .data.documents[0]['EachPara'].last['Glucose']) /
                //       200 -
                //   0.25;
                var heartRate = heartRateValue / 80 - 0.25;
                // snapshot
                //           .data.documents[0]['EachPara'].last['Heart_Rate']) /
                //       100 -
                //   0.25;

                var oxygenSaturation = oxygenSaturationValue / 100 - 0.25;
                // snapshot.data
                //           .documents[0]['EachPara'].last['Oxygen_Saturation']) /
                //       120 -
                //   0.25;

                var electroCardiogram = electroCardiogramValue / 100 - 0.25;
                // print(updateTimeValue);

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SinglePersonScreen(widget.email.toString())));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(widget.photo),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 65.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: bp,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: (bp < 0.5 || bp > 0.75)
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 80.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: bodyTempatature,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      (bodyTempatature < 0.7196969696969697 ||
                                              bodyTempatature > 0.75)
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 95.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: respiration,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      (respiration < 0.35 || respiration > 0.55)
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 110.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: glucose,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      (glucose < 0.4499 || glucose > 0.75)
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 125.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: heartRate,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      (heartRate < 0.5 || heartRate > 0.75)
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 140.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: oxygenSaturation,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: (oxygenSaturation < 0.70 ||
                                          oxygenSaturation > 0.75)
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                              Center(
                                child: CircularPercentIndicator(
                                  radius: 155.0,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: electroCardiogram,
                                  backgroundColor: Colors.transparent,
                                  animationDuration: 1000,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: (electroCardiogram < 0.35 ||
                                          electroCardiogram > 0.75)
                                      ? Colors.red
                                      : Colors.green,
                                ),
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
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Container(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Blood Presure",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("$bpValue mmHG"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (bp < 0.5 || bp > 0.75)
                                                        ? Colors.red
                                                        : Colors.green),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
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
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "$bodyTempatatureValue F",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.left,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor: (bodyTempatature <
                                                            0.7196969696969697 ||
                                                        bodyTempatature > 0.75)
                                                    ? Colors.red
                                                    : Colors.green),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
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
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("$respirationValue B/M"),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (respiration < 0.35 ||
                                                            respiration > 0.55)
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Glucose",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "$glucoseValue mg/dl",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (glucose < 0.4499 ||
                                                            glucose > 0.75)
                                                        ? Colors.red
                                                        : Colors.green),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Heart Rate",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "$heartRateValue B/M",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (heartRate < 0.5 ||
                                                            heartRate > 0.75)
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Oxygen Saturation",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "$oxygenSaturationValue %",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (oxygenSaturation < 0.70 ||
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Electro Cardiogram",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "$electroCardiogramValue B/M",
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.left,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: CircleAvatar(
                                                radius: 6,
                                                backgroundColor:
                                                    (electroCardiogram < 0.35 ||
                                                            electroCardiogram >
                                                                0.75)
                                                        ? Colors.red
                                                        : Colors.green),
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
                  ),
                );
              },
              itemCount: 1,
            ),
          );
        }
      },
    );
  }
}
