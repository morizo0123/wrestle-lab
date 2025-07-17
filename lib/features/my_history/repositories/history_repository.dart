import 'package:wrestle_lab/features/my_history/models/history.dart';

abstract class HistoryRepository {
  Future<List<History>> getHistories();
  Future<History> getHistory(int id);
  Future<History> createHistory(History history);
  Future<History> updateHistory(int id, History history);
  Future<void> deleteHistory(int id);
}