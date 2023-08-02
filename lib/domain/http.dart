import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // Successful response, parse the data
    final data = json.decode(response.body);
    // Process and use the data as needed
    return data;
  } else {
    // Handle errors
    print('Request failed with status: ${response.statusCode}');

    return null;
  }
}
