class CancelOfferResponse {
  final String message;

  CancelOfferResponse({required this.message});

  factory CancelOfferResponse.fromJson(Map<String, dynamic> json) {
    return CancelOfferResponse(
      message: json['message'] ,
    );
  }


}
