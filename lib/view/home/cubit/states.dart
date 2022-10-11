abstract class HomeStates{}
class InitHomeState extends HomeStates{}

class LoadingPlantsState extends HomeStates{}
class SuccessPlantsState extends HomeStates{}
class ErrorPlantsState extends HomeStates{
  String error;
  ErrorPlantsState(this.error);
}

class LoadingSeedsState extends HomeStates{}
class SuccessSeedsState extends HomeStates{}
class ErrorSeedsState extends HomeStates{
  String error;
  ErrorSeedsState(this.error);
}

class LoadingToolsState extends HomeStates{}
class SuccessToolsState extends HomeStates{}
class ErrorToolsState extends HomeStates{
  String error;
  ErrorToolsState(this.error);
}

class LoadingProductsState extends HomeStates{}
class SuccessProductsState extends HomeStates{}
class ErrorProductsState extends HomeStates{
  String error;
  ErrorProductsState(this.error);
}
class SuccessInsertState extends HomeStates{}
class ErrorInsertState extends HomeStates{
  String error;
  ErrorInsertState(this.error);
}
class GetProductState extends HomeStates{}
class DeleteProductState extends HomeStates{}
class UpdateProductState extends HomeStates{}

class IncreaseState extends HomeStates{}
class DecreaseState extends HomeStates{}

class SearchALLState extends HomeStates{}
class TotalPriceState extends HomeStates{}