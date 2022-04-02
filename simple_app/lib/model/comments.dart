import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Comments {
  @HiveField(0)
  int id;
  @HiveField(1)
  int? postId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? body;

  Comments({this.postId, required this.id, this.name, this.email, this.body});

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);

  static const fromJsonFactory = _$CommentsFromJson;
}
