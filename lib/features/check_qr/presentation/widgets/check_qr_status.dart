import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';

class CheckQrStatus extends StatelessWidget {
  const CheckQrStatus({
    Key? key,
    required this.status,
    required this.message,
  }) : super(key: key);

  final bool status;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: !status
                  ? SvgPicture.asset('assets/images/404.svg',
                      height: 400, width: 250)
                  : Image.asset(
                      'assets/images/check_qr.png',
                      height: 400,
                      width: 250,
                    ),
            ),
            Text(
              message,
              style: myTexts(color: MyColors.textBlack).headline5,
            ),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
