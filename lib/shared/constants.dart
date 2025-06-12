import 'network/remote/dio_helper.dart';

String? globalToken;

Future<void> login(String username, String password) async {
  var response = await DioHelper.postData(
    url: 'api/login',
    data: {'username': username, 'password': password},
  );

  if (response.statusCode == 200) {
    globalToken = response.data['token'];
    print('Login successful, token saved');
  } else {
    print('Login failed');
  }
}
