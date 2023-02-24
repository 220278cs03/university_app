// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

List<University> universityFromJson(String str) => List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

String universityToJson(List<University> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class University {
  University({
    required this.domains,
    required this.name,
    required this.webPages,
    required this.country,
    this.stateProvince,
    required this.alphaTwoCode,
  });

  List<String> domains;
  String name;
  List<String> webPages;
  Country country;
  dynamic stateProvince;
  AlphaTwoCode alphaTwoCode;

  University copyWith({
    List<String>? domains,
    String? name,
    List<String>? webPages,
    Country? country,
    dynamic stateProvince,
    AlphaTwoCode? alphaTwoCode,
  }) =>
      University(
        domains: domains ?? this.domains,
        name: name ?? this.name,
        webPages: webPages ?? this.webPages,
        country: country ?? this.country,
        stateProvince: stateProvince ?? this.stateProvince,
        alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      );

  factory University.fromJson(Map<String, dynamic> json) => University(
    domains: List<String>.from(json["domains"].map((x) => x)),
    name: json["name"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    country: countryValues.map[json["country"]]!,
    stateProvince: json["state-province"],
    alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
  );

  Map<String, dynamic> toJson() => {
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "name": name,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "country": countryValues.reverse[country],
    "state-province": stateProvince,
    "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
  };
}

enum AlphaTwoCode { UZ }

final alphaTwoCodeValues = EnumValues({
  "UZ": AlphaTwoCode.UZ
});

enum Country { UZBEKISTAN }

final countryValues = EnumValues({
  "Uzbekistan": Country.UZBEKISTAN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
