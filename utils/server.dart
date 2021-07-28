// import 'dart:io';

// import 'package:dia/dia.dart';
// import 'package:dia_body/dia_body.dart';
// import 'package:dia_cors/dia_cors.dart';
// import 'package:dia_router/dia_router.dart';
// import 'package:dia_static/dia_static.dart';

// class ContextWithRoutingBody extends Context with Routing, ParsedBody {
//   ContextWithRoutingBody(HttpRequest request) : super(request);
// }

// void main() {
//   final app = App((request) => ContextWithRoutingBody(request));

//   app.use(cors());
//   app.use(body());
//   app.use(serve('H:/code/images', prefix: '/static'));
//   app.use(genRouter().middleware);

//   app.listen('127.0.0.1', 9999).then((value) => print('Server starting...'));
// }

// Router genRouter() {
//   final router = Router('/');
//   router.get('/home', (ctx, next) async {
//     ctx.body = 'hello';
//   });
//   return router;
// }
