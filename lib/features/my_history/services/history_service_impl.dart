import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/repositories/history_repository.dart';
import 'package:wrestle_lab/features/my_history/services/history_service.dart';

class HistoryServiceImpl implements HistoryService {
  final HistoryRepository _repository;

  HistoryServiceImpl(this._repository);

  @override
  Future<List<History>> getHistories() async {
    return _repository.getHistories();
  }

  @override
  Future<History> getHistoryById(int id) async {
    return _repository.getHistoryById(id);
  }

  @override
  Future<void> addHistory(History history) async {
    return _repository.addHistory(history);
  }

  @override
  Future<History> updateHistory(int id, History history) async {
    return _repository.updateHistory(id, history);
  }

  @override
  Future<void> deleteHistory(int id) async {
    return _repository.deleteHistory(id);
  }
}