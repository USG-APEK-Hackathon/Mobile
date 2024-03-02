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
      steps: json['steps'][0]['value'],
      calorie: json['calories_extended'][0]['value'],
      heartMinute: json['heart_minutes'][0]['value'],
      weight: json['weight'][0]['value'],
    );
  }
}
