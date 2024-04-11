class Seat {
  final String type;
  final String name;

  Seat({required this.type, required this.name});

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      type: json['type'],
      name: json['name'],
    );
  }
}
