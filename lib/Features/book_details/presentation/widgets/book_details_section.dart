import 'package:flutter/material.dart';

import '../../../../core/shared/models/book_model/BookModel.dart';
import '../../../../core/shared/widgets/custom_book_image.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/widgets/book_rate.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppDimensions.widthCalculator(200),
          child: CustomBookImage(
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(45)),
        Text(
          book.volumeInfo!.title!,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(5)),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo!.authors!.first,
            style: AppStyles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: AppDimensions.heightCalculator(18)),
        BookRate(
          rate: book.volumeInfo?.averageRating,
          rateCount: book.volumeInfo?.ratingsCount,
        ),
      ],
    );
  }
}
