class TabViewState {
  final bool isLoading;
  final bool hasError;
  final List<dynamic> data;
  final int currentPage;

  TabViewState({
    required this.isLoading,
    required this.hasError,
    required this.data,
    required this.currentPage,
  });

  factory TabViewState.initial() {
    return TabViewState(
      isLoading: false,
      hasError: false,
      data: [],
      currentPage: 1,
    );
  }

  TabViewState copyWith({
    bool? isLoading,
    bool? hasError,
    List<dynamic>? data,
    int? currentPage,
  }) {
    return TabViewState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      data: data ?? this.data,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}