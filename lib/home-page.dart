import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;
import 'package:untitled1/upload_image.dart';

import 'howwwww.dart';
import 'new-user.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);


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
          'H O M E  P A G E',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                height: screenHeight * 0.2,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: screenHeight * 0.2,
                  child: Image.asset('Assets/5137270.png'),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 20, 5),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      'To do Optical Character Recognition of a PDF or a photo using OCR API',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.0125,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Get.to(() => OCR1page());
                },
                child: Text(
                  'OCR',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                child: Container(
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 20, 5),
                  child: Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      'To view user information or create new users',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Get.to(() => howwweee());
                          },
                          child: Text(
                            'View Users',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.125,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Get.to(() => new_user());
                          },
                          child: Text(
                            'Create User',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.125,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
