class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Work working;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.username,
    this.phone,
    this.website,
    this.working,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        website: json["website"],
        working: Work.fromJson(json["company"]),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "phone": phone,
        "website": website,
        "company": working.toJson(),
        "address": address.toJson(),
      };
}

class Work {
  String name;
  String catchPhrase;
  String bs;

  Work({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
      };
}
