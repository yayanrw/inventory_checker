import 'package:flutter/material.dart';

class CheckQrPage extends StatelessWidget {
  const CheckQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(leading: const BackButton(), title: const Text('Check QR')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/check_qr.png', height: 200),
          const Text(
            'Check QR',
            style: TextStyle(fontSize: 24),
          ),
        ],
      )),
    );
  }
}
