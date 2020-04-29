import 'package:testquest/soc/data/db/posts_database.dart';
import 'package:testquest/soc/domain/entities/post_entity.dart';

class Extentions {

}
extension ToEntity on Post {

  PostEntity toEntity() {
    return PostEntity(id: this.id, title: this.title, body: this.body);
  }
}
