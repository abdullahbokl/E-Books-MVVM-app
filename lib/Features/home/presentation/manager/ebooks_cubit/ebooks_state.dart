part of 'ebooks_cubit.dart';

@immutable
abstract class EbooksState extends Equatable {
  const EbooksState();

  @override
  List<Object> get props => [];
}

class EBooksInitial extends EbooksState {}

class EBooksLoading extends EbooksState {}

class EBooksSuccess extends EbooksState {
  final List<BookModel> books;

  const EBooksSuccess(this.books);
}

class EBooksFailure extends EbooksState {
  final String errMessage;

  const EBooksFailure(this.errMessage);
}
