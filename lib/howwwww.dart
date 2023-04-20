import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class howwweee extends StatefulWidget {
  const howwweee({Key? key}) : super(key: key);

  @override
  State<howwweee> createState() => _howwweeeState();
}

String stringResponse = "1";
Map mapResponse = {'zero': 0, 'one': 1, 'two': 2};
Map dataResponse = {'zero': 0, 'one': 1, 'two': 2};
List listResponse = [1];
class _howwweeeState extends State<howwweee> {

  Future apicall()async{
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if(response.statusCode == 200){
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      //deepPurpleAccent.shade100
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'U S E R  I N F O',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listResponse == null? 0: listResponse.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 5.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.5,
                    ),
                  ),
                  // border: Border.all(),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                      child: Container(
                          height: screenHeight * 0.15,
                          child: Image.network(listResponse[index]["avatar"])
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              listResponse[index]['first_name'].toString() + " " + listResponse[index]['last_name'].toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "ID Number - " + listResponse[index]['id'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              listResponse[index]['email'].toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
