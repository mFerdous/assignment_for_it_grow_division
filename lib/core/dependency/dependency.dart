import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/core/header_provider/header_provider.dart';
import 'package:test_task/core/network/connection_checker.dart';
import 'package:test_task/features/common/data/data_source/local/locale_source.dart';
import 'package:test_task/features/common/data/data_source/local/token_source.dart';
import 'package:test_task/features/common/data/repository/locale_repo_impl.dart';
import 'package:test_task/features/common/domain/repository/locale_repository.dart';
import 'package:test_task/features/common/domain/usecase/locale_usecase.dart';
import 'package:test_task/features/common/presentation/cubit/locale/locale_cubit.dart';

import '../../features/common/data/data_source/local/partner_token_source.dart';
import '../../features/profile_info/data/remote/profile_info_remote.dart';
import '../../features/profile_info/data/repository_impl/profile_info_repository_impl.dart';
import '../../features/profile_info/domain/repository/profile_info_repository.dart';
import '../../features/profile_info/domain/usecase/profile_info_usecase.dart';
import '../../features/profile_info/presentation/cubit/profile_info_cubit.dart';
import '../../features/sign_in/data/remote/partner_sign_in_remote.dart';
import '../../features/sign_in/data/remote/sign_in_remote.dart';
import '../../features/sign_in/data/repository_impl/partner_sign_in_repository_impl.dart';
import '../../features/sign_in/data/repository_impl/sign_in_repository_impl.dart';
import '../../features/sign_in/domain/repository/partner_sign_in_repository.dart';
import '../../features/sign_in/domain/repository/sign_in_repository.dart';
import '../../features/sign_in/domain/usecase/partner_sign_in_usecase.dart';
import '../../features/sign_in/domain/usecase/sign_in_usecase.dart';
import '../../features/sign_in/presentation/cubit/partner_sign_in_cubit.dart';
import '../../features/sign_in/presentation/cubit/sign_in_cubit.dart';
import '../../features/sign_in/presentation/cubit/sign_in_validation/sign_in_validation_cubit.dart';
import '../../features/sign_out/presentation/cubit/sign_out_cubit.dart';

class Dependency {
  static final sl = GetIt.instance;
  Dependency._init();

  static Future<void> init() async {
//-------------------------------------------------------//
    sl.registerLazySingleton<LocaleSource>(() => LocaleSourceImpl(sl()));

    sl.registerLazySingleton<LocaleRepository>(
        () => LocaleRepositoryImpl(sl()));
    sl.registerLazySingleton(() => ReadLocaleUsecase(sl()));
    sl.registerLazySingleton(() => SaveLocaleUsecase(sl()));
    sl.registerLazySingleton(() => LocaleCubit(
          readLocaleUsecase: sl(),
          saveLocaleUsecase: sl(),
        ));
    final sharedPref = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPref);
    sl.registerLazySingleton(() => Client());

    sl.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(),
    );
    sl.registerLazySingleton<TokenSource>(() => TokenSourceImpl(sl()));
    sl.registerLazySingleton<PartnerTokenSource>(
        () => PartnerTokenSourceImpl(sl()));
    sl.registerLazySingleton<HeaderProvider>(() => HeaderProviderImpl());
    sl.registerLazySingleton(() => AuthHeaderProvider(sl()));

//---------------------------------------------------------//

//---------------------------Sign In Start-------------------------------//

    sl.registerLazySingleton<SignInRemote>(
      () => SignInRemoteImpl(sl()),
    );

    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => SignInUsecase(sl()));
    sl.registerFactory(() => SignInApiCubit(signInUsecase: sl()));
    sl.registerFactory(() => SignInValidationCubit());
    sl.registerFactory(() => SignOutCubit());

//---------------------------Sign In End-------------------------------//

//---------------------------Partner Sign In Start-------------------------------//

    sl.registerLazySingleton<PartnerSignInRemote>(
      () => PartnerSignInRemoteImpl(sl()),
    );

    sl.registerLazySingleton<PartnerSignInRepository>(
      () => PartnerSignInRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => PartnerSignInUsecase(sl()));
    sl.registerFactory(() => PartnerSignInApiCubit(partnerSignInUsecase: sl()));

//---------------------------Partner Sign In End-------------------------------//

//---------------------------Profile Info Start-------------------------------//

    sl.registerLazySingleton<ProfileInfoRemote>(
      () => ProfileInfoRemoteImpl(sl()),
    );

    sl.registerLazySingleton<ProfileInfoRepository>(
      () => ProfileInfoRepositoryImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => ProfileInfoUsecase(sl()));
    sl.registerFactory(() => ProfileInfoApiCubit(profileInfoUsecase: sl()));

//---------------------------Profile Info End-------------------------------//
  }

  static final providers = <BlocProvider>[
    BlocProvider<LocaleCubit>(
      create: (context) => Dependency.sl<LocaleCubit>(),
    ),
    BlocProvider<SignInApiCubit>(
      create: (context) => Dependency.sl<SignInApiCubit>(),
    ),
    BlocProvider<PartnerSignInApiCubit>(
      create: (context) => Dependency.sl<PartnerSignInApiCubit>(),
    ),
    BlocProvider<SignInValidationCubit>(
      create: (context) => Dependency.sl<SignInValidationCubit>(),
    ),
    BlocProvider<SignOutCubit>(
      create: (context) => Dependency.sl<SignOutCubit>(),
    ),
    BlocProvider<ProfileInfoApiCubit>(
      create: (context) => Dependency.sl<ProfileInfoApiCubit>(),
    ),
  ];
  //cubit
}
