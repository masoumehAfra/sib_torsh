import '../../domain/entity/user_entity.dart';

class ContentModel extends UserEntity {
  const ContentModel({required int userId, required String firstName,required String lastName})
      : super(userId: userId, firstName: firstName,lastName: lastName);

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(userId: json["id"], firstName: json["first_name"] ,lastName:  json["last_name"]);
  }
}
