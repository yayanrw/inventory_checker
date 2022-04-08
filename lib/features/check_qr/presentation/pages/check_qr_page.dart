import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';
import 'package:inventory_checker/core/utils/request_state.dart';
import 'package:inventory_checker/features/check_qr/presentation/provider/check_qr_notifier.dart';
import 'package:inventory_checker/features/check_qr/presentation/widgets/check_qr_status.dart';
import 'package:provider/provider.dart';

class CheckQrPage extends StatefulWidget {
  const CheckQrPage({Key? key}) : super(key: key);

  @override
  State<CheckQrPage> createState() => _CheckQrPageState();
}

class _CheckQrPageState extends State<CheckQrPage> {
  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();
    Provider.of<CheckQrNotifier>(context, listen: false).setNull();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckQrNotifier>(builder: (context, value, child) {
      if (value.checkQrState == RequestState.loading) {
        EasyLoading.show(status: MyStrings.checkingQrCode);
      } else if (value.checkQrState == RequestState.loaded) {
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
      }
      return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              color: MyColors.light,
            ),
            title: const Text(MyStrings.checkQR)),
        body: (value.checkQr == null)
            ? const CheckQrStatus(
                status: true,
                message: MyStrings.checkQR,
              )
            : (value.checkQr!.data == null
                ? const CheckQrStatus(
                    status: false,
                    message: MyStrings.notFound,
                  )
                : SizedBox(
                    height: 170,
                    child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppsConfig.defaultRadius),
                        ),
                        margin: const EdgeInsets.all(AppsConfig.defaultPadding),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              AppsConfig.defaultPadding * 2),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Produk',
                                      style: myTexts(weight: FontWeight.w700)
                                          .bodyText1,
                                    ),
                                    Text(
                                      value.checkQr!.data!.product!,
                                      style: myTexts().bodyText2,
                                      maxLines: 1,
                                    ),
                                  ]),
                              const SizedBox(height: AppsConfig.defaultPadding),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SKU',
                                      style: myTexts(weight: FontWeight.w700)
                                          .bodyText1,
                                    ),
                                    Text(
                                      value.checkQr!.data!.sku!,
                                      style: myTexts().bodyText2,
                                    ),
                                  ]),
                              const SizedBox(height: AppsConfig.defaultPadding),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Serialisasi',
                                      style: myTexts(weight: FontWeight.w700)
                                          .bodyText1,
                                    ),
                                    Text(
                                      value.checkQr!.data!.serialisasi!,
                                      style: myTexts().bodyText2,
                                    ),
                                  ]),
                              const SizedBox(height: AppsConfig.defaultPadding),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Serial Level',
                                      style: myTexts(weight: FontWeight.w700)
                                          .bodyText1,
                                    ),
                                    Text(
                                      value.checkQr!.data!.serialLevel! +
                                          // ignore: unrelated_type_equality_checks
                                          '(${value.checkQr!.data!.serialLevel! == 1 ? 'Koli' : (value.checkQr!.data!.serialLevel! == 2 ? 'Wrap' : 'Pcs')})',
                                      style: myTexts().bodyText2,
                                    ),
                                  ]),
                              const SizedBox(height: AppsConfig.defaultPadding),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Batch Number',
                                      style: myTexts(weight: FontWeight.w700)
                                          .bodyText1,
                                    ),
                                    Text(
                                      value.checkQr!.data!.batchNo!,
                                      style: myTexts().bodyText2,
                                    ),
                                  ]),
                            ],
                          ),
                        )),
                  )),
        floatingActionButton: FloatingActionButton(
            elevation: 2,
            child: const Icon(Icons.qr_code),
            onPressed: () => scanQRCode()),
      );
    });
  }

  Future<void> scanQRCode() async {
    String? _qrCodeScanResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _qrCodeScanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      _qrCodeScanResult =
          _qrCodeScanResult.replaceAll(RegExp(r'^https?://'), '');

      await Provider.of<CheckQrNotifier>(context, listen: false)
          .fetchGetByQrCode(_qrCodeScanResult);
    } on PlatformException {
      _qrCodeScanResult = MyStrings.failedToGetPlatformException;
    }
  }
}
