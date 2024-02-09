import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());
}
