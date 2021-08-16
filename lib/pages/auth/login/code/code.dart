import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import '../common/common.dart';

class AuthLoginByCodePage extends StatefulWidget {
  const AuthLoginByCodePage({Key? key}) : super(key: key);

  @override
  _AuthLoginByCodePageState createState() => _AuthLoginByCodePageState();
}

class _AuthLoginByCodePageState extends State<AuthLoginByCodePage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 8,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 8),
            const _WelcomeView(),
            Spacer(flex: 1),
            const _JoinUsView(),

            Spacer(flex: 4),

            /// 账号输入框
            accountInputField(),
            Spacer(flex: 1),

            /// 密码输入框
            passwordInputField(),
            Spacer(flex: 1),
            const _ForgetPwdView(),
            Spacer(flex: 4),

            /// 发送网络请求，提交信息
            submitBtn(),
            Spacer(flex: 8),
            LabelUserServiceProtocolWidget(),
          ],
        ),
      ),
    );
  }

  Widget submitBtn() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitData,
        child: Text('登录'),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          textStyle: TextStyle(
            fontSize: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Future<void> _submitData() async {
    print(_accountController.text);
    print(_passwordController.text);
  }

  Widget accountInputField() {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorsX.green,
        ),
      ),
      child: TextField(
        onChanged: (String value) {
          setState(() {});
        },
        cursorColor: Colors.black,
        controller: _accountController,
        decoration: InputDecoration(
          suffixIcon: _sendVerifyCodeView(),
          filled: true,
          fillColor: ColorsX.greyLight,
          border: BorderX.outlineLoginInputBorder,
          errorBorder: BorderX.outlineLoginInputBorder,
          enabledBorder: BorderX.outlineLoginInputBorder,
          focusedBorder: BorderX.outlineLoginInputBorder,
          disabledBorder: BorderX.outlineLoginInputBorder,
          focusedErrorBorder: BorderX.outlineLoginInputBorder,
          contentPadding: const EdgeInsets.all(8),
          hintText: '手机号或邮箱',
        ),
      ),
    );
  }

  Widget _sendVerifyCodeView() {
    return TextButton(
      child: Text('发送'),
      style: TextButton.styleFrom(primary: ColorsX.green),
      onPressed: _sendVerifyCode,
    );
  }

  Future<void> _sendVerifyCode() async {}

  Widget passwordInputField() {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorsX.green,
        ),
      ),
      child: TextField(
        maxLength: 6,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        cursorColor: Colors.black,
        controller: _passwordController,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsX.greyLight,
          border: BorderX.outlineLoginInputBorder,
          errorBorder: BorderX.outlineLoginInputBorder,
          enabledBorder: BorderX.outlineLoginInputBorder,
          focusedBorder: BorderX.outlineLoginInputBorder,
          disabledBorder: BorderX.outlineLoginInputBorder,
          focusedErrorBorder: BorderX.outlineLoginInputBorder,
          contentPadding: const EdgeInsets.all(8),
          hintText: '输入6位验证码',
        ),
      ),
    );
  }
}

class _ForgetPwdView extends StatelessWidget {
  const _ForgetPwdView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('想要密码登录？'),
        GestureDetector(
          onTap: () => Get.offAndToNamed(RoutesNamespace.AuthLoginByCipher),
          child: MouseRegion(
            child: Text(
              '密码登录',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            cursor: SystemMouseCursors.click,
          ),
        ),
      ],
    );
  }
}

class _JoinUsView extends StatelessWidget {
  const _JoinUsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('没注册过？没关系，登陆即注册'),
      ],
    );
  }
}

class _WelcomeView extends StatelessWidget {
  const _WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '验证码登录',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
