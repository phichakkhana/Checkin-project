import 'package:chrckin/base/size.dart';
import 'package:chrckin/base/store.dart';
import 'package:chrckin/base/ui_strings.dart';
import 'package:chrckin/feature/home/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
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
                      Color.fromARGB(255, 180, 181, 187),
                      Color(0xFFFFD027),
                    ],
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Container(
                    height: 550,
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
                          Text(
                            UiStrings.register,
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนบัญชีผู้ใช้';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.username,
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนรหัสผ่านของท่าน';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: UiStrings.password,
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนชื่อของท่าน';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.name,
                                prefix: SizedBox(width: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: surnameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนนามสกุลของท่าน';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.surname,
                                prefix: SizedBox(width: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: roleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนตำแหน่งของท่าน';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: UiStrings.register_role,
                                prefix: SizedBox(width: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาป้อนแผนกของท่าน';
                                }
                                return null;
                              },
                              controller: departmentController,
                              decoration: InputDecoration(
                                hintText: UiStrings.register_department,
                                prefix: SizedBox(width: 20),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Store.storage['username'] =
                                    usernameController.text;
                                Store.storage['password'] =
                                    passwordController.text;
                                Store.storage['firstname'] =
                                    nameController.text;
                                Store.storage['lastname'] =
                                    surnameController.text;
                                Store.storage['role'] = roleController.text;
                                Store.storage['department'] =
                                    departmentController.text;
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
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MaterailSize.basiccircular),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(UiStrings.register),
                              ),
                            ),
                          ),
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
