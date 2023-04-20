import 'dart:io';
// import 'dart:html';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class OCR1page extends StatefulWidget {
  const OCR1page({Key? key}) : super(key: key);

  @override
  State<OCR1page> createState() => _OCR1State();
}

class _OCR1State extends State<OCR1page> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "O C R",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Click the plus icon below',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.0125,
                      ),
                      Text(
                        'By clicking the plus icon below, the image will be OCR-ed and be displayed to the Console.'
                            'The image is uploaded to the internet and the URL of the image is used to OCR the image.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            alignment: Alignment.bottomRight,
            color: Colors.grey.shade100,
            child: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              radius: 30,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  UploadImage();
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}

void UploadImage() async{
  var headers = {
    'apikey': 'K83094311488957'
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://api.ocr.space/parse/image'));
  request.fields.addAll({
    'language': 'eng',
    'isOverlayRequired': 'false',
    'url': 'https://i.postimg.cc/y6jd02gq/hourly-invoice-template-0aa125c4132316aeccc136b22a0c5b83.png',
    'iscreatesearchablepdf': 'false',
    'issearchablepdfhidetextlayer': 'false'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
}
