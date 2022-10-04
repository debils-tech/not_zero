abstract class StatsRepository {
  Stream<int> getTotalPoints();

  Future<void> countTotalPoints();
}
