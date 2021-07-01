import 'dart:convert';
import 'dart:io';

class IconImage {
  IconImage(this.prefix);

  final String prefix;

  var fontFamily = '';

  List<IconModel> parse(String src) {
    final file = File(src);
    final text = file.readAsStringSync();

    dynamic dataMap = [];
    try {
      dataMap = json.decode(text);
    } catch (e) {
      print(e);
      exit(-1);
    }

    fontFamily = dataMap['font_family'][0].toUpperCase() +
        dataMap['font_family'].substring(1);
    List<dynamic> jsonMap = dataMap['glyphs'];
    List<IconModel> res = [];
    jsonMap.forEach(
      (e) => res.add(
        IconModel(
          name: e['name'],
          fontClass: e['font_class'],
        ),
      ),
    );

    return res;
  }

  void write2File(List<IconModel> data, String dst) {
    final startLine = 'class $fontFamily {';
    final endLine = '\n}\n';

    var res = '';
    res += startLine;
    for (var v in data) {
      res +=
          "\n\n\t/// ${v.name}\n\tstatic const ${v.fontClass} = '${prefix + v.fontClass + '.svg'}';";
    }
    res += endLine;

    final file = File(dst == '.' ? './iconimage.dart' : dst);
    file.writeAsStringSync(res, flush: true);
  }

  void run(String src, String dst) {
    final data = parse(src);
    write2File(data, dst);
  }
}

class IconModel {
  final String name;
  final String fontClass;

  IconModel({
    required this.name,
    required this.fontClass,
  });
}

void main(List<String> args) {
  if (args.length < 2) {
    print('参数不足！！');
    return;
  }

  IconImage('assets/icons/common/').run(args[0], args[1]);
  print('转换完成！！');
}
