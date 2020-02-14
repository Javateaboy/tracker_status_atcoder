import 'package:flutter/material.dart';
import 'package:tracker_status_atcoder/core/models/user.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  static String id = '/user_details';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
    DateTime formatData = DateTime.parse(user.lastUpdate);
    String formattedData = DateFormat('yyyy-MM-dd').format(formatData);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.userId,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  user.userId,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: showColorByRate(user.color),
                    fontFamily: 'Lobster',
                  ),
                ),
              ),
              // TODO: AtCoderのサイトを表示する。
              Icon(
                Icons.exit_to_app,
                color: showColorByRate(user.color),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Rating',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'High',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          user.highestRating.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            color: showColorByRate(user.color),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Now',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          user.rating.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            color: showColorByRate(user.color),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Text(
            'JOIN Competitions: ${user.competitions.toString()}',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Rank',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      user.rank.toString(),
                      style: TextStyle(fontSize: 50.0),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(formattedData)
        ],
      )),
    );
  }
}

Color showColorByRate(String color) {
  switch(color) {
    case 'red':
      return Colors.red;
    case 'orange':
      return Colors.orange;
    case 'yellow':
      return Colors.yellow;
    case 'blue':
      return Colors.blue;
    case 'cyan':
      return Colors.cyan;
    case 'green':
      return Colors.green;
    case 'brown':
      return Colors.brown;
  }
  return Colors.grey;
}