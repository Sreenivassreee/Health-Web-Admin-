// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:web_admin/Models/MainWidgetModel.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class MainWidget extends StatefulWidget {
//   String email;
//   MainWidget(this.email);
//   @override
//   _MainWidgetState createState() => _MainWidgetState(email);
// }

// class _MainWidgetState extends State<MainWidget> {
//   String email;
//   _MainWidgetState(this.email);

//   @override
//   Widget build(BuildContext context) {
//        Stream<QuerySnapshot> _query2 = Firestore.instance
//         .collection('Users')
//         .document(widget.email)
//         .collection("EachPara")
//         // .where('email', isEqualTo: widget.email ?? "")
//         .snapshots();
//     var bpValue = double.parse(single.bp);
//     var bodyTempatatureValue = double.parse(single.bodyTempatature);
//     var respirationValue = double.parse(single.respiration);
//     var glucoseValue = double.parse(single.glucose);
//     var heartRateValue = double.parse(single.heartRate);
//     var oxygenSaturationValue = double.parse(single.oxygenSaturation);
//     var electroCardiogramValue = double.parse(single.oxygenSaturation);
//     var updateTime = single.updateTime;

//     var bp = bpValue / 120 - 0.25;
//     // snapshot.data.documents[0]['EachPara'].last['bp']
//     // ) /
//     // 1000;

//     var bodyTempatature = bodyTempatatureValue / 99 - 0.25;

//     // snapshot.data
//     // .documents[0]['EachPara'].last['Body_Tempatature']) /
//     // 105 -
//     // 0.25;

//     var respiration = respirationValue / 16 - 0.25;

//     // snapshot
//     // .data.documents[0]['EachPara'].last['Respiration']) /
//     // 20 -
//     // 0.25;
//     var glucose = glucoseValue / 200 - 0.25;
//     // snapshot
//     //           .data.documents[0]['EachPara'].last['Glucose']) /
//     //       200 -
//     //   0.25;
//     var heartRate = heartRateValue / 80 - 0.25;
//     // snapshot
//     //           .data.documents[0]['EachPara'].last['Heart_Rate']) /
//     //       100 -
//     //   0.25;

//     var oxygenSaturation = oxygenSaturationValue / 100 - 0.25;
//     // snapshot.data
//     //           .documents[0]['EachPara'].last['Oxygen_Saturation']) /
//     //       120 -
//     //   0.25;

//     var electroCardiogram = electroCardiogramValue / 100 - 0.25;
//     // snapshot
//     //           .data
//     //           .documents[0]['EachPara']
//     //           .last['Electro_Cardiogram']) /
//     //       100 -
//     //   0.25;
//     print(electroCardiogram);

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 35,
//                   backgroundColor: Colors.black,
//                   backgroundImage: NetworkImage(single.photo ?? ""),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 100.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: bp,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: (bp < 0.5 || bp > 0.75)
//                         ? Colors.red
//                         : Color(0xff4285F4),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 130.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: bodyTempatature,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: (bodyTempatature < 0.7196969696969697 ||
//                             bodyTempatature > 0.75)
//                         ? Colors.red
//                         : Color(0xffF4B400),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 160.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: respiration,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: (respiration < 0.35 || respiration > 0.55)
//                         ? Colors.red
//                         : Color(0xff0F9D58),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 190.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: glucose,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: (glucose < 0.4499 || glucose > 0.75)
//                         ? Colors.red
//                         : Color(0xfff37121),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 220.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: heartRate,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: (heartRate < 0.5 || heartRate > 0.75)
//                         ? Colors.red
//                         : Color(0xff9ab3f5),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 250.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: oxygenSaturation,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor:
//                         (oxygenSaturation < 0.70 || oxygenSaturation > 0.75)
//                             ? Colors.red
//                             : Color(0xFFC1BF8E),
//                   ),
//                 ),
//                 Center(
//                   child: CircularPercentIndicator(
//                     radius: 280.0,
//                     lineWidth: 14.0,
//                     animation: true,
//                     percent: electroCardiogram,
//                     backgroundColor: Colors.transparent,
//                     animationDuration: 1000,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor:
//                         (electroCardiogram < 0.35 || electroCardiogram > 0.75)
//                             ? Colors.red
//                             : Color(0xFFD195F9),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Card(
//           elevation: 0,
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text("Last Updated : " + updateTime),
//           ),
//         ),
//         Container(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8),
//             child: Card(
//               elevation: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xff4285F4),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Blood Presure",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("$bpValue mmHG"),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor: (bp < 0.5 || bp > 0.75)
//                                           ? Colors.red
//                                           : Colors.green),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xffF4B400),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Body Tempatature",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "$bodyTempatatureValue F",
//                                   textAlign: TextAlign.left,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor: (bodyTempatature <
//                                                   0.7196969696969697 ||
//                                               bodyTempatature > 0.75)
//                                           ? Colors.red
//                                           : Colors.green),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 2.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xff0F9D58),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "  Respiration",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),

//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("$respirationValue B/M"),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor: (respiration < 0.35 ||
//                                               respiration > 0.55)
//                                           ? Colors.red
//                                           : Colors.green),
//                                 )
//                               ],
//                             ),
//                             // Text("$respirationValue"),
//                             // CircleAvatar(
//                             //   radius: 6,
//                             //   backgroundColor: Colors.green,
//                             // )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xfff37121),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Glucose",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("$glucoseValue mg/dl"),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor:
//                                           (glucose < 0.4499 || glucose > 0.75)
//                                               ? Colors.red
//                                               : Colors.green),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xff9ab3f5),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Heart Rate",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),

//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("$heartRateValue B/M"),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor:
//                                           (heartRate < 0.5 || heartRate > 0.75)
//                                               ? Colors.red
//                                               : Colors.green),
//                                 )
//                               ],
//                             ),
//                             // Text("$heartRateValue"),
//                             // CircleAvatar(
//                             //   radius: 6,
//                             //   backgroundColor: Colors.green,
//                             // )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xFFC1BF8E),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Oxygen Saturation",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("$oxygenSaturationValue %"),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor:
//                                           (oxygenSaturation < 0.70 ||
//                                                   oxygenSaturation > 0.75)
//                                               ? Colors.red
//                                               : Colors.green),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Container(
//                                     width: 20,
//                                     color: Color(0xFFD195F9),
//                                     height: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Electro Cardiogram",
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "$electroCardiogramValue B/M",
//                                   textAlign: TextAlign.left,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 50.0),
//                                   child: CircleAvatar(
//                                       radius: 6,
//                                       backgroundColor:
//                                           (electroCardiogram < 0.35 ||
//                                                   electroCardiogram > 0.75)
//                                               ? Colors.red
//                                               : Colors.green),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20.0),
//                         child: Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                   height: 12, width: 22, color: Colors.red),
//                               SizedBox(width: 10),
//                               Text("Danger"),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
