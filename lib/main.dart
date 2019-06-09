import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flare_splash_screen/flare_splash_screen.dart';
import './currency_model.dart';
import './model_class.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(title: "Currency Rates Today");
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Currecy in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen.navigate(
        name: 'assets/homesplash.flr',
        next: HomePage(title: 'Currency Viewer'),
        until: () => Future.delayed(Duration(microseconds: 70)),
        startAnimation: 'Aura',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int ratescount = 0;
  CurrencyModel currencyobj;
  ModelClass modelClassUsd, modelClassEuro;
  var ratesfinal;
  Rates rates;
  String base = "USD";
  var jsonDataUsd,jsonDataEuro, databodyUsd, databodyEuro;
  bool loader = false;
  final List<Tab> myTabs = <Tab>[
    Tab(text: '1 USD'),
    Tab(text: '1 EURO'),
  ];

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: myTabs.length);
    fetchData();
  }

  String createUrl({String currency: "USD"}) {
    return "https://api.exchangeratesapi.io/latest?base=$currency";
  }


  Future<void> fetchData() async {
    print('second function');
    loader = true;
    String url = createUrl(currency: "USD");
    jsonDataUsd = await http.get(url);
    //print(jsonData.body);
    modelClassUsd = welcomeFromJson(jsonDataUsd.body);
    url = createUrl(currency: "EUR");
    jsonDataEuro = await http.get(url);
    //print(jsonData.body);
    modelClassEuro = welcomeFromJson(jsonDataEuro.body);
    /*modelClass.rates.forEach((k, v) {
      print('${k}: ${v}');
      ratescount++;
    });*/
    loader = false;
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: myTabs,
          ),
        ),
        body: Center(
          child: ((modelClassUsd == null) || (modelClassEuro == null) )
              ? CircularProgressIndicator()
              : TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    USDRates(modelClassUsd.rates),
                    EURORates(modelClassEuro.rates)
                  ],
                ),
        ),
      ),
    );
  }
}

class USDRates extends StatefulWidget {
  final Map<String, double> rates;
  var counter;

  USDRates(this.rates);
  @override
  _USDRatesState createState() => _USDRatesState();
}

class _USDRatesState extends State<USDRates> {
  int selected = 0;
  _buildRateList() {
    List<Widget> choices = List();
    
    widget.rates.forEach((k, v) {
      choices.add(
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget>[ 
                Container(
                  //color: Colors.black26,
                  child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  leading: Text(k.toString()), 
                  title: Align(child: Text(v.toString()),alignment:Alignment(.5, 0)),                ),
                ),
              ]
            ),
          )
            );
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        
      },
      child: new ListView(
        children: _buildRateList()
        ),
    );
  }
}


class EURORates extends StatefulWidget {
  final Map<String, double> rates;
  var counter;

  EURORates(this.rates);
  @override
  _EURORatesState createState() => _EURORatesState();
}

class _EURORatesState extends State<EURORates> {
  int selected = 0;
  _buildRateList() {
    List<Widget> choices = List();
    
    widget.rates.forEach((k, v) {
      choices.add(
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget>[ 
                Container(
                  color: Colors.black12,
                  child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  leading: Text(k.toString()), 
                  title: Align(child: Text(v.toString()),alignment:Alignment(.5, 0)),                ),
                ),
              ]
            ),
          )
            );
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _buildRateList()
      );
  }
}