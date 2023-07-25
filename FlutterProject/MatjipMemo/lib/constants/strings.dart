import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageStrings {
  ImageStrings._(); ////instance 할 수 없음
  static String diaIcon = 'assets/icons/ic_crystal32.png';
  static String coinIcon = 'assets/icons/ic_coin32.png';
  static String goldIcon = 'assets/icons/ic_coin32.png';
}

const String testImgUrl = 'https://randomuser.me/api/portraits/lego/7.jpg';
const String MEMBER = "member";

const menuOption = ["맛", "가격", "사이즈", "재방문"];
const evaluation = ["매우 불만족", "불만족", "보통", "만족", "매우 만족"];
const bottomDetailTabString = ["이용방법", "이용목적", "분위기", "운영시간", "가격, 메뉴", "영유아", "장애인", "반려동물", "장애인", "채식주의"];
List initialBoardNameString = [
  ['자유글'.tr, 'normal'],
  ['가입인사'.tr, 'normal'],
  ['공지사항'.tr, 'notice'],
];
const myVworldKey = "7E75B522-E31F-3824-AAA2-9155FF77B796";
const String keySearchHistory = "SearchHistory";
const managerUid = [
  "Q5AOXPECMobMZn0oqTgPOS236OB2", //오잉
  "NDlJpK1RqtaUZhm8REmEn6e5xGh2", //잇트립
  "kakao:2120309159", //김정호
  //'nvDwNap6mxMzcmaKaVuVj3qBCGf2', //먹는것이힘이다 -> 여기 넣어놓으면 사람들이;
];
const developerUid = {
  //운영자애플
  'S3CiPcgxlhPumqKnHdb2Z2iakim1',

  //잇트립
  "NDlJpK1RqtaUZhm8REmEn6e5xGh2",

  //김정호
  "kakao:2120309159",

  //먹는것이힘이다
  'nvDwNap6mxMzcmaKaVuVj3qBCGf2',
};
var inquireStartString = "안녕하세요, 무엇을 도와 드릴까요?".tr;
String moimLeader = "모임장".tr;
String moimSubLeader = "운영진".tr;
const inquireManagerName = "Eatrip,Support";
const inquireManagerImg = "https://randomuser.me/api/portraits/lego/7.jpg";
String doLogin = "로그인 후 사용 가능합니다.".tr;
String bannedCheck = '계정이 일시정지 되었습니다.\n자세한 사항은 1:1 문의 부탁드립니다.'.tr;
const String googleApiKey = "AIzaSyDO1FbgmLDCDLqnUByEm8Lu4PMMoVFClgg";
const imoticonIcons = [
  Icons.sentiment_very_dissatisfied_outlined,
  Icons.sentiment_dissatisfied_outlined,
  Icons.sentiment_neutral_outlined,
  Icons.sentiment_satisfied_outlined,
  Icons.sentiment_very_satisfied_outlined
];
//const List<String> groupingList = ['날짜별', '상호별', '지역별', '카테고리', '방문여부']; //enum으로 대체 됨
const myGoogleApiKey = 'AIzaSyDO1FbgmLDCDLqnUByEm8Lu4PMMoVFClgg';
const defaultFoodImage = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fdefault.png?alt=media&token=434a1be9-2ff4-412a-ad2c-10e62da2218b';
const fourSquareApikey1 = 'fsq3POgp7jbCl3q1l0Kkkc6YGDLujlLj0mvxwOwCUAEFOhI=';
const locationEn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fen%2Flocation_en.html?alt=media&token=32376abb-50d7-46e3-a42b-b2c76db4f669';
const personalInfoEn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fen%2Fpersonal_info_en.html?alt=media&token=7fac28bd-1cd5-4c1c-9707-a1b793a431cd';
const termsEn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fen%2Fterms_en.html?alt=media&token=b66ce7d6-8768-4d00-b10b-24ca9b1f46f8';
const locationKo = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fko%2Flocation.html?alt=media&token=3c9d4d86-2845-4f35-9d15-5e92a424aa9e';
const personalInfoKo = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fko%2Fpersonal_info.html?alt=media&token=56b4c263-d462-4bc1-a277-b0e0c9b81c5f';
const termsKo = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fko%2Fterms.html?alt=media&token=70eb8e70-5f07-48ec-a409-a582e9d4b5de';
const locationCn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fcn%2Flocation_cn.html?alt=media&token=c7043bc1-3b41-46a4-bc89-4f9a728ff5f1';
const personalInfoCn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fcn%2Fpersonal_info_cn.html?alt=media&token=9ecb5e8a-97a8-470d-b1a8-66aa42f30159';
const termsCn = 'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2Fterms%2Fcn%2Fterms_cn.html?alt=media&token=c360b398-e240-4f01-baaa-9ea04a827c14';
