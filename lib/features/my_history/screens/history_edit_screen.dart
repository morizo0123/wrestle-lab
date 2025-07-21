import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/features/my_history/viewmodels/history_viewmodel.dart';

class HistoryEditScreen extends ConsumerStatefulWidget {
  final History history;

  const HistoryEditScreen({super.key, required this.history});

  @override
  ConsumerState createState() => _HistoryEditScreenState();
}

class _HistoryEditScreenState extends ConsumerState<HistoryEditScreen> {
  DateTime? selectedDate;
  String? selectedOrganization;
  File? selectedImage;

  late TextEditingController _eventNameController;
  late TextEditingController _venueController;
  late TextEditingController _reviewController;

  @override
  void initState() {
    super.initState();

    // 編集画面の初期化
    selectedDate = widget.history.eventDate;
    selectedOrganization = widget.history.organization;
    _eventNameController = TextEditingController(
      text: widget.history.eventName,
    );
    _venueController = TextEditingController(text: widget.history.venue);
    _reviewController = TextEditingController(
      text: widget.history.review ?? '',
    );
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _venueController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(historyViewModelProvider);
    final viewModel = ref.read(historyViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '観戦詳細編集',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: _buildBody(viewState),
    );
  }

  Widget _buildBody(HistoryViewState viewState) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateField(),
            const SizedBox(height: 24),
            _buildOrganizationField(viewState),
            const SizedBox(height: 24),
            _buildEventNameField(),
            const SizedBox(height: 24),
            _buildVenueField(),
            const SizedBox(height: 24),
            _buildReviewField(),
            const SizedBox(height: 24),
            _buildPhotoField(),
            const SizedBox(height: 24),
            _buildSaveButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '観戦日',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? '${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}'
                      : '観戦日を選択',
                ),
                Icon(Icons.calendar_today, color: Colors.grey[600], size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _buildOrganizationField(HistoryViewState viewState) {
    if (viewState.isLoadingOrganizations) {
      return Center(child: const CircularProgressIndicator());
    }

    if (viewState.organizationError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'エラーが発生しました',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(viewState.organizationError!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(historyViewModelProvider.notifier).loadOrganizations();
              },
              child: const Text(
                '再試行',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    if (viewState.organizations.isEmpty) {
      return Center(
        child: Column(
          children: [
            const Text('団体一覧がありません'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(historyViewModelProvider.notifier).loadOrganizations();
              },
              child: const Text(
                '再試行',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }

    final orgNames = viewState.organizations.map((org) => org.name).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '団体名',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _selectOrganization(context, orgNames),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedOrganization ?? '団体名を入力',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          selectedOrganization != null
                              ? Colors.black87
                              : Colors.grey[600],
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.grey[600], size: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectOrganization(
    BuildContext context,
    List<String> orgNames,
  ) async {
    final String? selected = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ハンドル
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '団体を選択',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  itemCount: orgNames.length,
                  separatorBuilder:
                      (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final organization = orgNames[index];
                    return ListTile(
                      title: Text(
                        organization,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(organization);
                      },
                      trailing:
                          selectedOrganization == organization
                              ? const Icon(Icons.check, color: Colors.blue)
                              : null,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedOrganization = selected;
      });
    }
  }

  Widget _buildEventNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '興行名',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _eventNameController,
          decoration: InputDecoration(
            hintText: '興行名を入力',
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVenueField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '会場',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _venueController,
          decoration: InputDecoration(
            hintText: '会場を入力',
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '感想',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _reviewController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: '感想を入力',
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _editHistory,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        child: const Text(
          '保存する',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _editHistory() {
    if (selectedDate == null) {
      _showErrorSnackBar('観戦日を選択してください');
      return;
    }

    if (selectedOrganization == null) {
      _showErrorSnackBar('団体名を選択してください');
      return;
    }

    if (_eventNameController.text.trim().isEmpty) {
      _showErrorSnackBar('興行名を入力してください');
      return;
    }

    if (_venueController.text.trim().isEmpty) {
      _showErrorSnackBar('会場を入力してください');
      return;
    }

    // バリデーション通過後の保存処理
    _performEdit();
  }

  void _performEdit() async {
    try {
      String? photoUrl = widget.history.photoUrl;

      // 新しい画像が選択された場合はアップロード
      if (selectedImage != null) {
        photoUrl = await ref
            .read(historyViewModelProvider.notifier)
            .uploadImage(selectedImage!);
      }

      final updatedHistory = History(
        id: widget.history.id,
        eventDate: selectedDate!,
        eventName: _eventNameController.text,
        organization: selectedOrganization!,
        venue: _venueController.text,
        review: _reviewController.text.isEmpty ? null : _reviewController.text,
        photoUrl: photoUrl,
      );

      await ref
          .read(historyViewModelProvider.notifier)
          .updateHistory(widget.history.id!, updatedHistory);

      // 保存成功用SnackBar
      _showSuccessSnackBar('観戦記録を保存しました');
      context.pop(updatedHistory);
    } catch (e) {
      print(e);
      _showErrorSnackBar('保存に失敗しました: ${e.toString()}');
    }
  }

  // エラー用SnackBar
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // 成功用SnackBar
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[600],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // 写真選択メソッド
  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    } catch (e) {
      _showErrorSnackBar('画像の選択に失敗しました: ${e.toString()}');
    }
  }

  // 写真削除メソッド
  void _removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  // 写真選択フィールド
  Widget _buildPhotoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '写真',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),

        // 写真が選択されている場合
        if (selectedImage != null)
          _buildSelectedPhoto()
        // 写真が選択されていない場合
        else
          _buildPhotoSelector(),
      ],
    );
  }

  // 選択された写真の表示
  Widget _buildSelectedPhoto() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              selectedImage!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _removeImage,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 写真選択ボタン
  Widget _buildPhotoSelector() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey[300]!,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              size: 48,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              '写真を選択',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
