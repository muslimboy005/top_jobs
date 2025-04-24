
class ExperienceModel {
    final String companyName;
    final String period;
    final String position;
    final String responsibility;
    final String id;

    ExperienceModel({
      required this.id,
        required this.companyName,
        required this.period,
        required this.position,
        required this.responsibility,
    });

    ExperienceModel copyWith({
        String? companyName,
        String? period,
        String? position,
        String? responsibility,
    }) => 
        ExperienceModel(
          id: id,
            companyName: companyName ?? this.companyName,
            period: period ?? this.period,
            position: position ?? this.position,
            responsibility: responsibility ?? this.responsibility,
        );

    factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
      id: json["id"],
        companyName: json["companyName"],
        period: json["period"],
        position: json["position"],
        responsibility: json["responsibility"],
    );

    Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "period": period,
        "position": position,
        "responsibility": responsibility,
    };
}
