import 'package:flutter/material.dart';
import 'package:sm_hospital/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:sm_hospital/page/ip_today.dart';
import 'package:sm_hospital/page/ipmodel.dart';


class UpdatePage extends StatefulWidget {

int Id;
String name;
String age;
String gender;
String adres;
String mobile;
String advance;
String roomtype;
String roomno;
String status;
String admitdate;
String dischargedate;
String doctorname;
String ipno;
String perid;

UpdatePage({required this.Id,required this.name,required this.age,required this.adres,
required this.gender,required this.mobile,required this.advance,required this.roomtype,required this.roomno,
required this.status,required this.admitdate,required this.dischargedate,required this.doctorname,required this.ipno,
required this.perid
});
@override
State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {


var name = TextEditingController();

var age = TextEditingController();

var gender = TextEditingController();

var adres = TextEditingController();

var mobile = TextEditingController();

var advance = TextEditingController();

var roomtype = TextEditingController();

var roomno = TextEditingController();

var status = TextEditingController();

var admitdate = TextEditingController();

var dischargedate = TextEditingController();

var doctorname = TextEditingController();

var ipno = TextEditingController();

var perid = TextEditingController();

 List<Map<String, dynamic>> _data = [];

  Future<List<dynamic>> fetchData() async {
     String baseUrl = "http://127.0.0.1:8000/ip/";

     var response = await http.get(Uri.parse(baseUrl),  headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        );
    final data = jsonDecode(response.body);
    return data;
  }



  void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}


  var items = ['Female', 'Male'];
  var items1 = ['Normal', 'AC'];

final _formKey = GlobalKey<FormState>();


 String Id = '';

  @override
  void initState() {

  setState(() {
    Id = widget.Id.toString();
   age.text = widget.age;
   name.text = widget.name;
   adres.text = widget.adres;
   mobile.text = widget.mobile;
   status.text = widget.status;
   gender.text = widget.gender;
   advance.text = widget.advance;
   roomno.text = widget.roomno;
   roomtype.text = widget.roomtype;
   doctorname.text = widget.doctorname;
   dischargedate.text = widget.dischargedate;
   admitdate.text = widget.admitdate;
   ipno.text = widget.ipno;
   perid.text = widget.perid;
  });

  super.initState();

 }


  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.blue,

        body: Center(

          child: Form(
             key: _formKey,
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 30),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                           width: MediaQuery.of(context).size.width * 0.90,
                             height: MediaQuery.of(context).size.height * 0.90,

                             decoration: BoxDecoration(
                             color:  Colors.white,
                        border: Border.all(
                          color:  Color.fromARGB(255, 48, 22, 97),
                          width: 12,
                        )),


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                padding: const EdgeInsets.only(top: 18, left: 25),
                  child: Container(
                               decoration: BoxDecoration(
                 border: Border.all(color: Colors.black),
                 ),
                 width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Padding(
                  padding: const EdgeInsets.only(top: 7, left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7, right: 80),
                              child: Text('IP No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ),
                          ],
                        ),

                        ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Padding(
                           padding:  EdgeInsets.only(top: 2, ),
                             child:  SizedBox(
                             width: MediaQuery.of(context).size.width * 0.26,
                             height: 20,
                              child: TextField(
                                controller: ipno,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                           ),
                         ],
                       ),
                        Container(
                        width: MediaQuery.of(context).size.width * 0.10,

                        )
                    ],
                  ),
                  ),
                ),

                  ),
                  if (Responsive.isDesktop(context))
                  Padding(
            padding: const EdgeInsets.only(top: 18, left: 1, ),
            child: Container(
              color:  Color.fromARGB(255, 48, 22, 97),
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Center(

               child: Text(
                   'Update Admission', style: GoogleFonts.crimsonText(color: Colors.white, fontSize: 30 ,fontWeight:  FontWeight.w800, ),textAlign: TextAlign.center,),
                  ),
            ),
                  ),
              if (!Responsive.isDesktop(context))
               Padding(
            padding: const EdgeInsets.only(top: 18, left: 1, ),
            child: Container(
              color:  Color.fromARGB(255, 48, 22, 97),
              width: MediaQuery.of(context).size.width * 0.48,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Center(
              child: FittedBox(
               child: Text(
                   'Update Admission', style: GoogleFonts.crimsonText(color: Colors.white, fontSize: 25 ,fontWeight:  FontWeight.w800, ),textAlign: TextAlign.center,),
              ),

                  ),
              ),
             ),

                   ],

                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PerID', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),

                          ),
                          Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 26,
                              child: TextField(
                              controller: perid,
                              decoration: InputDecoration(
                               border: OutlineInputBorder(

                               ),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              children: [
                              Text('Name', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),
                          ),
                           Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 26,
                              child: TextField(
                               controller: name,
                              decoration: InputDecoration(
                               border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              children: [
                              Text('Address', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),
                          ),
                          Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 55,
                              child: TextField(
                               controller: adres,
                              decoration: InputDecoration(
                               border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              children: [
                              Text('Advance', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),
                          ),
                             Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 26,
                              child: TextField(
                              controller: advance,
                              decoration: InputDecoration(
                               border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              children: [
                              Text('Room No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),
                          ),
                           Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 26,
                              child: TextField(
                                controller: roomno,
                              decoration:  InputDecoration(
                               border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Column(
                              children: [
                              Text('Status', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                              ],
                            ),
                          ),
                           Padding(
                           padding: const EdgeInsets.only(top: 1, left: 25),
                            child: Column(
                              children: [
                                 SizedBox(
                               width: MediaQuery.of(context).size.width * 0.35,
                               height: 26,
                              child: TextField(
                              controller: status,
                              decoration: InputDecoration(
                               border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                              ],
                            ),
                          ),
                                ],
                              ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30, left: 10),
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                  Text('Doctor Name', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),

                                                        ),
                                                        Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.35,
                                                             height: 26,
                                                            child: TextField(
                                                            controller: doctorname,
                                                            decoration: InputDecoration(
                                                             border: OutlineInputBorder(

                                                             ),

                                   ),
                                                   ),
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                          Column(
                                                            children: [
                                                         Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                            Text('Age', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.13,
                                                             height: 26,
                                                            child: TextField(
                                                            controller: age,
                                                            decoration: InputDecoration(
                                                             border: OutlineInputBorder(),

                                   ),
                                                   ),
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                    Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 5),
                                                          child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                            Text('Gender', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 5),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.21,
                                                             height: 26,
                                    child:  TextField(
                                                        controller: gender,
                                                       decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                      suffixIcon: PopupMenuButton<String>(
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                      onSelected: (String value) {
                                                       gender.text = value;
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return items
                                            .map<PopupMenuItem<String>>((String value) {
                                          return new PopupMenuItem(
                                              child: new Text(value), value: value);
                                        }).toList();
                                      },
                                    ),
                                  ),
                                )
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                            ],
                                                          )
                                                          ],
                                                        ),

                                                          Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            children: [
                                                            Text('Cell No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.35,
                                                             height: 26,
                                                            child: TextField(
                                   controller: mobile,
                                                            decoration: InputDecoration(
                                                             border: OutlineInputBorder(),

                                   ),
                                                   ),
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            children: [
                                                            Text('Room Type', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                           Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.35,
                                                             height: 26,
                                                            child: TextField(
                                                        controller: roomtype,
                                                       decoration: InputDecoration(
                                                        border: OutlineInputBorder(),
                                                      suffixIcon: PopupMenuButton<String>(
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                      onSelected: (String value) {
                                                       roomtype.text = value;
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return items1
                                            .map<PopupMenuItem<String>>((String value) {
                                          return new PopupMenuItem(
                                              child: new Text(value), value: value);
                                        }).toList();
                                      },
                                    ),
                                  ),
                                )
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            children: [
                                                            Text('Admit Date', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.35,
                                                             height: 26,
                                                            child: TextField(
                                                            controller: admitdate,
                                                            decoration: InputDecoration(
                                                              suffixIcon: Icon(Icons.calendar_today_rounded),

                                                             border: OutlineInputBorder(),
                                        ),
                                        onTap: () async {
                                          DateTime? pickeddate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101));

                                            if(pickeddate != null){
                                            setState(() {
                                           admitdate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                            });
                                            }
                                        },
                                       ),
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                          padding: const EdgeInsets.only(top: 15, left: 25),
                                                          child: Column(
                                                            children: [
                                                            Text('Discharge Date', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                            ],
                                                          ),
                                                        ),
                                                         Padding(
                                                         padding: const EdgeInsets.only(top: 1, left: 25),
                                                          child: Column(
                                                            children: [
                                   SizedBox(
                                                             width: MediaQuery.of(context).size.width * 0.35,
                                                             height: 26,
                                                            child: TextField(
                                                           controller: dischargedate,
                                                            decoration: InputDecoration(
                                                            suffixIcon: Icon(Icons.calendar_today_rounded),

                                                             border: OutlineInputBorder(),

                                   ),
                                    onTap: () async {
                                          DateTime? pickeddate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101));

                                            if(pickeddate != null){
                                            setState(() {
                                           dischargedate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                            });
                                            }
                                        },
                                                   ),
                                  ),
                                                            ],
                                                          ),
                                                        ),
                                  ],
                                                            ),
                                ),


                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 19, left: 25),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.18,
                                child: OutlinedButton(
                                     onPressed: (){
                                      updateData();
                                     Navigator.pushReplacement( context,  MaterialPageRoute(builder: (BuildContext context) => TodayIp()),          );
                                  showDialog(context: context,
                   builder: (context) {
                return Container(
               child: AlertDialog(
              title: Text('Successfully Updated..!!',  style: GoogleFonts.crimsonText(color: Colors.white, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
              icon: Icon(Icons.check_circle,color: Colors.green),
              backgroundColor:  Color.fromARGB(255, 48, 22, 97),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.green
                    ),
                  onPressed: (){
            Navigator.pop(context);
                  },
                  child: Text('OK')),
                )
              ],
            ),
                    );
                   }
                   );
                         },
                                    child: Text('Update',style:  GoogleFonts.crimsonText(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w800),),
                                     style: OutlinedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 48, 22, 97),
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),

                                            ),
                                          ),
                                           ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 19, left: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.18,
                                child: OutlinedButton(
                                      onPressed: () {
                                 Navigator.pop(context);
                                          },
                                                 child: Text('Cancel',style:  GoogleFonts.crimsonText(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w800),),

                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(255, 48, 22, 97),
                                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0),

                                            ),
                                          ),
                                           ),
                              ),
                            ),

                          ],
                        ),
                        ],

                      ),


                      ),
                    ),
                ],
                ),
              )
            ],
            ),
          ),
        ),

      );

//
   Future<void> updateData() async {
  // Replace the URL with the API endpoint URL that you want to update data on
  final String apiUrl = 'http://127.0.0.1:8000/ip/$Id/';

  // Replace with the data that you want to update
  final Map<String, dynamic> data = {"name" : name.text, "age" : age.text,"gender" : gender.text,"adres" : adres.text,"mobile" : mobile.text,
        "advance" : advance.text, "roomtype" : roomtype.text,"roomno" : roomno.text,"status" : status.text,"admitdate" : admitdate.text,
         "dischargedate" : dischargedate.text, "doctorname" : doctorname.text,"ipno" : ipno.text,"perid" : perid.text,
        };

  final response = await http.patch(Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));

  if (response.statusCode == 200) {

  } else {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to update!.'),
        duration: Duration(seconds: 3),
        backgroundColor:  Colors.red, // Set the background color
        behavior: SnackBarBehavior.floating, // Set the behavior
        shape: RoundedRectangleBorder( // Set the border shape
        borderRadius: BorderRadius.circular(8.0),
        ),
        action: SnackBarAction( // Set an action button
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );

  }
}


  }




