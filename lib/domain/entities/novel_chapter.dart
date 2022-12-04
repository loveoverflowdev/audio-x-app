// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NovelChapter {
  final String name;
  final String source;

  NovelChapter({
    required this.name,
    required this.source,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'source': source,
    };
  }

  factory NovelChapter.fromMap(Map<String, dynamic> map) {
    return NovelChapter(
      name: map['name'] ?? '',
      source: map['source'] ?? '',
    );
  }
}
