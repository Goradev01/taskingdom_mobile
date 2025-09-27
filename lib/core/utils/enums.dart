

enum LoadState {loading,idle,success,error,loadmore,done}
enum HomeSessionState { logout, initial }
enum OverLayType { loader, message, none }
enum MessageType { error, success }

enum FormType{
  create, update
}
enum TaskFilter { all, completed, pending,inprogress }
extension TaskFilterExtension on TaskFilter{
  String get title{
    switch(this){
      case TaskFilter.all:
        return 'All';
      case TaskFilter.inprogress:
        return 'In Progess';
      case TaskFilter.completed:
        return 'Completed';
      case TaskFilter.pending:
        return 'Pending';
    }
  }
}

extension FormTypeExtension on FormType{
  String get title{
    switch(this){
      case FormType.create:
        return 'Create Tournament';
      case FormType.update:
        return 'Edit Tournament';
    }
  }
  bool get isCreate => this == FormType.create;
  bool get isUpdate => this == FormType.update;
}

extension LoadExtension on LoadState {
  bool get isLoading => this == LoadState.loading;
  bool get isLoaded => this == LoadState.success;
  bool get isError => this == LoadState.error;
  bool get isInitial => this == LoadState.idle;
  bool get isLoadMore => this == LoadState.loadmore;
  bool get isCompleted => this == LoadState.done;
}
