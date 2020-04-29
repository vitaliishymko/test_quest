import 'package:chopper/chopper.dart';
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {

  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}/comments')
  Future<Response> getCommentsForPost(@Path('id') int id);

  static PostApiService create() {
    final client = ChopperClient(baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor()
      ]
    );

    return _$PostApiService(client);
  }
}