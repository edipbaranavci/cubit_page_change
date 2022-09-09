import 'home_cubit_state.dart';
import '../../home_page_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomeCubitState> {
  HomePageCubit() : super(const HomeCubitState());

  void setPage(HomePageEnums page) => emit(HomeCubitState(pageEnums: page));
}
