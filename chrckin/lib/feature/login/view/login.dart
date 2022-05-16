import 'package:chrckin/base/size.dart';
import 'package:chrckin/base/store.dart';
import 'package:chrckin/base/ui_strings.dart';
import 'package:chrckin/feature/home/view/homepage.dart';
import 'package:chrckin/feature/register/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 201, 203, 210),
                      Color(0xFFFFD027),
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius:
                          BorderRadius.circular(MaterailSize.basiccircular),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: MaterailSize.smallpadding),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MaterailSize.smallpadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Checkinlogo.png',
                            width: 200,
                            height: 200,
                          ),
                          SizedBox(height: 50),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MaterailSize.basiccircular),
                            ),
                            child: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนบัญชีผู้ใช้';
                                } else if (value != Store.storage['username']) {
                                  return 'ไม่พบบัญชีผู้ใช้';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.username,
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MaterailSize.basiccircular),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนรหัสผ่าน';
                                } else if (value != Store.storage['password']) {
                                  return 'รหัสผ่านไม่ถูกต้อง';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.password,
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Store.token = true;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homepage(
                                      isChecked: false,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MaterailSize.basiccircular),
                                border: Border.all(color: Colors.black),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF162C9A),
                                    Color.fromARGB(255, 245, 245, 245),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  UiStrings.login,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MaterailSize.basiccircular),
                                border: Border.all(color: Colors.black),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFFFD027),
                                    Color.fromARGB(255, 240, 240, 243),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  UiStrings.register,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 22, 22)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
