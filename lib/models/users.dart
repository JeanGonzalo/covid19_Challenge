class User {
  String name, subtitle, img;
  int age;
  User(this.name, this.subtitle, this.img, this.age);
  User.fromJson(Map<String, dynamic> json)
      : name = json['name']['first'] + ' ' + json['name']['last'],
        subtitle = json['login']['username'],
        img = json['picture']['medium'],
        age = json['registered']['age'];
}
