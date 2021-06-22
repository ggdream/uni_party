import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/router/router.dart';

import 'package:uni_party/styles/styles.dart';

class AuthLoginByCipherPage extends StatefulWidget {
  const AuthLoginByCipherPage({Key? key}) : super(key: key);

  @override
  _AuthLoginByCipherPageState createState() => _AuthLoginByCipherPageState();
}

class _AuthLoginByCipherPageState extends State<AuthLoginByCipherPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLooked = false;

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
          onPrimary: Colors.black,
          textStyle: TextStyle(
            fontSize: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
          suffixIcon:
              _accountController.text.isEmpty ? null : _clearAccountIcon(),
          filled: true,
          fillColor: ColorsX.orange,
          border: BorderX.outlineLoginInputBorder,
          errorBorder: BorderX.outlineLoginInputBorder,
          enabledBorder: BorderX.outlineLoginInputBorder,
          focusedBorder: BorderX.outlineLoginInputBorder,
          disabledBorder: BorderX.outlineLoginInputBorder,
          focusedErrorBorder: BorderX.outlineLoginInputBorder,
          contentPadding: const EdgeInsets.all(24),
          hintText: '账号',
        ),
      ),
    );
  }

  Widget _clearAccountIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _accountController.text = '';
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          Icons.highlight_remove_rounded,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget passwordInputField() {
    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorsX.green,
        ),
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: _passwordController,
        obscureText: !_isLooked,
        decoration: InputDecoration(
          suffixIcon: _lookPasswordIcon(),
          filled: true,
          fillColor: ColorsX.greyLight,
          border: BorderX.outlineLoginInputBorder,
          errorBorder: BorderX.outlineLoginInputBorder,
          enabledBorder: BorderX.outlineLoginInputBorder,
          focusedBorder: BorderX.outlineLoginInputBorder,
          disabledBorder: BorderX.outlineLoginInputBorder,
          focusedErrorBorder: BorderX.outlineLoginInputBorder,
          contentPadding: const EdgeInsets.all(24),
          hintText: '密码',
        ),
      ),
    );
  }

  Widget _lookPasswordIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLooked = !_isLooked;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: _isLooked
            ? Icon(
                Icons.visibility_rounded,
                color: Colors.black,
              )
            : Icon(
                Icons.visibility_off_rounded,
                color: Colors.black,
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
        Text('忘记密码？'),
        GestureDetector(
          onTap: () => Get.toNamed(RouteNames.AuthLoginFoundPassword),
          child: MouseRegion(
            child: Text(
              '找回密码',
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
        Text('第一次来到这里？'),
        GestureDetector(
    onTap: () => Get.toNamed(RouteNames.AuthLoginByCode),
    child: MouseRegion(
          child: Text(
            '加入我们',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          cursor: SystemMouseCursors.click,
        ),),
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
          '乖乖，\n现在就登陆吧！！',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
