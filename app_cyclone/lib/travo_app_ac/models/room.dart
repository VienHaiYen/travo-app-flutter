class Room {
  Room(
      {this.image,
      this.name,
      this.services,
      this.maxGuest,
      this.price,
      this.total});

  final String? image;
  final String? name;
  final List<String>? services;
  final int? maxGuest;
  final int? price;
  final int? total;
}
