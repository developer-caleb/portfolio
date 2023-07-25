import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/bottom_container.dart';

class CouponBottomContainer extends StatelessWidget {
  const CouponBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomContainer(
      title: '할인쿠폰 사용 안내',
      item: const [
        '쿠폰은 설정하신 하나로마트에서만 사용 가능합니다.',
        '쿠폰 사용기간 종료 시 해당 쿠폰은 자동 삭제됩니다.',
        '다른 쿠폰과 중복 사용이 불가합니다.',
        '일부 쿠폰의 경우 1인 1일 1매로 사용이 제한됩니다.',
        '할인 조건은 최종 결제금액 기준으로 적용됩니다.',
        '재결제 시 쿠폰 적용이 불가합니다.',
        '주류, 담배, 종량제 봉투 등 일부 상품은 적용 제외됩니다.',
        '테넌트, 일부 코너 상품은 쿠폰 사용이 불가합니다.'
      ],
    );
  }
}
