import 'package:equatable/equatable.dart';

import '../../core/utils/formatter.dart';

class Novel extends Equatable {
  final String id;
  final String name;
  final String author;
  final String introduction;
  final String imageUrl;
  final String? dateTime;

  const Novel({
    required this.id,
    required this.name,
    required this.author,
    required this.introduction,
    required this.imageUrl,
    this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'introduction': introduction,
      'imageUrl': imageUrl,
      'dateTime': dateTime,
    };
  }

  factory Novel.fromMap(Map<String, dynamic> map) {
    return Novel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      author: map['author'] ?? '',
      introduction: map['introduction'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      dateTime: Formatter().dateTimeToDdMmYyyy_HhMmSs(DateTime.now()),
    );
  }

  @override
  List<Object?> get props => [id, name, author, introduction, imageUrl];
}
