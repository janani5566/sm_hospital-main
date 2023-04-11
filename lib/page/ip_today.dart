import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:sm_hospital/page/add_page.dart';
import 'package:sm_hospital/page/update.dart';
import 'package:sm_hospital/widget/navigation_drawer_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodayIp extends StatefulWidget {

  @override
  State<TodayIp> createState() => _TodayIpState();
}

class _TodayIpState extends State<TodayIp> {
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

     Future<void> deleteRow(int index) async {
    final response = await http.delete(Uri.parse('http://127.0.0.1:8000/ip/$index'));
    if (response.statusCode == 204) {
        setState(() {
        _data.removeAt(index);

      });
    } else {

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.add, size: 30,),
              onPressed: (){
           Navigator.push(context, MaterialPageRoute(
           builder: (context) => FavouritesPage(),
                    )
                      );
              },

            ),

          ],
        ),
        backgroundColor:  Color.fromARGB(255, 48, 22, 97),
        title: Center(child: Text( 'Today IP',style: GoogleFonts.crimsonText(),)),
      ),
      body: FutureBuilder(

        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
                      DataColumn(
                   label: Expanded(
                   child: Text(
                        'Update',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
                      DataColumn(
                   label: Expanded(
                   child: Text(
                        'delete',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
              DataColumn(
                   label: Expanded(
                   child: Text(
                        'IpNo',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
              DataColumn(
               label: Expanded(
                   child: Text(
                      'PerID',
                    style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
              ),
              ),
             ),

     DataColumn(
     label: Expanded(
     child: Text(
     'AdmitDate',
      style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'DischargeDate',
      style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'DoctorName',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)

     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Name',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
                                           DataColumn(
     label: Expanded(
     child: Text(
     'Age',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Gender',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Address',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Mobile',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
      DataColumn(
     label: Expanded(
     child: Text(
     'Advance',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
      DataColumn(
     label: Expanded(
     child: Text(
     'RoomType',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
       DataColumn(
     label: Expanded(
     child: Text(
     'RoomNo',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),

      DataColumn(
     label: Expanded(
     child: Text(
     'Status',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),

                ],
                rows: List<DataRow>.generate(
                  snapshot.data!.length,
                  (index) => DataRow(
                    cells: [
                          DataCell(IconButton(
                  icon: new Icon(Icons.edit,color: Color.fromARGB(255, 25, 146, 29),),
                  onPressed: () {

                  var Id  = snapshot.data![index]['id'];
                  var name  = snapshot.data![index]['name'];
                  var ipno  = snapshot.data![index]['ipno'];
                  var perid  = snapshot.data![index]['perid'];
                  var admitdate  = snapshot.data![index]['admitdate'];
                  var dischargedate  = snapshot.data![index]['dischargedate'];
                  var doctorname  = snapshot.data![index]['doctorname'];
                  var gender  = snapshot.data![index]['gender'];
                  var age  = snapshot.data![index]['age'];
                  var adres  = snapshot.data![index]['adres'];
                  var mobile  = snapshot.data![index]['mobile'];
                  var advance  = snapshot.data![index]['advance'];
                  var roomtype  = snapshot.data![index]['roomtype'];
                  var roomno  = snapshot.data![index]['roomno'];
                  var status  = snapshot.data![index]['status'];
                 Navigator.push(context, MaterialPageRoute( builder: (context) => UpdatePage(Id: Id,name: name,age: age,doctorname:doctorname,status: status,
                 roomno:roomno,roomtype:roomtype,advance:advance,mobile:mobile,adres: adres,gender:gender,dischargedate:dischargedate,admitdate:admitdate,
                 perid:perid,ipno:ipno
                  ),  ));

                     },
    )),
                  DataCell(IconButton(
                  icon: new Icon(Icons.delete,color: Colors.red,),
                  onPressed: () async {

                   deleteRow(snapshot.data![index]['id']);
                 // Navigator.push(context, MaterialPageRoute( builder: (context) => TodayIp(),  ));
                    Navigator.pushReplacement(
                   context,
               MaterialPageRoute(builder: (BuildContext context) => TodayIp()),
  );
                  fetchData();

                  } ,

    )),
                      DataCell(Text(snapshot.data![index]['ipno'].toString())),
                      DataCell(Text(snapshot.data![index]['perid'])),
                      DataCell(Text(snapshot.data![index]['admitdate'])),
                      DataCell(Text(snapshot.data![index]['dischargedate'])),
                      DataCell(Text(snapshot.data![index]['doctorname'])),
                      DataCell(Text(snapshot.data![index]['name'])),
                      DataCell(Text(snapshot.data![index]['age'])),
                      DataCell(Text(snapshot.data![index]['gender'])),
                      DataCell(Text(snapshot.data![index]['adres'])),
                      DataCell(Text(snapshot.data![index]['mobile'])),
                      DataCell(Text(snapshot.data![index]['advance'])),
                      DataCell(Text(snapshot.data![index]['roomtype'])),
                      DataCell(Text(snapshot.data![index]['roomno'])),
                      DataCell(Text(snapshot.data![index]['status'])),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },

      ),
    );
  }
}
