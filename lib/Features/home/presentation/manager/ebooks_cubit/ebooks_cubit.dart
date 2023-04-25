import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/models/book_model/BookModel.dart';
import '../../../data/repositories/home_repo.dart';

part 'ebooks_state.dart';

class EbooksCubit extends Cubit<EbooksState> {
  EbooksCubit(this.homeRepo) : super(EBooksInitial());

  final HomeRepo homeRepo;

  fetchEBooks() async {
    emit(EBooksLoading());
    var result = await homeRepo.fetchEbooks();
    result.fold((failure) {
      emit(EBooksFailure(failure.errorMessage));
    }, (books) {
      emit(EBooksSuccess(books));
    });
  }
}
