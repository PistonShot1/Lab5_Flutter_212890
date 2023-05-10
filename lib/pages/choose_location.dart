import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        url: 'Kuala Lumpur', location: 'Kuala Lumpur', flag: 'malaysia.png')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
    //navigate to home screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // ignore: prefer_const_constructors
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
