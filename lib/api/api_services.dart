import 'package:http/http.dart' as http;
class ApiServices
{
  static getAllEmp()
  {
  var url = Uri.parse('https://graduation.al-embrator.com/api/users');
  Uri.https(
    'graduation.al-embrator.com',
    ''
  );
  http.get(url);
  }
}