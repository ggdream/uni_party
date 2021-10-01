import 'package:flutter/material.dart';
import 'package:uni_party/widgets/rounded/avatar.dart';

class ChatSearchFriendPage extends StatefulWidget {
  const ChatSearchFriendPage({Key? key}) : super(key: key);

  @override
  _ChatSearchFriendPageState createState() => _ChatSearchFriendPageState();
}

class _ChatSearchFriendPageState extends State<ChatSearchFriendPage> {
  List<dynamic> result = [{}, {}, {}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: RoundedAvatar.network(
              'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/126.jpg',
              size: 42,
            ),
            title: Text('科罗克娜'),
            subtitle: Text('用户号：166566'),
            trailing: RawChip(
              label: Text('学校'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        });
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: textFieldView(),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('取消'),
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget textFieldView() {
    return TextField(
      autofocus: true,
      cursorColor: Colors.black,
      onChanged: _searchValue,
      decoration: InputDecoration(
        hintText: '输入用户ID或者昵称',
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  Future<void> _searchValue(String value) async {
    print(value);
  }
}
