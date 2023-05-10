import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    //set backgorund
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    print(data); //for debug (optional)
    
    return Scaffold(
      backgroundColor: bgColor,
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                OutlinedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      if (result != null) {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime']
                        };
                      }
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[350],
                  ),
                  // ignore: prefer_const_constructors
                  label: Text(
                    'Edit Location',
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20.0),
                Text(data['time'],
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
