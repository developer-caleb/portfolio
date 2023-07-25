import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'component/title_nav.dart';
import 'deprecated_coupon_limit.dart';
import 'deprecated_coupon_unlimited.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CouponList extends StatelessWidget {
  const CouponList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleNav('쿠폰', context),
                const Categories(),
                const CouponNumbers(),
                CouponGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const login_api = "http://www.hanaromartapp.com/api/v4/user/";
const login_query = {
  "intg_id": "sjk1102",
  "intg_pwd": "YTgBoCPhfqF61FOaM+cSiA==",
  "store_cd": "1322",
  "token": "ExponentPushToken[kXSFIbK5dyJ0Ofjy02o69i]"
};
var host = "http://www.hanaromartapp.com";
var store_cd;
var user_cd;
const headers = {'Content-Type': 'application/json', 'Cookie': 'WMONID=5Kpk5kG1AqP'};
var coupon_list;

Future<void> login() async {
  try {
    var request = http.Request('PATCH', Uri.parse(login_api));
    request.body = json.encode(login_query);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);
      final data = jsonData["data"];
      final userInfo = data["userInfo"];
      final storeInfo = data["storeInfo"];
      store_cd = storeInfo["store_cd"];
      user_cd = userInfo["user_cd"];
    } else {
      print(response.reasonPhrase);
    }
  } catch (err) {
    print(err);
  }
}

Future<void> couponUse(params) async {
  String url_coupon = 'http://www.hanaromartapp.com/api/coupon/';
  try {
    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Cookie': 'WMONID=5Kpk5kG1AqP'
    };
    var request = http.Request('POST', Uri.parse(url_coupon));
    request.body = json.encode(params);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  } catch (err) {
    print(err);
  }
}

coupon_route(context, item) {
  if (item["limit_yn"] == "Y") {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CouponLimit(item: item)));
  } else if (item["limit_yn"] == "N") {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CouponUnlimited(item: item)));
  }
}

class CouponGrid extends StatefulWidget {
  const CouponGrid({super.key});

  @override
  _CouponGridState createState() => _CouponGridState();
}

class _CouponGridState extends State<CouponGrid> {
  final String host = "http://www.hanaromartapp.com";
  List<Map<String, dynamic>> couponList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    login();
    print("fl");
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse("http://www.hanaromartapp.com/api/coupon/?store_cd=1151&user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D"));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final couponData = responseData["data"]["couponList"] as List<dynamic>;
        setState(() {
          couponList = couponData.cast<Map<String, dynamic>>();
          coupon_list = couponList;
        });
      } else {
        // Handle error
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        crossAxisCount: 2,
        children: couponList.asMap().entries.map((entry) {
          final item = entry.value;
          final status = item["status"];
          final price_gbn = (item["price_gbn"] == 'A' ? ' 원' : ' %');
          return Column(
            children: [
              Image.network(
                host + item['title_img'].toString(),
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
              Text(
                '${item['title']}',
              ),
              Text(
                '${item['price']}' + price_gbn + ' 할인',
              ),
              Text(
                '${item['start_date']} ~ ${item['end_date']}',
              ),
              if (status == "00")
                InkWell(
                  child: Text("쿠폰 다운로드"),
                  onTap: () {
                    // 발급 처리
                    couponUse({"store_cd": item["store_cd"], "user_cd": user_cd, "cou_cd": item["cou_cd"]});
                    // 리스트 갱신
                    fetchData();
                    coupon_route(context, item);
                  },
                ),
              if (status == "10")
                InkWell(
                  child: Text("쿠폰 사용하기"),
                  onTap: () {
                    // 사용 처리
                    couponUse({"store_cd": item["store_cd"], "user_cd": user_cd, "cou_cd": item["cou_cd"]});
                    fetchData(); // 리스트 갱신
                    coupon_route(context, item);
                  },
                ),
              if (status == "20") Text("쿠폰 사용완료"),
              if (status == "30") Text("쿠폰 소진완료"),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class CouponNumbers extends StatefulWidget {
  const CouponNumbers({super.key});

  @override
  _CouponNumbersState createState() => _CouponNumbersState();
}

class _CouponNumbersState extends State<CouponNumbers> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(
                flex: 15,
                child: Container(
                  width: 300,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '쿠폰번호 등록하기',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: TextButton(
                  onPressed: () {
                    // add coupon
                    // coupon list grid refresh
                  },
                  child: const Text('등록'),
                ),
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
          const Text(
            '* 마트에서 발행한 쿠폰만 입력하세요.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categoryList = ['전체 쿠폰', '나의 쿠폰', '상품 쿠폰', '금액 쿠폰'];
  String dropdownValue = '전체 쿠폰';

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Row(
      children: [
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Expanded(
          flex: 21,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: categoryList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(),
          flex: 1,
        ),
      ],
    ));
  }
}
