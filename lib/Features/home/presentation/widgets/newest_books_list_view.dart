import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/custom_circular_indicator.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/shared/widgets/book_details_card.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/shared/models/book_model/BookModel.dart';
import '../manager/newest_books_cubit/newest_books_cubit.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return _booksList(state.books);
        } else if (state is NewestBooksFailure) {
          return ErrorWidget(state.errMessage);
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }

  ListView _booksList(List<BookModel> books) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).push(
            AppRouter.bookDetails,
            extra: books[index],
          ),
          child: Padding(
            padding:
                EdgeInsets.only(bottom: AppDimensions.heightCalculator(20)),
            child: BookDetailsCard(book: books[index]),
          ),
        );
      },
    );
  }
}
