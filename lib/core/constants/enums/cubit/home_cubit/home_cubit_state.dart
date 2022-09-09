import '../../home_page_enums.dart';
import 'package:equatable/equatable.dart';

class HomeCubitState extends Equatable {
  const HomeCubitState({this.pageEnums = HomePageEnums.page1});
  final HomePageEnums pageEnums;

  @override
  List<Object?> get props => [pageEnums];
}
