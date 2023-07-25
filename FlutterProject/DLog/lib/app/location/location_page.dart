import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/data/dto/model/four_square_venue_dto.dart';
import 'package:locationdiary/network/four_square_client.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/location_utils.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool isLoading = false;
  String loadingMessage = '';
  List<FourSquareVenueDto> locationList = [];

  @override
  void initState() {
    super.initState();
    getLocationList();
  }

  void getLocationList() async {
    setState(() {
      loadingMessage = '내 위치를 가져오는 중';
      isLoading = true;
    });
    //현재 위치 가져오기,
    Position currentLocation = await fetchPosition();
    setState(() {
      loadingMessage = '내 주변 장소를 가져오는 중';
    });
    logger.d(
        'my location is -> ${currentLocation.latitude}, ${currentLocation.longitude}');
    List result = (await FourSquareHttpClient.fourSquareAuthApi.getSearch(
            latitudeLongitudeToString(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude)))
        .response!['venues'];
    setState(() {
      if (result.isNotEmpty) {
        locationList =
            result.map((item) => FourSquareVenueDto.fromJson(item)).toList();
      }
      isLoading = false;
    });
    logger.d('locationList length is  -> ${locationList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위치 추가'),
      ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(loadingMessage),
                ],
              ),
            )
          : ListView.builder(
              itemCount: locationList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    logger.d('onTap $index');
                    Get.back(result: locationList[index] );
                  },
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 22, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ColoredBox(
                                color: AppColors.systemBlack10,
                                child: Image.network(
                                  locationList[index].categories?.first.icon?['prefix']+64.toString()+'.png',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  locationList[index].name ?? '',
                                  style: AppTextStyles.heading3,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  locationList[index].categories?.first.name ??
                                      '',
                                  style: AppTextStyles.subtitle2
                                      .copyWith(color: AppColors.gray02),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              physics: const BouncingScrollPhysics(),
            ),
    );
  }
}
