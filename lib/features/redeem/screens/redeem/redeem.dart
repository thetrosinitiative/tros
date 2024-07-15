import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tros/common/builders/gridviewbuilder.dart';
import 'package:tros/common/widgets/appbar/boldAppbar.dart';
import 'package:tros/common/widgets/appbar/searchBar.dart';
import 'package:tros/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tros/common/widgets/icons/circular_icon.dart';
import 'package:tros/common/widgets/images/edge_rounded_images.dart';
import 'package:tros/common/widgets/texts/section_heading.dart';
import 'package:tros/features/redeem/models/redeem/redeem_model.dart';
import 'package:tros/features/redeem/screens/exchange/exchange.dart';
import 'package:tros/features/redeem/screens/redeem/redeem_detail/widgets/redeem_detail.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/constants/image_strings.dart';
import 'package:tros/utils/constants/sizes.dart';
import 'package:tros/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/icons/cart_menu_icon.dart';
import '../../../../common/widgets/shimmers/product_shimmer.dart';
import '../../../../utils/helpers/cloud_helper.dart';
import '../../controllers/redeem/cart_controller.dart';
import '../../controllers/redeem/product_controller.dart';
import '../cart/cart.dart';
import 'redeem_detail/widgets/product_container.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final productController = Get.put(ProductController());
    final cartController = CartController.instance;

    return Scaffold(
      backgroundColor: PColors.light,
      appBar: const BoldAppbar(
        text: 'Redeem',
        actionButton: CartCounterIcon(iconColor: PColors.primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PSizes.md, horizontal: PSizes.md - 4),
          child: Column(
            children: [
              // SEARCH BAR
              const TSearchBar(
                prefixWidget: Icon(
                  Iconsax.search_normal_1_outline,
                  color: PColors.primary,
                  size: 20,
                ),
                hintText: 'Search goods',
                color: PColors.white,
                radius: 67,
                useBorder: false,
              ),
              const SizedBox(
                height: PSizes.lg,
              ),
              // OFFERS SLIDER

              CarouselSlider(
                items: const [
                  PRoundedImage(
                    imageUrl: PImages.brown,
                    width: 350,
                    height: 206,
                  )
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                ),
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // NEW ARRIVALS
              // BEST SELLING
              Column(
                children: [
                  PSectionHeading(
                    title: 'Best selling',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),

                  // BEST SELLING ITEMS

                  FutureBuilder<List<ProductModel>>(
                      future: productController.fetchProductQuery(),
                      builder: (context, snapshot) {
                        const loader = ProductShimmer();
                        final widget =
                            KCloudHelperFunction.checkMultiRecordState(
                                snapshot: snapshot, loader: loader);
                        if (widget != null) return widget;
                        // PRODUCTS AVAILABLE
                        final data = snapshot.data!;
                        return GridViewBuilder(
                          itemCount: data.length,
                          mainAxisExtent: 220,
                          child: (_, index) => GestureDetector(
                            onTap: () => Get.to(() => RedeemDetail(
                                  product: data[index],
                                )),
                            child: ProductContainer(
                                product: data[index],
                                onPressed: () {
                                  final cartItem = cartController
                                      .convertToCartItem(data[index], 1);
                                  cartController.addItemToCart(cartItem);
                                }),
                          ),
                        );
                      }),
                ],
              )
              // FOR YOU
            ],
          ),
        ),
      ),
      // floatingActionButton: PCircularIcon(
      //   boxShadow: [
      //     BoxShadow(
      //       color: isDark
      //           ? PColors.white.withOpacity(.15)
      //           : Colors.black.withOpacity(.15),
      //       blurRadius: 30,
      //       offset: const Offset(0, 10),
      //     ),
      //   ],
      //   backgroundColor: PColors.primary,
      //   color: PColors.white,
      //   icon: Iconsax.gift_bold,
      //   size: 30,
      //   width: 55,
      //   height: 55,
      //   onPressed: () => Get.to(() => const CartScreen()),
    );
    //
  }
}
