import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/features/check_qr/presentation/widgets/check_qr_status.dart';

class ScanOutPage extends StatelessWidget {
  const ScanOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            color: MyColors.light,
          ),
          title: const Text(MyStrings.scanOut)),
      body: const CheckQrStatus(
        status: true,
        message: MyStrings.scanOut,
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 2,
          child: const Icon(Icons.qr_code),
          onPressed: () => _startBarcodeScanStream()),
    );
  }

  Future<void> _startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.QR)!
        .listen((barcode) {
      print(barcode);
    });
  }
}
