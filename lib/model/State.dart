class StateModel {
  final int id;
  final String name;
  StateModel(
      {required this.id,
      required this.name,
      });
  factory StateModel.fromjson(Map<String, dynamic> json) {
    return StateModel(
        id: json['id'],
        name: json['name'],
        );
  }
}