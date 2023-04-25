import '../../shared/models/book_model/BookModel.dart';

List<BookModel> dataConversion(data) {
  List<BookModel> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
