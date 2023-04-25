import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/models/book_model/BookModel.dart';
import '../../../data/repositories/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  static SearchCubit get(context) => BlocProvider.of(context);

  final TextEditingController textEditingController = TextEditingController();

  searchBooks() async {
    emit(SearchLoading());
    var result =
        await searchRepo.fetchSearchResults(query: textEditingController.text);

    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
