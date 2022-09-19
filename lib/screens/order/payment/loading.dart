import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';

class PaymentLoadingPage extends StatelessWidget {
  const PaymentLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: '결제',
        leading: Container(),
        actions: const <Widget>[],
      ),
      initialChild: Container(
        child: Column(
          children: [
            const NotoText(
              '결제화면으로 이동중입니다.',
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
      ),
      userCode: 'tosstest',
      data: PaymentData(
          pg: 'html5_inicis',
          // PG사
          payMethod: 'toss',
          // 결제수단
          name: '아임포트 결제데이터 분석',
          // 주문명
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
          // 주문번호
          amount: 39000,
          // 결제금액
          buyerName: '홍길동',
          // 구매자 이름
          buyerTel: '01012345678',
          // 구매자 연락처
          buyerEmail: 'example@naver.com',
          // 구매자 이메일
          buyerAddr: '서울시 강남구 신사동 661-16',
          // 구매자 주소
          buyerPostcode: '06018',
          // 구매자 우편번호
          appScheme: 'example',
          // 앱 URL scheme
          displayCardQuota: [2, 3] //결제창 UI 내 할부개월수 제한
          ),
      callback: (Map<String, String> result) => Get.toNamed(
        'order/payment/success',
        arguments: result,
      ),
    );
  }
}
