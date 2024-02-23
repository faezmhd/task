import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {

  getLocationHere() async{
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position.latitude.toString());
    print(position.longitude.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () async{
                    var result = await getLocationHere();
                    print(result);


                  }, child: const Text('get location'))
                ],
              ),
            ),
          ),
    );
  }
}
