import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/order.dart';
import 'package:brandu/utils/format.dart';
import 'package:brandu/viewmodels/profile/order/shipping/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingPage extends GetView<ShippingController> {
  const ShippingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      controller.setTabHeaders(Get.arguments);
    }
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '주문/배송 조회',
      ),
      body: Obx(
        () => DefaultTabController(
          length: controller.tabHeaders.length,
          child: Column(
            children: [
              Container(
                decoration: borderBottom(),
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: TabBar(
                    labelPadding: const EdgeInsets.all(0),
                    controller: controller.tabController,
                    onTap: controller.setTabHeaders,
                    indicatorWeight: 0.1,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                      fontFamily: 'Noto Sans KR',
                      fontSize: 14,
                      height: 1.4,
                      letterSpacing: -0.5,
                      wordSpacing: -0.5,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: 'Noto Sans KR',
                      fontSize: 14,
                      height: 1.4,
                      letterSpacing: -0.5,
                      wordSpacing: -0.5,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                    tabs: controller.tabHeaders,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    ShippingContainer(
                      orders: controller.orders,
                    ),
                    ShippingContainer(
                      orders: controller.paidOrder,
                    ),
                    ShippingContainer(
                      orders: controller.deliveryOrder,
                    ),
                    ShippingContainer(
                      orders: controller.completeOrder,
                    ),
                    ShippingContainer(
                      orders: controller.confirmOrder,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingContainer extends StatelessWidget {
  final List<Order> orders;

  const ShippingContainer({
    required this.orders,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: borderBottom(),
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                NotoText(
                  '1년 이내 내역까지 조회할 수 있어요.',
                  size: 12,
                  color: greyColor,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              decoration: borderBottom(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return ShippingBox(order: orders[index]);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShippingBox extends StatelessWidget {
  final Order order;

  const ShippingBox({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NotoText(
                    '${baseDateFormat.format(order.created)} 주문',
                    size: 14,
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       order.products[0].product.backdrop_image!),
                        // ),
                        ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotoText(
                    order.status.toString(),
                    size: 14,
                    color: Colors.black,
                    isBold: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  NotoText(
                    order.name,
                    size: 14,
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      NotoText(
                        currencyFormat.format(order.price),
                        size: 14,
                        color: Colors.black,
                        isBold: true,
                      ),
                      const NotoText(
                        ' 원',
                        size: 14,
                        color: greyColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const NotoText(
                    'Mint / M / 1개',
                    size: 14,
                    color: greyColor,
                  ),
                ],
              ),
            ],
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 10,
            children: [
              SizedBox(
                width: 70,
                height: 30,
                child: MainSmallButtonBox(
                  title: '상세조회',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: SmallButtonBox(
                  title: '배송조히',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: SmallButtonBox(
                  title: '리뷰쓰기',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
