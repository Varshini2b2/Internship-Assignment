import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'text-editing-controller.dart';

class new_user extends StatefulWidget {
  const new_user({Key? key}) : super(key: key);

  @override
  State<new_user> createState() => _new_userState();
}

class _new_userState extends State<new_user> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _jobController.dispose();
    _idController.dispose();
  }

  postData()async{
    try {
      var response = await
      http.post(Uri.parse('https://reqres.in/api/users'),
          body: {
            'name' : _nameController.text,
            'job' : _jobController.text,
            'id' : _idController.text,
          });
      print(response.body);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Spacing
              Flexible(
                child: Container(),
                flex: 1,
              ),

              /// Svg image
              Image.asset(
                'Assets/logo.png',
                color: Colors.blueAccent.shade100,
                height: 64,
              ),

              /// Spacing
              const SizedBox(height: 64),

              /// text field input for email
              TextFieldInput(
                textEditingController: _nameController,
                textInputType: TextInputType.name,
                hinText: "Enter your Name",
              ),

              const SizedBox(height: 24),

              TextFieldInput(
                textEditingController: _jobController,
                textInputType: TextInputType.name,
                hinText: "Enter your Job",
              ),

              const SizedBox(height: 24),

              /// text field input for email
              TextFieldInput(
                textEditingController: _idController,
                textInputType: TextInputType.number,
                hinText: "Enter your ID",
              ),

              /// spacing
              const SizedBox(height: 24),

              /// button for login
              InkWell(
                onTap: () async {
                  postData();
                },
                child: Container(
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blueAccent,
                  ),
                ),
              ),

              /// spacing
              const SizedBox(height: 12),

              /// Spacing
              Flexible(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
