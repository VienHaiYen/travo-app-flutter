class Guest {
  Guest({required this.email, required this.name, required this.phone});

  final String email;
  final String name;
  final String phone;

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $phone \n$email';
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
    };
  }
}
