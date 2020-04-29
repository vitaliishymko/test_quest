

abstract class UseCase {

}

abstract class WatchListUseCase<T> implements UseCase {

  Stream<List<T>>watchList();
}