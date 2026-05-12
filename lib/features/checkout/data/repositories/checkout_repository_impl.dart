import 'package:suregift_test/core/utils/data/guarded_datasource_calls.dart';
import 'package:suregift_test/features/checkout/data/datasources/checkout_remote_datasource.dart';
import 'package:suregift_test/features/checkout/data/models/checkout_result_model.dart';
import 'package:suregift_test/features/checkout/domain/repositories/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;

  CheckoutRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CheckoutResult> checkout() => guardedApiCall<CheckoutResult>(
        () => remoteDataSource.checkout(),
        source: 'CheckoutRepositoryImpl.checkout',
      );
}

