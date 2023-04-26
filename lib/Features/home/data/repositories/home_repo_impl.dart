import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/shared/models/book_model/BookModel.dart';
import '../../../../core/utils/functions/convert_data_into_list.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchEbooks() async {
    try {
      var data = await apiServices
          .get('volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books = dataConversion(data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices
          .get('volumes?Filtering=ebooks&Sorting=newest &q=computer science');
      List<BookModel> books = dataConversion(data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
      List<BookModel> books = dataConversion(data);
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
