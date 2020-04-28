import 'dart:convert';

List<CountryCases> peruList;

Future<List<CountryCases>> countryCasesFromJson(String str, String slug) async {
  switch (slug) {
    case "peru":
      if (peruList != null) {
        return peruList;
      }
      peruList = List<CountryCases>.from(
          json.decode(str).map((x) => CountryCases.fromJson(x)));
      return peruList;
      break;
    default:
      break;
  }
  return List<CountryCases>.from(
      json.decode(str).map((x) => CountryCases.fromJson(x)));
}

String countryCasesToJson(List<CountryCases> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryCases {
  String country;
  String countryCode;
  String province;
  String city;
  String cityCode;
  String lat;
  String lon;
  int cases;
  String status;
  DateTime date;

  CountryCases({
    this.country,
    this.countryCode,
    this.province,
    this.city,
    this.cityCode,
    this.lat,
    this.lon,
    this.cases,
    this.status,
    this.date,
  });

  factory CountryCases.fromJson(Map<String, dynamic> json) => CountryCases(
        country: json["Country"],
        countryCode: json["CountryCode"],
        province: json["Province"],
        city: json["City"],
        cityCode: json["CityCode"],
        lat: json["Lat"],
        lon: json["Lon"],
        cases: json["Cases"],
        status: json["Status"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "CountryCode": countryCode,
        "Province": province,
        "City": city,
        "CityCode": cityCode,
        "Lat": lat,
        "Lon": lon,
        "Cases": cases,
        "Status": status,
        "Date": date.toIso8601String(),
      };
}
