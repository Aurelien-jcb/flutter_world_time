import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // init data map
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String backgroundImg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/$backgroundImg'),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Changer de localisation',
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 28,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data['time'],
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 60,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(4.0, 4.0),
                            blurRadius: 7.0,
                            color: Color.fromARGB(124, 4, 4, 27),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
