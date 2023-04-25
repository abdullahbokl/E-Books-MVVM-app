import 'package:flutter/material.dart';

import '../models/book_model/BookModel.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';
import '../../../Features/home/presentation/widgets/book_rate.dart';
import 'custom_book_image.dart';

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightCalculator(120),
      child: Row(
        children: [
          AspectRatio(
              aspectRatio: 1.5 / 2,
              child: CustomBookImage(
                  imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '')),
          SizedBox(width: AppDimensions.widthCalculator(30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo!.title!,
                  style: AppStyles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
                Text(
                  book.volumeInfo!.authors!.first,
                  style: AppStyles.textStyle14,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      _priceText(),
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    BookRate(
                      rate: book.volumeInfo?.averageRating,
                      rateCount: book.volumeInfo?.ratingsCount,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.heightCalculator(5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _priceText() {
    var object = book.saleInfo?.retailPrice;
    return object?.amount != null && object?.amount != 0
        ? "${object?.amount} ${object?.currencyCode}"
        : "Free";
  }
}
