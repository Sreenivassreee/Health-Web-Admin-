import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  String email;
  Notifications(this.email);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _query = Firestore.instance
        .collection('Users')
        .document(widget.email)
        .collection("EachPara")
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _query,
        builder: (BuildContext context, snap) {
          if (snap.data.documents[2]['mail'] == null) {
            return Center(
              child: Text(
                "No Data",
              ),
            );
          } else {
            print("Lenght is ${snap.data.documents.length}");
            // print(snap.data.documents[3]['CHD']);
            var mail = snap.data.documents[2]['mail'] == true ? "ON" : "OFF";

            var sms = snap.data.documents[2]['sms'] == true ? "ON" : "OFF";

            var whatsapp =
                snap.data.documents[2]['whatsapp'] == true ? "ON" : "OFF";

            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Notficatioins Status",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: 300,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Mail"),
                                  Text(
                                    "$mail" ?? "",
                                    style: TextStyle(
                                        color: mail == "OFF"
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("WhatsApp"),
                                  Text(
                                    "$whatsapp" ?? "",
                                    style: TextStyle(
                                        color: whatsapp == "OFF"
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("sms"),
                                  Text(
                                    "$sms" ?? "",
                                    style: TextStyle(
                                      color: sms == "OFF"
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
