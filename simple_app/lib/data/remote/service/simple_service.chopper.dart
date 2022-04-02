// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SimpleService extends SimpleService {
  _$SimpleService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SimpleService;

  @override
  Future<Response<List<Comments>>> getComments() {
    final $url = 'comments';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<Comments>, Comments>($request);
  }
}
