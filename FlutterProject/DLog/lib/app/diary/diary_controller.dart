import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:locationdiary/data/models/response/common_res.dart';

import 'package:locationdiary/data/models/response/diary_model_res.dart';
import 'package:locationdiary/data/models/response/get_diaries_res.dart';
import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/data/repositories/diary_repository_impl.dart';
import 'package:locationdiary/domain/usecases/delete_diary_usecase.dart';
import 'package:locationdiary/domain/usecases/get_diaries_usecase.dart';
import 'package:locationdiary/domain/usecases/get_image_usecase.dart';
import 'package:locationdiary/domain/usecases/get_volumes_usecase.dart';
import 'package:locationdiary/utils/logger.dart';

class DiaryController extends GetxController {
  bool _hasOpened = false;

  bool get hasOpened => _hasOpened;

  void setHasOpened(bool hasOpened) {
    _hasOpened = hasOpened;
  }

  var isLoading = false.obs;

  var diaries = <DiaryModelRes>[].obs;

  int get total => diaries.length;

  final _selectedDate = DateTime.now().obs;

  DateTime get selectedDate => _selectedDate.value;

  void setSelectedDate(DateTime selectedDate) {
    _selectedDate.value = selectedDate;
  }

  ScrollPhysics _scrollPhysics = const ClampingScrollPhysics();

  ScrollPhysics get scrollPhysics => _scrollPhysics;

  OverlayEntry? _overlayEntry;

  OverlayEntry? get overlayEntry => _overlayEntry;

  void setOverlayEntry(OverlayEntry? overlayEntry) {
    _overlayEntry = overlayEntry;
  }

  void deleteOverlayEntry() {
    _overlayEntry!.remove();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDiaries();
  }

  void fetchDiaries({DateTime? writeDate}) async {
    isLoading.value = true;

    String writeDateString =
        DateFormat('yyyyMMdd').format(writeDate ?? _selectedDate.value);
    var diariesRes = await _getDiaries(writeDate: writeDateString);
    var diaryList = diariesRes.data!.list;
    logger.i('다이어리: $diaryList');

    isLoading.value = false;

    if (diaryList != null) {
      var sortedList = diaryList.toList();
      sortedList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      diaries.value = sortedList;
    }
    update();
  }

  Future<GetDiariesRes> _getDiaries({required String writeDate}) async {
    final volumes = await _getVolumes();
    final diaryVolumeSeq = volumes.data!.list![0].diaryVolumeSeq;

    GetDiariesUseCase getDiariesUseCase =
        GetDiariesUseCase(DiaryRepositoryImpl());

    return await getDiariesUseCase(
      diaryVolumeSeq: diaryVolumeSeq!,
      writeDate: writeDate,
    );
  }

  Future<void> deleteDiary({required int diarySeq}) async {
    await _deleteDiary(diarySeq: diarySeq);
    fetchDiaries();
  }

  Future<CommonRes> _deleteDiary({required int diarySeq}) async {
    final volumes = await _getVolumes();
    final diaryVolumeSeq = volumes.data!.list![0].diaryVolumeSeq;

    DeleteDiaryUseCase deleteDiaryUseCase =
        DeleteDiaryUseCase(DiaryRepositoryImpl());

    return await deleteDiaryUseCase(
      diarySeq: diarySeq,
      diaryVolumeSeq: diaryVolumeSeq!,
    );
  }

  Future<GetVolumesRes> _getVolumes() async {
    GetVolumesUseCase getVolumesUseCase =
        GetVolumesUseCase(DiaryRepositoryImpl());

    return await getVolumesUseCase();
  }

  Future<File> getImage(String fileName) async {
    GetImageUseCase getImageUseCase = GetImageUseCase(DiaryRepositoryImpl());

    return await getImageUseCase(fileName: fileName);
  }

  void blockScroll(bool isBlock) {
    _scrollPhysics = isBlock
        ? const NeverScrollableScrollPhysics()
        : const ClampingScrollPhysics();
    update();
  }
}
