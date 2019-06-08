import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flare_splash_screen/flare_splash_screen.dart';
import './currency_model.dart';

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
  CurrencyModel currencyobj;
  var ratesfinal;
  Rates rates;
  String base = "USD";
  var jsonData, databody;
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
    loader = true;
    String url = createUrl(currency: "EUR");
    jsonData = await http.get(url);
    databody = jsonDecode(jsonData.body);
    currencyobj = CurrencyModel.fromJson(databody);
    rates = currencyobj.rates;
    //Map userMap = rates;
    //ratesfinal = new Rates.fromJson(userMap);
    print(ratesfinal);
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
          child: (currencyobj == null)
              ? CircularProgressIndicator()
              : TabBarView(
                  controller: tabController,
                  children: <Widget>[USDRates(rates), EuroRates(rates)],
                ),
        ),
      ),
    );
  }
}

class USDRates extends StatefulWidget {
  final Rates rates;

  USDRates(this.rates);
  @override
  _USDRatesState createState() => _USDRatesState();
}

class _USDRatesState extends State<USDRates> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "NOK -" + widget.rates.nOK.toString(),
              style: TextStyle(fontSize: 30, backgroundColor: Colors.amber),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
      ],
    );
  }
}

class EuroRates extends StatefulWidget {
  final Rates rates;

  EuroRates(this.rates);

  @override
  _EuroRatesState createState() => _EuroRatesState();
}

class _EuroRatesState extends State<EuroRates> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "NOK -" + widget.rates.nOK.toString(),
              style: TextStyle(fontSize: 30, backgroundColor: Colors.amber),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("NOK -" + widget.rates.nOK.toString(),
                  style:
                      TextStyle(fontSize: 30, backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text("AUD -" + widget.rates.aUD.toString(),
                  style: TextStyle(
                      fontSize: 30, backgroundColor: Colors.black26))),
        ),
      ],
    );
  }
}
