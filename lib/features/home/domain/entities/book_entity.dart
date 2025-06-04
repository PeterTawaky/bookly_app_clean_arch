class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? author;
  final num? price;
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.title,
     this.author,
    this.image,
    this.price,
    this.rating,
  });
}
