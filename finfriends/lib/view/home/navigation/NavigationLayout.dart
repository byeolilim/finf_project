// NavigationLayout.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationLayout extends StatefulWidget {
  final Function(int) onPageChanged; // 콜백 추가
  final int currentIndex;

  const NavigationLayout({
    super.key,
    required this.onPageChanged,
    required this.currentIndex,
  });

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  void _changePage(int index) {
    widget.onPageChanged(index); // 콜백 호출
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬로 변경
          children: [
            _buildIconButton(
              '핀프찾기',
              widget.currentIndex == 0
                  ? 'assets/svg_icons/findFinfIcon_on.svg'
                  : 'assets/svg_icons/findFinfIcon_off.svg',
              0,
            ),
            const SizedBox(width: 30), // 아이콘 사이 간격 추가
            _buildIconButton(
              '내 버디방',
              widget.currentIndex == 1
                  ? 'assets/svg_icons/chatIcon_on.svg'
                  : 'assets/svg_icons/chatIcon_off.svg',
              1,
            ),
            const SizedBox(width: 110), // 아이콘 사이 간격 추가
            _buildIconButton(
              '트레이닝',
              widget.currentIndex == 3
                  ? 'assets/svg_icons/trainingIcon_on.svg'
                  : 'assets/svg_icons/trainingIcon_off.svg',
              3,
            ),
            const SizedBox(width: 30), // 아이콘 사이 간격 추가
            _buildIconButton(
              '내 정보',
              widget.currentIndex == 4
                  ? 'assets/svg_icons/userIcon_on.svg'
                  : 'assets/svg_icons/userIcon_off.svg',
              4,
            ),
          ],
        ));
  }

  Widget _buildIconButton(String label, String svgPath, int index) {
    Color textColor;
    if (label == "트레이닝") {
      textColor = widget.currentIndex == index
          ? const Color(0xFFF76A68)
          : const Color(0xFFCDD2DA);
    } else {
      textColor = widget.currentIndex == index
          ? const Color(0xFF52B6EC)
          : const Color(0xFFCDD2DA);
    }

    return GestureDetector(
      onTap: () => _changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgPath,
            height: 26,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 7),
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
