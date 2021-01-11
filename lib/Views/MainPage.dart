import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_admin/Models/MainWidgetModel.dart';
import 'package:web_admin/Views/SinglePersonScreen.dart';
import 'package:web_admin/Views/Tile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    MainWidgetModel single = MainWidgetModel();
    Stream<QuerySnapshot> _query = Firestore.instance
        .collection('Users')
        // .document()
        // .collection("EachPara")
        // .where('email', isEqualTo: widget.email ?? "")
        .snapshots();
    TextEditingController searchEmail = TextEditingController();
    toNextPage() {
      if (searchEmail.text != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SinglePersonScreen(searchEmail.text)));
      } else {
        print(searchEmail);
      }
    }

    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Health Admin Panel",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 400,
              child: Center(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: searchEmail,
                  // onSubmitted: toNextPage(),
                  decoration: InputDecoration(
                    hintText: "Search by mail id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: toNextPage,
              child:
                  CircleAvatar(radius: 20, child: Icon(CupertinoIcons.search))),
          SizedBox(
            width: 100,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _query,
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CupertinoActivityIndicator());
                } else {
                  print("Lenght is ${snapshot.data.documents.length}");

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0),
                    itemBuilder: (_, i) {
                      single.name = snapshot.data.documents[i]["name"];
                      single.email = snapshot.data.documents[i]["email"];

                      single.photo = snapshot.data.documents[i]["photoUrl"];
                      single.mobile = snapshot.data.documents[i]["mobile"];
                      single.age = snapshot.data.documents[i]["age"];
                      // single.bp = snapshot.data.documents[i]["EachPara"]["EachPara"]
                      //     ["EachPara"][0]["bp"];
                      // single.bodyTempatature =
                      //     snapshot.data.documents[i]["Body_Tempatature"];
                      // single.respiration =
                      //     snapshot.data.documents[i]["Respiration"];
                      // single.glucose = snapshot.data.documents[i]["Glucose"];
                      // single.heartRate =
                      //     snapshot.data.documents[i]["Heart_Rate"];
                      // single.oxygenSaturation =
                      //     snapshot.data.documents[i]["Oxygen_Saturation"];
                      // single.electroCardiogram =
                      //     snapshot.data.documents[i]["Electro_Cardiogram"];
                      // single.updateTime =
                      //     snapshot.data.documents[i]["UpdateTime"];

                      print(single.email);
                      return Scaffold(
                        body: Container(
                          child: Card(
                            child: Tile(
                                single.email, single.photo, single.updateTime),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data.documents.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
