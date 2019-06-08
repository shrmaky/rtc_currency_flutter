import 'dart:convert';

ModelClass welcomeFromJson(String str) => ModelClass.fromJson(json.decode(str));

String welcomeToJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
    String base;
    Map<String, double> rates;
    DateTime date;

    ModelClass({
        this.base,
        this.rates,
        this.date,
    });

    factory ModelClass.fromJson(Map<String, dynamic> json) => new ModelClass(
        base: json["base"],
        rates: new Map.from(json["rates"]).map((k, v) => new MapEntry<String, double>(k, v.toDouble())),
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "rates": new Map.from(rates).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}