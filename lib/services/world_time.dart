import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time =
      ''; //time of location , should be nullable, bcoz not initialized till constructor is called
  String flag;
  String url;
  bool isDaytime = true;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      
      Response response = await get(
          Uri.parse('https://api.api-ninjas.com/v1/worldtime?city=$url'),
          headers: {"X-Api-Key": "ACsWCEE5suTC8ujyQlyZXXPizVUWxYa1gPfj7ElW"});
      
      Map data = jsonDecode(response.body);

      if (data['error'] == null) {
        DateTime datetime = DateTime.parse(data['datetime']);
        isDaytime = (datetime.hour > 6 && datetime.hour < 20) ? true : false;

        time = DateFormat.jm().format(datetime);
      } else {
        throw Exception(data['error']);
      }
    } catch (e) {
      print(e);
    }
  }
}
