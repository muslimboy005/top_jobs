class PersonalModel {
  final DateTime birthday;
  final String email;
  final String firstName;
  final String image;
  final String phoneNum;
  final String secondName;
  final String gender;

  PersonalModel({
    required this.birthday,
    required this.email,
    required this.firstName,
    required this.image,
    required this.phoneNum,
    required this.secondName,
    required this.gender,
  });

  PersonalModel copyWith({
    String? gender,
    DateTime? birthday,
    String? email,
    String? firstName,
    String? image,
    String? phoneNum,
    String? secondName,
  }) => PersonalModel(
    birthday: birthday ?? this.birthday,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    image: image ?? this.image,
    phoneNum: phoneNum ?? this.phoneNum,
    secondName: secondName ?? this.secondName,
    gender: gender ?? this.gender,
  );

  factory PersonalModel.fromJson(
    Map<String, dynamic> json,
  ) => PersonalModel(
    birthday: DateTime.parse(json["birthday"]),
    email: json["email"],
    firstName: json["firstName"],
    image: json["image"],
    phoneNum: json["phoneNum"],
    secondName: json["secondName"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "birthday":
        "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "email": email,
    "firstName": firstName,
    "image": image,
    "phoneNum": phoneNum,
    "secondName": secondName,
    "gender": gender,
  };
}
