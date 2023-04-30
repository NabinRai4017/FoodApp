import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/reducer/loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action), userState: null);
}
