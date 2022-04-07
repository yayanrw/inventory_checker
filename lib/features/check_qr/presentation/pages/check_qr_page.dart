import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';

class CheckQrPage extends StatefulWidget {
  const CheckQrPage({Key? key}) : super(key: key);

  @override
  State<CheckQrPage> createState() => _CheckQrPageState();
}

class _CheckQrPageState extends State<CheckQrPage> {
  String? _scannedQRCode;

  Future<void> scanQRCode() async {
    String? barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    setState(() {
      _scannedQRCode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            color: MyColors.light,
          ),
          title: const Text(MyStrings.checkQR)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Image.asset(
                  'assets/images/check_qr.png',
                  height: 400,
                  width: 250,
                ),
              ),
              Text(
                MyStrings.checkQR,
                style: myTexts(color: MyColors.textBlack).headline5,
              ),
              Text(_scannedQRCode ?? ''),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 2,
          child: const Icon(Icons.qr_code),
          onPressed: () => scanQRCode()),
    );
  }
}
