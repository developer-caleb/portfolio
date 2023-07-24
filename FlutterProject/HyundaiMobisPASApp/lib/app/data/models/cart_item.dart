//옛날 코드라 freezed 또는 JsonSerializable이 적용되지 않은 모습입니다
class CartItem {
  String ennm;
  int seq;
  String ptno;
  int qty;
  int price;
  String mutual;
  String agentCode;
  String sapCode;
  String krnm;
  String deliveryCode;
  String mmid;
  String tel;
  bool isChecked;

  CartItem({
    this.ennm = '',
    this.seq = 0,
    this.ptno = '',
    this.qty = 0,
    this.price = 0,
    this.mutual = '',
    this.agentCode = '',
    this.sapCode = '',
    this.krnm = '',
    this.deliveryCode = '',
    this.mmid = '',
    this.tel = '',
    this.isChecked = false,
  });

  factory CartItem.fromJson(dynamic data) {
    return CartItem(
      ennm: data['en_nm'],
      seq: data['seq'],
      ptno: data['ptno'],
      qty: data['qty'],
      price: (data['price'] * 1.1).round(),
      mutual: data['mutual'] ?? '',
      agentCode: data['agent_cd'],
      sapCode: data['sap_code'],
      krnm: data['kr_nm'] ?? '',
      deliveryCode: data['delivery_cd'],
      mmid: data['mmid'],
      tel: data['tel_number'] ?? '',
      isChecked: false,
    );
  }
}
