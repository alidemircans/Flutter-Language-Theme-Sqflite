import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'newuser': 'Add new user',
          'title': 'Home Page',
        },
        'tr_TR': {
          'newuser': 'Yeni kullanıcı ekle',
          'title': 'Anasayfa',
        }
      };
}
