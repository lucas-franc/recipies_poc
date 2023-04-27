class Step {
  String? stepName;
  String? timeInMinutes;

  Step({this.stepName, this.timeInMinutes});
  factory Step.fromJson(Map<String, dynamic> parsedJson) {
    return Step(
      stepName: parsedJson['stepName'],
      timeInMinutes: parsedJson['timeInMinutes'],
    );
  }
}
