
import 'package:testquest/core/UseCase.dart';
import 'package:testquest/soc/domain/entities/post_entity.dart';
import 'package:testquest/soc/domain/repositories/posts_repository.dart';

class PostsUseCase extends WatchListUseCase {

  final PostsRepository postsRepository;

  PostsUseCase(this.postsRepository);

  @override
  Stream<List<PostEntity>> watchList() {
    return postsRepository.watchPosts();
  }
}