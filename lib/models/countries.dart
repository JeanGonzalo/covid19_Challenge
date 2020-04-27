class Countries {
  String country;
  String countryCode;
  int totalConfirmed;

  Countries(this.country, this.countryCode, this.totalConfirmed);

  Countries.fromJson(Map<String, dynamic> json)
      : country = json['Country'],
        countryCode = json['CountryCode'],
        totalConfirmed = json['TotalConfirmed'];
}
