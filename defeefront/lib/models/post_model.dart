class PostModel {
  final String title;
  final String imageUrl;
  final String category;
  final String author;
  final String date;
  final String content;

  PostModel({
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.author,
    required this.date,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'imageUrl': imageUrl,
        'category': category,
        'author': author,
        'date': date,
        'content': content,
      };
}
