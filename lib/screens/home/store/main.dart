import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/viewmodels/home/store/main.dart';
import 'package:brandu/widgets/base/box-container.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: [1, 2, 3, 4, 5].map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/carousel/img.png'), // 배경 이미지
                                  ),
                                ),
                                child: Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(10),
                                      width: 45,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.3),
                                      ),
                                      child: NotoText('$i/10', size: 12),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BoxContainer(
                  height: 100,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 15,
                        children: [
                          LabelButton(
                            onPressed: () {},
                            title: '추천상품',
                            icon: 'assets/icons/recommend.svg',
                            color: mainColor,
                          ),
                          LabelButton(
                            onPressed: () {},
                            title: '인기상품',
                            icon: 'assets/icons/star.svg',
                            color: const Color.fromRGBO(236, 175, 73, 1.0),
                          ),
                          ...controller.categories.map(
                            (category) => LabelButton(
                              onPressed: () {},
                              title: category.name,
                              icon: 'assets/icons/star.svg',
                              color: Color(
                                int.parse('0xff${category.color}'),
                              ),
                              isNetwork: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MainSaleBox(
                  title: '브랜뉴 오늘의 핫딜',
                  products: controller.hotDealProducts,
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/event.png'),
                const SizedBox(
                  height: 20,
                ),
                MainSaleBox(
                  title: '6월의 베스트셀러',
                  products: controller.monthlyProducts,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MainSaleBox extends StatelessWidget {
  final String title;
  final List<SimpleProduct> products;

  const MainSaleBox({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SimpleProduct> firstProducts =
        products.sublist(0, products.length ~/ 2);
    List<SimpleProduct> secondProducts =
        products.sublist(products.length ~/ 2, products.length);
    return BoxContainer(
      height: 610,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotoText(title, size: 16, color: Colors.black, isBold: true),
                const NotoText('전체보기', size: 12, color: lightGreyColor),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: firstProducts
                    .map(
                      (product) => MainBox(
                        id: product.id,
                        backdropImage: product.backdrop_image,
                        title: product.name,
                        price: product.price,
                        isWished: product.is_wish,
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: secondProducts
                    .map(
                      (product) => MainBox(
                        id: product.id,
                        backdropImage: product.backdrop_image,
                        title: product.name,
                        price: product.price,
                        isWished: product.is_wish,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainBox extends StatelessWidget {
  final int id;
  final String? backdropImage;
  final String title;
  final int price;
  final bool isWished;

  const MainBox({
    Key? key,
    required this.id,
    this.backdropImage,
    required this.title,
    required this.price,
    required this.isWished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 156,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(backdropImage ??
                    'https://brandu-bucket.s3.ap-northeast-2.amazonaws.com/media/product/2022-08/img.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA552APCMTG7QIRJOW%2F20220831%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20220831T072115Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f02d47fdc447bdb124324af8b741e7c630b321440045c07763fd1c10a89cd9ed'),
              ),
            ),
            child: Container(
              width: 10,
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(10),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isWished
                        ? mainColor
                        : const Color.fromRGBO(217, 217, 217, 0.8)),
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotoText(title, size: 14, color: greyColor),
                const SizedBox(
                  height: 3,
                ),
                NotoText('$price원',
                    size: 14, color: Colors.black, isBold: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}
