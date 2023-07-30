import 'package:cart_demo/feature/home/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';


abstract class TabViewCubit extends Cubit<TabViewState> {
  final ApiService apiService;

  TabViewCubit({required this.apiService}) : super(TabViewState.initial()) {
    loadMore();
  }

  Future<List<dynamic>> fetchData(int page);

  void loadMore() {
    if (state.isLoading || state.hasError) return;
    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoading: true));
    fetchData(nextPage).then((data) {
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        data: [...state.data, ...data],
        currentPage: nextPage,
      ));
    }).catchError((error) {
      emit(state.copyWith(isLoading: false, hasError: true));
    });
  }
}

