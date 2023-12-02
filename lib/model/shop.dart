class Shop {
  final String name;
  final String email;
  final String location;
  final String distance;
  final String stars;
  final String reviews;
  final String imageUrl;
  Shop({
    required this.name,
    required this.email,
    required this.location,
    required this.distance,
    required this.stars,
    required this.reviews,
    required this.imageUrl,
  });

  Shop copyWith({
    String? name,
    String? email,
    String? location,
    String? distance,
    String? stars,
    String? reviews,
    String? imageUrl,
  }) {
    return Shop(
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      distance: distance ?? this.distance,
      stars: stars ?? this.stars,
      reviews: reviews ?? this.reviews,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Shop(name: $name, email: $email, location: $location, distance: $distance, stars: $stars, reviews: $reviews, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.location == location &&
        other.distance == distance &&
        other.stars == stars &&
        other.reviews == reviews &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        location.hashCode ^
        distance.hashCode ^
        stars.hashCode ^
        reviews.hashCode ^
        imageUrl.hashCode;
  }
}
