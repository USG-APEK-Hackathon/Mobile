// ignore_for_file: public_member_api_docs, sort_constructors_first
class Fit {
  final int? steps;
  final int? calorie;
  final int? heartMinute;
  final int? weight;

  Fit({
    this.steps,
    this.calorie,
    this.heartMinute,
    this.weight,
  });

  factory Fit.fromJson(Map<String, dynamic> json) {
    return Fit(
      steps: json['steps_count'][0]['value'],
      calorie: json['calories_expended'][0]['value'],
      heartMinute: json['heart_minutes'][0]['value'],
      weight: json['weight'][0]['value'],
    );
  }
}
