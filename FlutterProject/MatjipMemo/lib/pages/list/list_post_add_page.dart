import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/common_size.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/list_network_repository.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/service/internal_data_service.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:matjipmemo/view/widget/manage_matjip/thumb_image.dart';
import 'package:matjipmemo/view/widget/matjip_item/text_image.dart';
import 'package:sprintf/sprintf.dart';

class ListPostAddPage extends StatefulWidget {
  const ListPostAddPage({super.key, required this.listModel, required this.matjipList});

  final ListModel listModel;
  final List<String> matjipList;

  @override
  State<ListPostAddPage> createState() => _ListPostAddPageState();
}

class _ListPostAddPageState extends State<ListPostAddPage> {
  UserModel? userModel = Get.find<LoginController>().userModel;
  List<MatjipModel> matjipList = [];
  bool progressing = false;
  ScrollController scrollController = ScrollController();
  String queryText = "";
  int maxLength = 15;

  @override
  void initState() {
    super.initState();
    getMatjipList();
    for (MatjipModel matjipModel in matjipList) {
      if (widget.matjipList.contains(matjipModel.matjipId)) {
        matjipModel.selected = true;
      }
    }
  }

  @override
  void dispose() {
    ///이렇게 안하면 선택된 채로 그대로 있다..
    for (MatjipModel e in matjipList) {
      e.selected = false;
    }
    logger.d('dispose ListPostAddPage');
    super.dispose();
  }

  void getMatjipList() async {
    if (userModel == null) return;
    setMatjipList(Get.find<InternalDataService>().postList(inputPostMode: widget.listModel.postType));

    logger.d('맛집 리스트 가져오기 ->  ${matjipList.length}');
  }

  void setMatjipList(List<MatjipModel> newMatjipList) {
    matjipList.clear();
    matjipList.addAll(newMatjipList.where((element) => element.visited));
    matjipList.sort((a, b) => b.created.compareTo(a.created));
  }

  @override
  Widget build(BuildContext context) {
    ///Moim에서 추가하는 거랑 비슷한 레이아웃으로 만들면 될 듯
    return Scaffold(
      appBar: AppBar(
        title: Text('가 본 장소 추가'.tr),
        centerTitle: false,
        bottom: PreferredSize(
            child: Container(
              color: AppColors.mainColor,
              height: 2,
            ),
            preferredSize: const Size.fromHeight(1)),
        actions: [
          TextButton(
              onPressed: () async {
                if (progressing) {
                  return showToast('준비 중 입니다.'.tr);
                }
                setState(() {
                  progressing = true;
                });
                if (matjipList.isEmpty) {
                  return showToast('저장 된 맛집이 없습니다.'.tr);
                }
                Iterable<MatjipModel> selectMatjipList = matjipList.where((element) => element.selected);
                await listNetworkRepository.uploadMatjipsToList(
                    listModel: widget.listModel,
                    addMatjipList: selectMatjipList.where((element) => !widget.matjipList.contains(element.matjipId)).toList(),
                    deleteList: widget.matjipList.toSet().difference(selectMatjipList.map((e) => e.matjipId).toSet()).toList());
                Get.back(result: selectMatjipList.toList());
              },
              child: Text(
                '저장'.tr,
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ))
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        queryText = text;
                        setState(() {
                          setMatjipList(Get.find<InternalDataService>().postList(queryText: queryText, inputPostMode: widget.listModel.postType));
                        });
                      },

                      textInputAction: TextInputAction.search,
                      //textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                          left: commonMainGap,
                        ),
                        hintText: "저장 된 맛집 검색".tr,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: queryText.isEmpty ? Colors.grey : AppColors.mainColor,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          matjipList.length,
                          (index) => InkWell(
                                onTap: () {
                                  Iterable<MatjipModel> selectMatjipList = matjipList.where((element) => element.selected);
                                  if (selectMatjipList.length >= maxLength && matjipList[index].selected == false) {
                                    return showToast(sprintf('한 번에 최대 %d개까지 등록 가능합니다'.tr, [maxLength]));
                                  }
                                  logger.d('matjipList[index].selected will be change');
                                  setState(() {
                                    matjipList[index].selected = !matjipList[index].selected;
                                  });
                                },
                                child: AnimatedContainer(
                                  color: (matjipList[index].selected) ? Colors.grey : Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: commonSGap),
                                  height: 100,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                  child: Row(children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Stack(
                                        children: [
                                          matjipList[index].imageUrls.isEmpty
                                              ? CategoryImage(
                                                  matjipList[index],
                                                )
                                              : ThumbImage(
                                                  matjipList[index].thumbnailImageUrls.isNotEmpty
                                                      ? matjipList[index].thumbnailImageUrls[0]
                                                      : matjipList[index].imageUrls[0], //key: Key(matjipmodel.matjipid!),
                                                ),
                                          Visibility(
                                              visible: matjipList[index].selected,
                                              child: Container(
                                                color: Colors.black87.withOpacity(0.3),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.check,
                                                  color: AppColors.mainColor,
                                                  size: 50,
                                                )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            matjipList[index].matjipName ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            matjipList[index].geo.address ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: matjipList[index].visited
                                          ? Row(
                                              children: [
                                                const ImageIcon(
                                                  AssetImage("assets/icons/ic_star.png"),
                                                  color: AppColors.starYellow,
                                                  size: 16,
                                                ),
                                                Text(matjipList[index].starNum!.toString())
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ]),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
              visible: progressing,
              child: const Center(
                child: CircularProgressIndicator(),
              ))
        ],
      ),
    );
  }
}
