import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/cafe_and_restaurant_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/category_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/dress_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/hair_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/hall_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/makeup_artist_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/photographer_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/suit_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/travel_repository_imp.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/respositories/cafe_and_restaurant_repository.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hair_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/makeup_artist_repository.dart';
import 'package:wahg_v1/features/domain/respositories/photographer_repository.dart';
import 'package:wahg_v1/features/domain/respositories/suit_repository.dart';
import 'package:wahg_v1/features/domain/respositories/travel_repository.dart';
import 'package:wahg_v1/features/domain/usecases/get_cafe_and_restaurant_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_categories_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_dress_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_hair_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_makeup_artist_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_photographer_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_suit_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_travel_usecase.dart';
import 'package:wahg_v1/features/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/bloc/dresses_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/bloc/photographer_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/bloc/hair_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/bloc/suit_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/bloc/travel_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/bloc/makeup_artist_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc,Cubit
  sl.registerSingleton<CategoryBloc>(CategoryBloc());
  sl.registerSingleton<HallsBloc>(HallsBloc());
  sl.registerSingleton<DressesBloc>(DressesBloc());
  sl.registerSingleton<PhotographerBloc>(PhotographerBloc());
  sl.registerSingleton<CafeAndRestaurantBloc>(CafeAndRestaurantBloc());
  sl.registerSingleton<HairBloc>(HairBloc());
  sl.registerSingleton<SuitBloc>(SuitBloc());
  sl.registerSingleton<TravelBloc>(TravelBloc());
  sl.registerSingleton<MakeupArtistBloc>(MakeupArtistBloc());

  /// UseCases
  sl.registerLazySingleton<GetCategoryUseCase>(
      () => GetCategoryUseCase(categoryRepository: sl.call()));
  sl.registerLazySingleton<GetHallUseCase>(
      () => GetHallUseCase(hallRepository: sl.call()));
  sl.registerLazySingleton<GetDressesUseCase>(
      () => GetDressesUseCase(dressRepository: sl.call()));
  sl.registerLazySingleton<GetPhotographerUseCase>(
      () => GetPhotographerUseCase(photographerRepository: sl.call()));
  sl.registerLazySingleton<GetCafeAndRestaurantUseCase>(() =>
      GetCafeAndRestaurantUseCase(cafeAndRestaurantRepository: sl.call()));
  sl.registerLazySingleton<GetHairUseCase>(() =>
      GetHairUseCase(hairRepository: sl.call()));
  sl.registerLazySingleton<GetSuitUseCase>(() =>
      GetSuitUseCase(suitRepository: sl.call()));
 sl.registerLazySingleton<GetTravelUseCase>(() =>
      GetTravelUseCase(travelRepository: sl.call()));
 sl.registerLazySingleton<GetMakeupArtistUseCase>(() =>
      GetMakeupArtistUseCase(makeupArtistRepository: sl.call()));

  /// Repositories
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<HallRepository>(
      () => HallRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<DressRepository>(
      () => DressRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<PhotographerRepository>(
      () => PhotographerRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<CafeAndRestaurantRepository>(
      () => CafeAndRestaurantRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<HairRepository>(
      () => HairRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<SuitRepository>(
      () => SuitRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<TravelRepository>(
      () => TravelRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<MakeupArtistRepository>(
      () => MakeupArtistRepositoryImp(remoteDataSource: sl.call()));

  /// DataSourece
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImp(
          firestore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));

  // Local
  sl.registerSingletonAsync<SharedPreferences>(() {
    print('[✅ Initialized] SharedPreference Initialized in di');
    return SharedPreferences.getInstance();
  });
  sl.registerSingleton<AppSettingsCache>(AppSettingsCache(),
      signalsReady: true);

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSigIn = GoogleSignIn();

  sl.registerLazySingleton<FirebaseAuth>(() => auth);
  sl.registerLazySingleton<FirebaseFirestore>(() => fireStore);
  sl.registerLazySingleton<GoogleSignIn>(() => googleSigIn);
}
