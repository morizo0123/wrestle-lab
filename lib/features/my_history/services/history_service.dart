import 'dart:io';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/models/organization.dart';

abstract class HistoryService {
  Future<List<History>> getHistories();
  Future<History> getHistoryById(int id);
  Future<void> addHistory(History history);
  Future<History> updateHistory(int id, History history);
  Future<void> deleteHistory(int id);
  Future<List<Organization>> getOrganizations();
  Future<String> uploadImage(File imageFile);
}