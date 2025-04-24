
class LanguageModel {
    final String lanGrade;
    final String lanName;
    final String id;

    LanguageModel({
      required this.id,
        required this.lanGrade,
        required this.lanName,
    });

    LanguageModel copyWith({
        String? lanGrade,
        String? lanName,
    }) => 
        LanguageModel(
          id: id,
            lanGrade: lanGrade ?? this.lanGrade,
            lanName: lanName ?? this.lanName,
        );

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
      id: json["id"],
        lanGrade: json["lanGrade"],
        lanName: json["lanName"],
    );

    Map<String, dynamic> toJson() => {
        "lanGrade": lanGrade,
        "lanName": lanName,
    };
}
