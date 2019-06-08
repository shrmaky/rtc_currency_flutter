class CurrencyModel {
  String base;
  Rates rates;
  String date;

  CurrencyModel({this.base, this.rates, this.date});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class Rates {
  double bGN;
  double nZD;
  double iLS;
  double rUB;
  double cAD;
  double uSD;
  double pHP;
  double cHF;
  double aUD;
  double jPY;
  double tRY;
  double hKD;
  double mYR;
  double hRK;
  double cZK;
  double iDR;
  double dKK;
  double nOK;
  double hUF;
  double gBP;
  double mXN;
  double tHB;
  double iSK;
  double zAR;
  double bRL;
  double sGD;
  double pLN;
  double iNR;
  double kRW;
  double rON;
  double cNY;
  double sEK;
  double eUR;

  Rates(
      {this.bGN,
      this.nZD,
      this.iLS,
      this.rUB,
      this.cAD,
      this.uSD,
      this.pHP,
      this.cHF,
      this.aUD,
      this.jPY,
      this.tRY,
      this.hKD,
      this.mYR,
      this.hRK,
      this.cZK,
      this.iDR,
      this.dKK,
      this.nOK,
      this.hUF,
      this.gBP,
      this.mXN,
      this.tHB,
      this.iSK,
      this.zAR,
      this.bRL,
      this.sGD,
      this.pLN,
      this.iNR,
      this.kRW,
      this.rON,
      this.cNY,
      this.sEK,
      this.eUR});

  Rates.fromJson(Map<String, dynamic> json) {
    bGN = json['BGN'];
    nZD = json['NZD'];
    iLS = json['ILS'];
    rUB = json['RUB'];
    cAD = json['CAD'];
    uSD = json['USD'];
    pHP = json['PHP'];
    cHF = json['CHF'];
    aUD = json['AUD'];
    jPY = json['JPY'];
    tRY = json['TRY'];
    hKD = json['HKD'];
    mYR = json['MYR'];
    hRK = json['HRK'];
    cZK = json['CZK'];
    iDR = json['IDR'];
    dKK = json['DKK'];
    nOK = json['NOK'];
    hUF = json['HUF'];
    gBP = json['GBP'];
    mXN = json['MXN'];
    tHB = json['THB'];
    iSK = json['ISK'];
    zAR = json['ZAR'];
    bRL = json['BRL'];
    sGD = json['SGD'];
    pLN = json['PLN'];
    iNR = json['INR'];
    kRW = json['KRW'];
    rON = json['RON'];
    cNY = json['CNY'];
    sEK = json['SEK'];
    eUR = json['EUR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BGN'] = this.bGN;
    data['NZD'] = this.nZD;
    data['ILS'] = this.iLS;
    data['RUB'] = this.rUB;
    data['CAD'] = this.cAD;
    data['USD'] = this.uSD;
    data['PHP'] = this.pHP;
    data['CHF'] = this.cHF;
    data['AUD'] = this.aUD;
    data['JPY'] = this.jPY;
    data['TRY'] = this.tRY;
    data['HKD'] = this.hKD;
    data['MYR'] = this.mYR;
    data['HRK'] = this.hRK;
    data['CZK'] = this.cZK;
    data['IDR'] = this.iDR;
    data['DKK'] = this.dKK;
    data['NOK'] = this.nOK;
    data['HUF'] = this.hUF;
    data['GBP'] = this.gBP;
    data['MXN'] = this.mXN;
    data['THB'] = this.tHB;
    data['ISK'] = this.iSK;
    data['ZAR'] = this.zAR;
    data['BRL'] = this.bRL;
    data['SGD'] = this.sGD;
    data['PLN'] = this.pLN;
    data['INR'] = this.iNR;
    data['KRW'] = this.kRW;
    data['RON'] = this.rON;
    data['CNY'] = this.cNY;
    data['SEK'] = this.sEK;
    data['EUR'] = this.eUR;
    return data;
  }
}