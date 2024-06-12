class Hall {
  final String id;
  final String hallName;
  final String stars;
  final String price;
  final String description;
  final String location;
  final String imageUrl; // Add imageUrl field

  Hall({
    required this.id,
    required this.hallName,
    required this.stars,
    required this.price,
    required this.description,
    required this.location,
    required this.imageUrl, // Include imageUrl in the constructor
  });

  factory Hall.fromFirestore(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw ArgumentError('Data is null for document ID: $documentId');
    }

    return Hall(
      id: documentId,
      hallName: data['hallName'] ?? 'No Name',
      stars: data['stars'] ?? '0',
      price: data['price'] ?? '0',
      description: data['description'] ?? 'No Description',
      location: data['location'] ?? 'No Location',
      imageUrl: data['imageUrl'] ?? '', // Fetch imageUrl from Firestore data
    );
  }
}