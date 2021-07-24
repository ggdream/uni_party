import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/widgets/radio_label/radio_label.dart';
import 'package:uni_party/router/router.dart';

class RadioLabelUserServiceProtocolWidget extends StatelessWidget {
  const RadioLabelUserServiceProtocolWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioLabelWidget(
      onChanged: onChanged,
      child: RichText(
        text: TextSpan(
          text: '我已认真阅读并同意',
          style: TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '《用户服务协议》',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(RoutesNamespace.HelperProtocolsService);
                },
            ),
          ],
        ),
      ),
    );
  }
}

class LabelUserServiceProtocolWidget extends StatelessWidget {
  const LabelUserServiceProtocolWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '登录即视为同意',
        style: TextStyle(
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: '《用户服务协议》',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(RoutesNamespace.HelperProtocolsService);
              },
          )
        ],
      ),
    );
  }
}
