import 'package:covid19_flutter/models/chooseCountryModel.dart';
import 'package:http/http.dart' as http;

class CountryCasesAPI {
  Future<List<CountryCases>> getCountryCases(String slug) async {
    switch (slug) {
      case "peru":
        if (peruList != null) {
          await Future.delayed(Duration(milliseconds: 500));
          return peruList;
        }
        break;

      default:
    }

    final resp = await http.get(
        "https://api.covid19api.com/dayone/country/$slug/status/confirmed");
    return countryCasesFromJson(resp.body, slug);
  }
}
