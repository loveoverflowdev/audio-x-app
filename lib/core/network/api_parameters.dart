import 'dart:math';

class ApiParameters {
  final baseUrl = 'http://103.82.27.94:8080/api/';

  String novelListUri({
    required String searchText,
  }) =>
      'app/novel-list/?searchText=$searchText';

  String novelChapterListUri({
    required String novelId,
  }) =>
      'app/novel-chapter-list/$novelId';

  // Timeout
  void setTimeout({required int seconds}) {
    assert(
      seconds <= 10 && seconds >= 3,
      'The timeout seconds must be between 3 and 10',
    );
    _timeout = Duration(seconds: max(seconds, 3));
  }

  // Utils
  String avatarUrlByUsername(String username) =>
      'https://avatars.dicebear.com/api/initials/$username.png';
  final uploadImageUri = 'Upload/Image';

  static final _instance = ApiParameters._internal();
  factory ApiParameters() => _instance;
  ApiParameters._internal();

  Duration _timeout = const Duration(seconds: 30);
  Duration get timeout => _timeout;
}

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT');

  const HttpMethod(this.raw);
  final String raw;
}
