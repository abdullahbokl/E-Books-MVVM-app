import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/data/repositories/home_repo_impl.dart';
import 'Features/home/presentation/manager/ebooks_cubit/ebooks_cubit.dart';
import 'Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'core/utils/colors.dart';
import 'core/utils/dimensions.dart';
import 'core/utils/router.dart';
import 'core/utils/services_locator.dart';
import 'package:nested/nested.dart';

class BokloEBook extends StatelessWidget {
  const BokloEBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            _screenSize(context);
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Boklo Ebook',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: AppColors.primaryColor,
                textTheme: GoogleFonts.montserratTextTheme(
                  ThemeData.dark().textTheme,
                ),
              ),
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }

  List<SingleChildWidget> _blocProviders() {
    return [
      BlocProvider(
        create: (context) => EbooksCubit(
          getIt.get<HomeRepoImpl>(),
        )..fetchEBooks(),
      ),
      BlocProvider(
        create: (context) => NewestBooksCubit(
          getIt.get<HomeRepoImpl>(),
        )..fetchNewestBooks(),
      ),
    ];
  }

  _screenSize(BuildContext context) {
    AppDimensions.screenWidth = MediaQuery.of(context).size.width;
    AppDimensions.screenHeight = MediaQuery.of(context).size.height;
  }
}
