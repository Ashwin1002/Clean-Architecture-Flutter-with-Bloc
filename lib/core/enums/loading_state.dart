enum LoadingState {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == LoadingState.initial;
  bool get isLoading => this == LoadingState.loading;
  bool get isSuccess => this == LoadingState.success;
  bool get isFailure => this == LoadingState.failure;
}
