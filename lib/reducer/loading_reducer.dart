import 'package:food_app/action/loading_action.dart';

bool loadingReducer(bool loading, action) {
  if (action is LoadingStart) {
    return true;
  } else if (action is LoadingEnd) {
    return false;
  } else {
    return loading;
  }
}
