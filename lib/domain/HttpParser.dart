import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

Future<String> fetchDataDoublePoint(
    String webSite, String parameterToParse) async {
  final response = await http.get(Uri.parse(webSite));
  String parameter = 'N/A';

  if (response.statusCode == 200) {
    final document = htmlParser.parse(response.body);
    final elements = document.querySelectorAll('.themed-grid-col');

    for (final element in elements) {
      print(element.text);
      final text = element.text;
      if (text.contains(parameterToParse)) {
        final parts = text.split(':');
        if (parts.length > 1) {
          parameter = parts[1].trim();
        }
        break;
      }
    }
  } else {
    print('Failed to fetch data');
  }

  return parameter;
}
