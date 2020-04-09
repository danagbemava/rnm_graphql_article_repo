import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rnm_graphql/services/graphql_service.dart';

class GraphQlServiceImpl extends Mock implements GraphQLService {}

main() {
  test('should respond if connection created successfully', () async {
    final service = GraphQLService();

    String query = r'''
    query {
      characters (page: 1) {
        info {
          count
          pages
        }
        results {
          name
          id
        }
      }
    }
    ''';

    final result = await service.performQuery(query);

    expect(result.data['characters']['info']['count'], 493);
  });
}
