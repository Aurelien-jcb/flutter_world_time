import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool? isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  // }
  Future<String> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].toString().substring(0, 3);

      // create dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));

      // set time properti and format with intl package
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);

      return time;
    } catch (error) {
      print('cauth error $error');
      time = "Impossible d'afficher les données demandées";
      return time;
    }
  }
}
