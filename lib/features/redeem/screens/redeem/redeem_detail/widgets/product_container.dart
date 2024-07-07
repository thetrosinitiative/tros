import 'package:flutter/material.dart';
import 'package:tros/features/redeem/controllers/redeem/product_controller.dart';
import 'package:tros/features/redeem/models/redeem/redeem_model.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
    required this.onPressed,
  });
  final ProductModel product;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      width: 164,
      backgroundColor: PColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: PRoundedImage(
              isNetworkImage: true,
              backgroundColor: PColors.white,
              imageUrl: product.image,
              height: 155,
              width: 133,
            ),
          ),
          Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(fontSizeDelta: 1, fontWeightDelta: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  '${product.price} Tros coins',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      fontSizeDelta: 4,
                      fontWeightDelta: 1,
                      color: PColors.primary),
                ),
              ),
              GestureDetector(
                  onTap: onPressed,
                  child: const Center(
                    child: PCircularIcon(
                      backgroundColor: PColors.primary,
                      icon: Icons.add,
                      width: 25,
                      height: 25,
                      size: 18,
                      color: PColors.white,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
