import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

/// TODO: bloc 로그인 기능
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.go(RoutePath.home);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/svg/main_logo.svg')),
      /// TODO: 하드 코딩된 백그라운드 컬러 수정 필요
      backgroundColor: Color(0xFF5F0080),
    );
  }
}