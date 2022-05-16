import 'package:chrckin/base/colors.dart';
import 'package:chrckin/base/size.dart';
import 'package:chrckin/base/store.dart';
import 'package:chrckin/base/ui_strings.dart';
import 'package:chrckin/feature/checkin/view/checkin.dart';
import 'package:chrckin/feature/checkin/view/qr_scan.dart';
import 'package:chrckin/feature/login/view/login.dart';
import 'package:chrckin/feature/qrcode/qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  final bool isChecked;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget _buildUserCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: MaterailSize.cardheight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MaterailSize.basiccircular),
        border: Border.all(color: Colors.pink),
      ),
      child: Container(
        height: MaterailSize.subcardheight,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: MaterailSize.smallpadding),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.circleAvatarcolor,
                child: Image.asset('assets/Checkinlogo.png')),
            SizedBox(width: MaterailSize.smallpadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(UiStrings.name_surname +
                    Store.storage['firstname'].toString() +
                    '  ' +
                    Store.storage['lastname'].toString()),
                Text(UiStrings.role + Store.storage['role'].toString()),
                Text(UiStrings.department +
                    Store.storage['department'].toString()),
                Row(
                  children: [
                    Text(UiStrings.status),
                    Text(
                      widget.isChecked == true
                          ? UiStrings.check_true
                          : UiStrings.check_false,
                      style: TextStyle(
                          color: widget.isChecked == true
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MaterailSize.smallpadding),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(
          MaterailSize.basiccircular,
        ),
        // border: Border.all(color: Colors.pink),
      ),
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    widget.isChecked == true
                        ? MaterialPageRoute(
                            builder: (context) => CheckIn(
                              isChecked: widget.isChecked,
                            ),
                          )
                        : MaterialPageRoute(
                            builder: (context) => QR_Checkin(),
                          ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MaterailSize.smallpadding),
                  height: MaterailSize.buttonheight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(MaterailSize.basiccircular),
                    border: Border.all(color: Colors.pink),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: MaterailSize.buttonpadding),
                        Text(
                          widget.isChecked == false
                              ? UiStrings.checkin
                              : UiStrings.checkout,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MaterailSize.smallpadding,
              ),
              GestureDetector(
                onTap: () async {
                  await FlutterPhoneDirectCaller.callNumber('0814183900');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MaterailSize.smallpadding),
                  height: MaterailSize.buttonheight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(MaterailSize.basiccircular),
                    border: Border.all(color: Colors.pink),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: MaterailSize.buttonpadding),
                      Text(UiStrings.contact_admin),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MaterailSize.smallpadding,
              ),
              GestureDetector(
                onTap: () {
                  cleanState();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MaterailSize.smallpadding),
                  height: MaterailSize.buttonheight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(MaterailSize.basiccircular),
                    border: Border.all(color: Colors.pink),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: MaterailSize.buttonpadding),
                        Text(UiStrings.logout),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                    Color(0xFF162C9A),
                    Color(0xFFFFD027),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildUserCard(context),
                SizedBox(height: 200),
                _buildMenu(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
