import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRTEST extends StatelessWidget {
  const QRTEST({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(50),
            child: QrImage(data: 'ทำการสแกน QR CODE สำเร็จ'),
          ),
        ),
      ),
    );
  }
}
