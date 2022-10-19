import '../../../Helpers/base_url.dart';
import '../../../Library/api_request.dart';
import '../../../Models/church.dart';

class ChurchsProvider {
  void getPostsList({
    Function()? beforeSend,
    Function(List<Church> church)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: BaseURL.church, data: null).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!((data as List)
            .map((churchJson) => Church.fromJson(churchJson))
            .toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
