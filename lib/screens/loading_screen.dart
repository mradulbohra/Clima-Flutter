import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';

import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState()
  {
    super.initState();
    getLocationData();
//    getData();
  }
  void failureHandler()
  {
    print('in here');

    Alert(
      //context: context,
      type: AlertType.error,
      title: "Location Error",
      desc: "\'Clima\' is unable to fetch the location of the device",
      buttons: [
        DialogButton(
          child: Text(
            "Exit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => SystemNavigator.pop(),
          width: 120,
        )
      ],
    ).show();


  }

  double latitude, longitude;
WeatherModel wm = WeatherModel();
  void getLocationData() async {
  var weatherData = await  wm.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationWeather: weatherData,
      );
    }
    ),
    );
//    getData();

  }
  

//  void getLocation() async{
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
//          duration: Duration(milliseconds: 1500),
        ),
      ),
    );
  }
}
