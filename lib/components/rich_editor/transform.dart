/// 将选择出的路径转为规定格式
class TransformX {
  /// 图片
  static String image(String path) => '![1]($path)';

  /// 视频
  static String video(String path) => '![2]($path)';

  /// 重点强调
  static String emphasis(String text) => '`$text`';

  /// 网络链接
  static String link(String text, String url) => '[$text]($url)';
}
