// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Novel {
  final String id;
  final String name;
  final String author;
  final String introduction;
  final String imageUrl;

  Novel({
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
}
