///Deprecated
/*
class EventDetailGiveawayScreen extends StatefulWidget {
  const EventDetailGiveawayScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailGiveawayScreen> createState() => _EventDetailGiveawayScreenState();
}

class _EventDetailGiveawayScreenState extends State<EventDetailGiveawayScreen> {
  bool agreeReceiveEvent = false;
  bool agreePersonalInfo = false;
  bool agreePersonalSelectiveInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        title: Text('이벤트'),
        leading: BackButton1(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Color(0xFF3B3B3A),
          ),
        ),
      ),
      body: ListView(
        children: [
          Placeholder(
            fallbackHeight: 860,
          ),
          personalInfoAgree(),
          SizedBox(
            height: 36,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: AppStyle.eventButtonStyle
                    .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03A64A))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(AssetImage('assets/app_20/ic_camera.png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text('이벤트 QR 인식'),
                  ],
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: AppStyle.eventButtonStyle
                    .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3C33A0))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/app_20/ic_share.png'),
                      size: 23,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('관련 페이지 이동'),
                  ],
                )),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Column personalInfoAgree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 4,
          thickness: 4,
          color: Color(0xFFC2C3CD),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '개인정보 수집동의 안내',
                style: TextStyle(
                  color: Color(0xFF000807),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Color(0xFF41886F),
                      foregroundColor: Colors.white),
                  child: Text('약관보기')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            '※ 이벤트 참여를 위해 아래의 동의가 필요합니다.',
          ),
        ),
        LabeledCheckbox(
            label: '매장 행사 안내 및 이벤트 정보 수신 동의',
            value: agreeReceiveEvent,
            onChanged: (value) {
              setState(() {
                agreeReceiveEvent = value ?? false;
              });
            },
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        LabeledCheckbox(
          label: '개인정보의 선택적 수집 이용 및 이용 동의',
          value: agreePersonalInfo,
          onChanged: (value) {
            setState(() {
              agreePersonalInfo = value ?? false;
            });
          },
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
        LabeledCheckbox(
          label: '개인정보의 선택적 제공 동의',
          value: agreePersonalSelectiveInfo,
          onChanged: (value) {
            setState(() {
              agreePersonalSelectiveInfo = value ?? false;
            });
          },
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 4,
          thickness: 4,
          color: Color(0xFFC2C3CD),
        ),
      ],
    );
  }
}
*/
