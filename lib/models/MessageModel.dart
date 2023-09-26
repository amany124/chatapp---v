import 'package:chatapp/widgets/constant.dart';

class MessageModel {
  final String message_content;
  final String id;

  MessageModel(this.message_content, this.id);

  factory MessageModel.fromjson(jsondata) {
    return MessageModel(jsondata[kmessage_content], jsondata['id']);
  }
}
