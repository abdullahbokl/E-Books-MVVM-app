import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/shared/models/book_model/BookModel.dart';
import '../../../../core/utils/functions/convert_data_into_list.dart';
import 'search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl(this._apiServices);

  final ApiServices _apiServices;

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults(
      {required String query}) async {
    try {
      var data = await _apiServices.get('volumes?q=$query');
      List<BookModel> books = dataConversion(data);
      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDiorError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
