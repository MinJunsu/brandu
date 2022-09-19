import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/viewmodels/home/main.dart';
import 'package:brandu/viewmodels/home/store/main.dart';
import 'package:brandu/widgets/base/snack-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductListBox extends StatelessWidget {
  final List<SimpleProduct> products;

  const ProductListBox({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          SimpleProduct product = products[index];
          return GestureDetector(
            onTap: () {},
            child: MainBox(
              id: product.id,
              title: product.name,
              backdropImage: product.backdrop_image,
              price: product.price,
              isWished: product.is_wish,
            ),
          );
        },
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
                fit: BoxFit.fitHeight,
                image: NetworkImage(backdropImage!),
              ),
            ),
            child: Container(
              width: 10,
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  if (isWished) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(title: '이미 장바구니에 담겨있는 상품입니다.'),
                    );
                  } else {
                    Get.find<StoreController>().addToWishList(id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomButtonSnackBar(
                        title: '${title}이 위시리스트에 담겼습니다.',
                        buttonTitle: '이동하기',
                        onPressed: () {
                          Get.find<HomeController>().goWishPage();
                        },
                      ),
                    );
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isWished
                        ? mainColor
                        : const Color.fromRGBO(217, 217, 217, 0.8),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    fit: BoxFit.scaleDown,
                  ),
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
