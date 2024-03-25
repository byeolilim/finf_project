import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FindFinfMain extends StatefulWidget {
  const FindFinfMain({super.key});

  @override
  State<FindFinfMain> createState() => _FindFinfMainState();
}

class DayNumber {
  final String day;
  final int number;

  DayNumber(this.day, this.number);
}

class Buddy {
  final dynamic profile;
  final String level;
  final String training;
  final String title;
  final String location;
  final String time;
  final bool classroom;
  final int people;
  final int limitedNumber;
  final bool favorites;

  Buddy({
    this.profile,
    required this.level,
    required this.training,
    required this.title,
    required this.location,
    required this.time,
    required this.classroom,
    required this.people,
    required this.limitedNumber,
    required this.favorites,
  });
}

class _FindFinfMainState extends State<FindFinfMain> {
  final List<DayNumber> dayNumbers = [
    DayNumber('월', 1),
    DayNumber('화', 2),
    DayNumber('수', 3),
    DayNumber('목', 4),
    DayNumber('금', 5),
    DayNumber('토', 6),
    DayNumber('일', 7),
  ];

  final List<Buddy> buddyList = [
    Buddy(
      profile: null,
      level: "LV2",
      training: "펀다이빙",
      title: "같이 프리다이빙할 핀프 구해요!",
      location: "용인 딥 스테이션",
      time: "9:00",
      classroom: true,
      people: 17,
      limitedNumber: 20,
      favorites: false,
    ),
  ];

  String? selectedDay;
  String? selectedLevel;
  String? selectedTraining;
  bool proceeding = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          width: screenWidth,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
        ),
        calendar(),
        filterButton(screenWidth),
        BuddyRoomList(screenWidth: screenWidth),
      ],
    );
  }

  Container filterButton(double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      width: screenWidth - 32.0,
      height: 40.0,
      child: Row(
        children: [
          // 선호 레벨 필터
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    double modalHeightPercentage =
                        MediaQuery.of(context).size.height *
                            0.55 /
                            MediaQuery.of(context).size.height;
                    return LevelFilter(
                      modalHeightPercentage: modalHeightPercentage,
                      selectedLevel: selectedLevel,
                      onLevelSelected: (level) {
                        setState(() {
                          selectedLevel = level;
                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                );
              },
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: null,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(
                        color: selectedLevel != null
                            ? const Color(0xFF52B6EC)
                            : Colors.black,
                        width: 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        selectedLevel ?? '선호 레벨',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: selectedLevel != null
                              ? const Color(0xFF52B6EC)
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down,
                          color: selectedLevel != null
                              ? const Color(0xFF52B6EC)
                              : Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 트레이닝 용도 필터
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    double modalHeightPercentage =
                        MediaQuery.of(context).size.height *
                            0.8 /
                            MediaQuery.of(context).size.height;
                    return TrainingFilter(
                      modalHeightPercentage: modalHeightPercentage,
                      selectedTraining: selectedTraining,
                      onTrainingSelected: (training) {
                        setState(() {
                          selectedTraining = training;
                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                );
              },
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(
                        color: selectedTraining != null
                            ? const Color(0xFF52B6EC)
                            : Colors.black,
                        width: 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        selectedTraining ?? '트레이닝 용도',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: selectedTraining != null
                              ? const Color(0xFF52B6EC)
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down,
                          color: selectedTraining != null
                              ? const Color(0xFF52B6EC)
                              : Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 진행중만 선택 버튼
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  proceeding = !proceeding;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  side: BorderSide(
                    color: proceeding ? const Color(0xFF52B6EC) : Colors.black,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      '진행중만',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: proceeding
                              ? const Color(0xFF52B6EC)
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //날짜 선택
  Container calendar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 가로 스크롤 설정
        child: Row(
          children: dayNumbers.map((dayNumber) {
            final bool isClicked = selectedDay == dayNumber.day;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 65.0, // Adjusted width
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (selectedDay == dayNumber.day) {
                      selectedDay = null;
                    } else {
                      selectedDay = dayNumber.day;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (isClicked) {
                        return const Color(0xFF52B6EC);
                      }
                      return Colors.white;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      // 글씨 색을 변경
                      if (isClicked) {
                        return Colors.white;
                      } else {
                        return Colors.black;
                      }
                    },
                  ),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.grey[300]!),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                      (Set<MaterialState> states) {
                    return BorderSide.none;
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isClicked ? 30.0 : 0),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayNumber.day,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${dayNumber.number}",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BuddyRoomList extends StatelessWidget {
  const BuddyRoomList({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      width: screenWidth - 32.0,
      height: 550.0,
      decoration: BoxDecoration(
        color: Colors.yellow[300],
      ),
    );
  }
}

//트레이닝 용도 위젯
class TrainingFilter extends StatelessWidget {
  const TrainingFilter({
    super.key,
    required this.modalHeightPercentage,
    required this.selectedTraining,
    required this.onTrainingSelected,
  });

  final double modalHeightPercentage;
  final String? selectedTraining;
  final Function(String?) onTrainingSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * modalHeightPercentage,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 26.0, left: 24.0, right: 24.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '트레이닝 용도 선택',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/svg_icons/closeModal_btn.svg',
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              buildLevelButton('모든 트레이닝', context, selectedTraining == null,
                  () => onTrainingSelected(null)),
              buildDividerText('LV1-2', context),
              buildLevelButton('프렌젤', context, selectedTraining == '프렌젤',
                  () => onTrainingSelected('프렌젤')),
              buildLevelButton('스테틱', context, selectedTraining == '스테틱',
                  () => onTrainingSelected('스테틱')),
              buildLevelButton('레스큐', context, selectedTraining == '레스큐',
                  () => onTrainingSelected('레스큐')),
              buildLevelButton('다이나믹', context, selectedTraining == '다이나믹',
                  () => onTrainingSelected('다이나믹')),
              buildLevelButton('덕다이빙', context, selectedTraining == '덕다이빙',
                  () => onTrainingSelected('덕다이빙')),
              buildLevelButton('CWT', context, selectedTraining == 'CWT',
                  () => onTrainingSelected('CWT')),
              buildLevelButton('FIM', context, selectedTraining == 'FIM',
                  () => onTrainingSelected('FIM')),
              buildLevelButton('머메이드', context, selectedTraining == '머메이드',
                  () => onTrainingSelected('머메이드')),
              buildDividerText('LV3', context),
              buildLevelButton('중성부력', context, selectedTraining == '중성부력',
                  () => onTrainingSelected('중성부력')),
              buildLevelButton('프리폴', context, selectedTraining == '프리폴',
                  () => onTrainingSelected('프리폴')),
              buildDividerText('LV4', context),
              buildLevelButton('마우스필', context, selectedTraining == '마우스필',
                  () => onTrainingSelected('마우스필')),
              buildLevelButton('FRC다이빙', context, selectedTraining == 'FRC다이빙',
                  () => onTrainingSelected('FRC다이빙')),
            ],
          ),
        ],
      ),
    );
  }

  // 레벨 구분 및 구분선 위젯 (트레이닝 용도에서만 사용함)
  Widget buildDividerText(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 26.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            flex: 4,
            child: Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

//선호레벨 위젯
class LevelFilter extends StatelessWidget {
  final double modalHeightPercentage;
  final String? selectedLevel;
  final void Function(String?) onLevelSelected;

  const LevelFilter({
    super.key,
    required this.modalHeightPercentage,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * modalHeightPercentage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 26.0, left: 24.0, right: 24.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '선호 레벨 선택',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/svg_icons/closeModal_btn.svg',
                      height: 24.0,
                      width: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            buildLevelButton(
              '모든 레벨',
              context,
              selectedLevel == null,
              () => onLevelSelected(null),
            ),
            buildLevelButton(
              '강습방',
              context,
              selectedLevel == '강습방',
              () => onLevelSelected('강습방'),
            ),
            buildLevelButton(
              'LV.1 이상',
              context,
              selectedLevel == 'LV.1 이상',
              () => onLevelSelected('LV.1 이상'),
            ),
            buildLevelButton(
              'LV.2 이상',
              context,
              selectedLevel == 'LV.2 이상',
              () => onLevelSelected('LV.2 이상'),
            ),
            buildLevelButton(
              'LV.3 이상',
              context,
              selectedLevel == 'LV.3 이상',
              () => onLevelSelected('LV.3 이상'),
            ),
            buildLevelButton(
              'LV.4 이상',
              context,
              selectedLevel == 'LV.4 이상',
              () => onLevelSelected('LV.4 이상'),
            ),
          ],
        ),
      ),
    );
  }
}

//선호레벨과 트레이닝 용도 필터에 공통으로 사용되는 버튼 위젯
Widget buildLevelButton(
  String text,
  BuildContext context,
  bool isSelected,
  VoidCallback onTap,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 26.0),
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Colors.grey : Colors.transparent,
        ),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                isSelected ? BorderRadius.circular(8.0) : BorderRadius.zero,
            side: BorderSide(
              color: isSelected ? Colors.grey : Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: isSelected
                  ? const Color.fromARGB(255, 231, 231, 231)
                  : Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
