abstract class ForumsStates{}
class InitForumState extends ForumsStates{}
class ToggleForumState extends ForumsStates{}

class GetAllPostsSuccessState extends ForumsStates{}
class GetAllPostsLoadingState extends ForumsStates{}
class GetAllPostsErrorState extends ForumsStates{
  String error;
  GetAllPostsErrorState(this.error);
}

class SuccessPickImageState extends ForumsStates{}
class ErrorPickImageState extends ForumsStates{}

class AddPostsSuccessState extends ForumsStates{}
class AddPostsLoadingState extends ForumsStates{}
class AddPostsErrorState extends ForumsStates{
  String error;
  AddPostsErrorState(this.error);
}

class GetMyPostsSuccessState extends ForumsStates{}
class GetMyPostsLoadingState extends ForumsStates{}
class GetMyPostsErrorState extends ForumsStates{
  String error;
  GetMyPostsErrorState(this.error);
}

class LikeSuccessState extends ForumsStates{}
class LikeLoadingState extends ForumsStates{}
class LikeErrorState extends ForumsStates{
  String error;
  LikeErrorState(this.error);
}
class ChangeLikeState extends ForumsStates{}

class DetailsPostSuccessState extends ForumsStates{}
class DetailsPostLoadingState extends ForumsStates{}
class DetailsPostErrorState extends ForumsStates{
  String error;
  DetailsPostErrorState(this.error);
}

class CommentSuccessState extends ForumsStates{}
class CommentLoadingState extends ForumsStates{}
class CommentErrorState extends ForumsStates{
  String error;
  CommentErrorState(this.error);
}

class SearchState extends ForumsStates{}