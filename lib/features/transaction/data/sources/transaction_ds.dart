import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:quick_send/shared/constants/url_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'transaction_ds.g.dart';

@RestApi()
abstract class TransactionDatasource {
  factory TransactionDatasource(Dio dio, {required String baseUrl}) =
      _TransactionDatasource;

  @POST(KUrl.send)
  Future sendTransaction({
    @Field('sender_id') required String senderId,
    @Field('amount') required double amount,
  });

  @GET(KUrl.getAllTransaction)
  @Headers({'Content-Type': 'application/json', 'accept': 'application/json'})
  Future getAllTransaction({@QueryParam('sender_id') required String senderId});
}
