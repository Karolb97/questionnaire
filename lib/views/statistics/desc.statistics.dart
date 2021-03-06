// package
import 'package:flutter/material.dart';

// class
import '../../models/models.dart';
import '../../modules/http.client.dart';
import '../../models/widget.models.dart';
import '../../modules/localizations.dart';

class DescStatisticsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _DescStatisticsPage();
}

class _DescStatisticsPage extends State<DescStatisticsPage> {

  int minutes;
  int seconds;
  Duration duration;
  DemoLocalizations local = new DemoLocalizations();
  CustomHttpClient httpClient = new CustomHttpClient();

  @override
  void initState() {
    super.initState();
    duration = new Duration(seconds: descStatistics.countTime);
    print(duration.inSeconds.toString());
    minutes = duration.inMinutes;
    seconds = duration.inSeconds - (minutes * 60);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CustomNavigationBar(
        title: new Text(descStatistics.testTitle, style: new TextStyle(color: Colors.white, fontSize: 15.0),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: new SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new SingleChildScrollView(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                          '${local.localizedValues[languageCode]['descStatisticsPage']['date_passing']}: ${descStatistics.date}',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: new Text(
                          '${local.localizedValues[languageCode]['descStatisticsPage']['scored_points']}: ${descStatistics.numberPoint.toString()}',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                        child: new Text(
                          '${local.localizedValues[languageCode]['descStatisticsPage']['time']}: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 5.0, bottom: 13.5),
                        child: new Text(
                          '${local.localizedValues[languageCode]['descStatisticsPage']['result']}: ${descStatistics.toTitle}',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        child: new Text(
                          descStatistics.description,
                          textAlign: TextAlign.justify,
                          style: new TextStyle(fontSize: 16.0, height: 1.5),
                        ),
                      )
                    ],
                  )
                ),
              ),
            ],
          )
        )
      )
    );
  }
}