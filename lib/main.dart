import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:zipypay/Model/currency_model.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
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
          title: Text("Currency Rates Today"),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: myTabs,
          ),
        ),
        body: (currencyobj == null)
            ? CircularProgressIndicator()
            : TabBarView(
                controller: tabController,
                children: <Widget>[
                  USDRates(rates),
                  EuroRates(rates)
                ],
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
            child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber) ,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
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
            child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber) ,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("NOK -" + widget.rates.nOK.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.amber))),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text("AUD -" + widget.rates.aUD.toString(), style: TextStyle(fontSize: 30,backgroundColor: Colors.black26))),
        ),
      ],
    );
  }
}
