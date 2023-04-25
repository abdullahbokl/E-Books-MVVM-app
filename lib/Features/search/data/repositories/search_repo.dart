import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/shared/models/book_model/BookModel.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchResults({
    required String query,
  });
}
