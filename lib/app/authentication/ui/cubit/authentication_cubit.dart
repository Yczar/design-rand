import 'package:bloc/bloc.dart';
import 'package:design_task/app/authentication/data/services/hive_service.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> signIn(String username, String password) async {
    final hiveService = HiveService();
    final isAuthenticated =
        await hiveService.authenticateUser(username, password);
    if (isAuthenticated) {
      emit(AuthenticationSuccess());
    } else {
      emit(AuthenticationFailure());
    }
  }
}
