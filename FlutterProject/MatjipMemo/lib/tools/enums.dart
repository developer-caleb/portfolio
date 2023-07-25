import 'package:flutter/material.dart';
import 'package:matjipmemo/constants/app_colors.dart';

import 'logger.dart';

enum AuthStatus { SIGNIN, SIGNOUT, PROCESSING }

enum SignInMethodFlag { google, kakao, naver, apple }

enum UserType { PREMEMBER, MEMBER, MASTER, UNREGISTER }

enum StarType { taste, service, price, atmosphere, waiting }

enum SearchState { Unfocus, BeforeSearch, InputQuery, SubmittedQuery, MapDetail, MapQuery }

enum QueryType {
  famous('추천 모임'),
  recent('새로운 모임'),
  my('나의 모임'),
  unknown('');

  final String info;

  factory QueryType.fromInfo(String? name) {
    logger.d('QueryType name : $name');
    switch (name) {
      case 'famous':
        return QueryType.famous;
      case 'recent':
        return QueryType.recent;
      case 'my':
        return QueryType.my;
    }
    return QueryType.unknown;
  }

  const QueryType(this.info);
}

enum SearchMode {
  LIST,
  GRID,
  MAP,
}

enum PageState { loading, done }

enum FollowMode { follower, following }

enum AgreeMode { terms, personalInfo, location }

enum ReportType {
  noRelation('관련 없는 컨텐츠'),
  advertisement('광고성 게시글'),
  etc('직접 작성');

  final String info;

  const ReportType(this.info);
}

enum CollectionType {
  stamp('스탬프'),
  trophy('트로피'),
  badge('뱃지'),
  paint('물감'),
  etc('기타');

  factory CollectionType.fromId(String? name) {
    switch (name) {
      case 'stamp':
        return CollectionType.stamp;
      case 'trophy':
        return CollectionType.trophy;
      case 'paint':
        return CollectionType.paint;
      case 'etc':
        return CollectionType.etc;
    }
    return CollectionType.stamp;
  }

  final String info;

  const CollectionType(this.info);
}

enum SupplyCompany { Google, Kakao }

enum GroupingFactor {
  date('날짜별'),
  name('상호별'),
  location('지역별'),
  category('카테고리'),
  star('별점순'),
  visit('방문여부');

  factory GroupingFactor.fromInfo(String? name) {
    switch (name) {
      case '날짜별':
        return GroupingFactor.date;
      case '상호별':
        return GroupingFactor.name;
      case '지역별':
        return GroupingFactor.location;
      case '카테고리':
        return GroupingFactor.category;
      case '별점순':
        return GroupingFactor.star;
      case '방문여부':
        return GroupingFactor.visit;
    }
    return GroupingFactor.date;
  }

  static List<GroupingFactor> get factorList => [
        GroupingFactor.date,
        GroupingFactor.star,
        GroupingFactor.name,
        GroupingFactor.location, //GroupingFactor.category,
        GroupingFactor.visit,
      ];
  final String info;

  const GroupingFactor(this.info);
}

enum ReportState { unseen, unaccepted, accepted, unReported }

enum ReportContentsType { matjip, comment, place, user }

enum PostMode {
  eatrip('맛집과 여행'),
  eat('맛집'),
  trip('여행');

  factory PostMode.fromInfo(String? info) {
    switch (info) {
      case 'eatrip':
        return PostMode.eatrip;
      case 'eat':
        return PostMode.eat;
      case 'trip':
        return PostMode.trip;
      case 'etc':
        return PostMode.eatrip;
    }
    return PostMode.eatrip;
  }

  factory PostMode.fromIndex(int index) {
    switch (index) {
      case 0:
        return PostMode.eatrip;
      case 1:
        return PostMode.eat;
      case 2:
        return PostMode.trip;
    }
    return PostMode.eatrip;
  }

  Color get postModeColor {
    switch (this) {
      case PostMode.eatrip:
        return AppColors.mainPurpleColor;
      case PostMode.eat:
        return AppColors.mainRedColor;
      case PostMode.trip:
        return AppColors.mainBlueColor;
    }
  }

  final String info;

  const PostMode(this.info);
}

enum ModifyType { list, detail }

enum PopUpMenu {
  issue('발행'),
  share('공유'),
  modify('수정'),
  delete('삭제'),
  report('신고');

  final String info;

  const PopUpMenu(this.info);
}

enum PointClass {
  xp,
  diamond,
  gold;

  factory PointClass.fromName(String? name) {
    //logger.d('type is $name');
    switch (name) {
      case 'xp':
        return PointClass.xp;
      case 'diamond':
        return PointClass.diamond;
      case 'gold':
        return PointClass.gold;
    }
    return PointClass.xp;
  }
}

enum PointType {
  viewList,
  recommendUser,
  linkedMatjip,
  buyList,
  sellList,
  buyGold,
  xp,
  etc;

  String toDescription() {
    switch (this) {
      case PointType.viewList:
        return '맛집 리스트 보여짐';
      case PointType.recommendUser:
        return '추천인 등록';
      case PointType.linkedMatjip:
        return '가볼 곳으로 등록';
      case PointType.etc:
        return '기타 포인트';
      case PointType.xp:
        return '경험치 획득';
      case PointType.buyGold:
        return '골드 구매';
      case PointType.buyList:
        return '리스트 구매';
      case PointType.sellList:
        return '리스트 판매';
    }
  }

  factory PointType.fromName(String? name) {
    logger.d('type is $name');
    switch (name) {
      case 'viewList':
        return PointType.viewList;
      case 'recommendUser':
        return PointType.recommendUser;
      case 'linkedMatjip':
        return PointType.linkedMatjip;
      case 'xp':
        return PointType.xp;
      case 'buyList':
        return PointType.buyList;
      case 'sellList':
        return PointType.sellList;
    }
    return PointType.etc;
  }
}

enum OptionType {
  STOREVISIT,
  PACKAGING,
  DELIVERY,
  FREEPARKING,
  NOPARKING,
  PARKINGTOWER,
  VALETPARKING, //주차
  SEDENTARY,
  STANDING,
  RESERVED,
  PRIVATEROOM,
  TERRACE,
  ROOFTOP,
  LARGEROOM, //매장형태
  FOODTOUR,
  MEETFRIENDS,
  FAMILYDININGOUT,
  DATE,
  BLINDDATE,
  ANNIVERSARY,
  SINGLE,
  GATHERING,
  PHOTO, //이용목적
  CONFERENCE,
  DININGTOGETHER,
  EVENT,
  BUSINESSTRIP,
  DIET, //이용목적
  HIDDENRESTAURANT,
  LOCALCOLOR,
  LUXURIOUS,
  QUIET,
  NOISY,
  CLEAN,
  EMOTIONAL, //분위기
  EXOTIC,
  TRADITIONAL,
  NICENIGHTVIEW,
  NICEVIEW, //분위기
  OPENTIME,
  BREAKTIME,
  LASTORDER,
  HOLIDAY,
  OTHERS, //운영시간
  MENU, //가격, 메뉴
  CHILDRENSMENU,
  CHILDRENTABLEWARE,
  NURSINGROOM,
  BABYCHAIR,
  PLAYROOM,
  STROLLER,
  DIAPERCHANGINGTABLE,
  BABYPOTTY, //영유아
  DISABLEDPARKINGLOT,
  DISABLEDTOILET,
  BRAILLEMENU,
  GUIDEDOG,
  KIOSK,
  NOTHRESHOLD,
  LOWTHRESHOLD, //장애인
  WIDEMOVEMENTSPACE,
  RAMP,
  ELECTRICWHEELCHAIR, //장애인
  PETONLYMENU,
  EXTERNALTABLE,
  LARGEDOG,
  DOGPLAYGROUND, //반려동물
  KOREAN,
  ENGLISH,
  CHINESE,
  JAPANESE //언어
}
