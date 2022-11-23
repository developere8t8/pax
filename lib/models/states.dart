class StateNames {
  String? state_name;

  StateNames({required this.state_name});

  factory StateNames.fromjson(Map<String, dynamic> json) {
    return StateNames(state_name: json['state_name']);
  }
}
