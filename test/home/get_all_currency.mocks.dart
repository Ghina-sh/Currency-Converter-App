// Mocks generated by Mockito 5.4.4 from annotations
// in kib_challenge/test/home/get_all_currency.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:kib_challenge/core/data_sources/models/base_response/base_response.dart'
    as _i2;
import 'package:kib_challenge/features/home/data/data_sources/home_remote_data_source.dart'
    as _i3;
import 'package:kib_challenge/features/home/data/models/currencies_country_model.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBaseResponse_0<T> extends _i1.SmartFake
    implements _i2.BaseResponse<T> {
  _FakeBaseResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSourceImpl extends _i1.Mock
    implements _i3.HomeRemoteDataSourceImpl {
  MockHomeRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<_i5.CurrenciesCountriesModel>>
      getCurrenciesCountry() => (super.noSuchMethod(
            Invocation.method(
              #getCurrenciesCountry,
              [],
            ),
            returnValue: _i4
                .Future<_i2.BaseResponse<_i5.CurrenciesCountriesModel>>.value(
                _FakeBaseResponse_0<_i5.CurrenciesCountriesModel>(
              this,
              Invocation.method(
                #getCurrenciesCountry,
                [],
              ),
            )),
          ) as _i4.Future<_i2.BaseResponse<_i5.CurrenciesCountriesModel>>);
}
