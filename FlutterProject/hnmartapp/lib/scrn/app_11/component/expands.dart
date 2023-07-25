import 'package:flutter/material.dart';

///
/// ExCol/Row 는 다음 3가지 위젯의 속성을 모두 가진다
/// Expanded, Container, Column/Row
/// 다만 child 관련 속성은 위젯 형태의 특성상 가장 내부 위젯인 Column/Row의 children 속성만 받게 된다.
/// * 사용시 children 중 특정 부분에서 overflow가 생기는 경우, ExCol/ExRow의 각 children 위젯마다 최외단에 Container로 감싸서 해결한 부분이 있음.
/// 

Widget ExCol({
  // Expanded Attributes
  int flex = 1,
  // Container Attributes
  AlignmentGeometry? alignment,
  EdgeInsetsGeometry? padding,
  Color? color,
  Decoration? decoration,
  Decoration? foregroundDecoration,
  double? width,
  double? height,
  BoxConstraints? constraints,
  EdgeInsetsGeometry? margin,
  Matrix4? transform,
  AlignmentGeometry? transformAlignment,
  Clip clipBehavior = Clip.none,
  // Column Attributes
  required List<Widget> children,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection? textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline? textBaseline,
  
  }) {
  return Expanded(
    flex: flex,
    child: Container(
      alignment:alignment,
      padding:padding,
      color:color,
      decoration:decoration,
      foregroundDecoration:foregroundDecoration,
      width:width,
      height:height,
      constraints:constraints,
      margin:margin,
      transform:transform,
      transformAlignment:transformAlignment,
      clipBehavior:clipBehavior,
      child: Column(
        mainAxisAlignment:mainAxisAlignment,
        mainAxisSize:mainAxisSize,
        crossAxisAlignment:crossAxisAlignment,
        textDirection:textDirection,
        verticalDirection:verticalDirection,
        textBaseline:textBaseline,
        children: children,
      ),
    ),
  );
}

Widget ExRow({
  // Expanded Attributes
  int flex = 1,
  // Container Attributes
  AlignmentGeometry? alignment,
  EdgeInsetsGeometry? padding,
  Color? color,
  Decoration? decoration,
  Decoration? foregroundDecoration,
  double? width,
  double? height,
  BoxConstraints? constraints,
  EdgeInsetsGeometry? margin,
  Matrix4? transform,
  AlignmentGeometry? transformAlignment,
  Clip clipBehavior = Clip.none,
  // Row Attributes
  required List<Widget> children, 
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection? textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline? textBaseline,
}) {
  return Expanded(
    flex: flex,
    child: Container(
      alignment:alignment,
      padding:padding,
      color:color,
      decoration:decoration,
      foregroundDecoration:foregroundDecoration,
      width:width,
      height:height,
      constraints:constraints,
      margin:margin,
      transform:transform,
      transformAlignment:transformAlignment,
      clipBehavior:clipBehavior,
      child: Row(
        mainAxisAlignment:mainAxisAlignment,
        mainAxisSize:mainAxisSize,
        crossAxisAlignment:crossAxisAlignment,
        textDirection:textDirection,
        verticalDirection:verticalDirection,
        textBaseline:textBaseline,
        children: children,
      ),
    ),
  );
}
