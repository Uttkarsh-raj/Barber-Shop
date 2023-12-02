class Featured {
  final String name;
  final String imageUrl;
  final String oPrice;
  final String nPrice;
  Featured({
    required this.name,
    required this.imageUrl,
    required this.oPrice,
    required this.nPrice,
  });

  Featured copyWith({
    String? name,
    String? imageUrl,
    String? oPrice,
    String? nPrice,
  }) {
    return Featured(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      oPrice: oPrice ?? this.oPrice,
      nPrice: nPrice ?? this.nPrice,
    );
  }

  @override
  String toString() {
    return 'Featured(name: $name, imageUrl: $imageUrl, oPrice: $oPrice, nPrice: $nPrice)';
  }

  @override
  bool operator ==(covariant Featured other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageUrl == imageUrl &&
        other.oPrice == oPrice &&
        other.nPrice == nPrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        oPrice.hashCode ^
        nPrice.hashCode;
  }
}
