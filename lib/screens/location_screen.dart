import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String remark, place;
  int temperature;
  WeatherModel wm = WeatherModel();
  String weatherIcon, msg;
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }
  void failureHandler()
  {
    Alert(
      context: context,
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
  void updateUI(dynamic weatherData)
  {
setState(() {
  if(weatherData==null)
    {temperature = 0;
    msg = "Unable to get data";
    weatherIcon = "Error";
    place ="";

    failureHandler();
return;    }

  remark = weatherData['weather'][0]['description'];
  temperature = weatherData['main']['temp'];
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = wm.getWeatherIcon(condition);
    msg = wm.getMessage(temperature);
 place = weatherData['name'];
 place = "in $place";

});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weatherData = await wm.getLocationWeather();
                      setState(() {

                      updateUI(weatherData);

                      });
                      },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context)
                          {
                            return CityScreen();
                          }
                      )
                      );
                      print(cityName);
                      if(cityName!=null)
                        {
                         var weatherData = await     wm.getCityWeather(cityName);
                         setState(() {
                           updateUI(weatherData);
                         });
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg $place!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//