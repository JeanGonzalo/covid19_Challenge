import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19_flutter/models/chooseCountryModel.dart';

import 'package:covid19_flutter/requestAPI/chooseCountry_api.dart';
import 'package:covid19_flutter/utils/pointsLine_charts.dart';

class ContainerChart extends StatelessWidget {
  double width;
  String countryCode;
  double fontSizeCardNumber;
  List<CountryCases> listCountryCases;

  String slug;

  ContainerChart({
    Key key,
    this.width,
    this.countryCode,
    this.fontSizeCardNumber,
    this.listCountryCases,
    this.slug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Last 10 dyas - $countryCode \n",
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: fontSizeCardNumber - 2,
              fontFamily: "Nunito"),
        ),
        Container(
            height: 300,
            width: width,
            child: FutureBuilder(
              future: CountryCasesAPI().getCountryCases(slug),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  listCountryCases = snapshot.data;
                  return PointsLineChart(createChartData(listCountryCases));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ))
      ]),
    );
  }

  static List<charts.Series<CountryCases, int>> createChartData(
      List<CountryCases> list) {
    var sublist = list.sublist(list.length - 12, list.length - 1);

    return [
      new charts.Series<CountryCases, int>(
        id: 'Country Cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (countryCases, index) => index,
        data: sublist,
        measureFn: (countryCases, int index) => countryCases.cases,
      )
    ];
  }
}
