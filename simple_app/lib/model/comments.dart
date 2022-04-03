import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Comments extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int? postId;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? body;

  const Comments({
    this.postId,
    required this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);

  static const fromJsonFactory = _$CommentsFromJson;

  @override
  List<Object?> get props => [id, postId, name, email, body];
}
