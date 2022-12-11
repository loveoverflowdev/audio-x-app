import 'package:equatable/equatable.dart';

class Novel extends Equatable {
  final String id;
  final String name;
  final String author;
  final String introduction;
  final String imageUrl;

  const Novel({
    required this.id,
    required this.name,
    required this.author,
    required this.introduction,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'introduction': introduction,
      'imageUrl': imageUrl,
    };
  }

  factory Novel.fromMap(Map<String, dynamic> map) {
    return Novel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      author: map['author'] ?? '',
      introduction: map['introduction'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, author, introduction, imageUrl];
}
