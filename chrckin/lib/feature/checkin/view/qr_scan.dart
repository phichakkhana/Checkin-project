import 'package:chrckin/feature/checkin/view/checkin.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QR_Checkin extends StatefulWidget {
  QR_Checkin({Key? key}) : super(key: key);

  @override
  State<QR_Checkin> createState() => _QR_CheckinState();
}

class _QR_CheckinState extends State<QR_Checkin> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red.shade900,
            borderRadius: 20,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width - 50),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((event) {
      barcode = event;
      controller.stopCamera();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckIn(
                    isChecked: false,
                  )));
    });
  }
}
