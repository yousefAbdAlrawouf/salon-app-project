

class BookingState {
  bool? isLoading;
  final String? error;
  bool canEdit = false; 
  bool canceledListTile = false;
   bool availableToWork;



  

  BookingState(
      {this.error,  this.isLoading = false,required this.canEdit,required this.canceledListTile,required this.availableToWork});

  BookingState copyWith({
    bool? isLoading,
    String? error,
    bool? canEdit,
    bool? canceledListTile,
    bool? availableToWork
  }) {
    return BookingState(
      error: error,
      isLoading: isLoading ?? false,
      canEdit: canEdit ?? false,
      canceledListTile: canceledListTile ?? false,
      availableToWork: availableToWork ?? false
    );
  }
}
