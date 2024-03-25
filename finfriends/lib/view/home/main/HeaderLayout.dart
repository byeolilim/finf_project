import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderLayout extends StatelessWidget implements PreferredSizeWidget {
  const HeaderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF52B6EC),
      title: const Text(
        "FINFRIENDS",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.string(
            '''
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M7.06448 4.76426C8.38112 3.63015 10.1572 3 12 3C13.8428 3 15.6189 3.63015 16.9355 4.76426C18.2538 5.89978 19.0049 7.45033 19.0049 9.07809V11.8547C19.0049 12.0259 19.1028 12.2154 19.2913 12.3604C19.8954 12.8248 21 13.8461 21 15.2224V15.4992C21 16.8809 19.8141 18 18.3527 18H5.64732C4.18589 18 3 16.8809 3 15.4992V15.2224C3 13.8461 4.10456 12.8248 4.70865 12.3604C4.89721 12.2154 4.99505 12.0259 4.99505 11.8547V9.07809C4.99505 7.45033 5.7462 5.89978 7.06448 4.76426ZM9.5 19C8.94772 19 8.5 19.4477 8.5 20C8.5 20.5523 8.94772 21 9.5 21H14.5C15.0523 21 15.5 20.5523 15.5 20C15.5 19.4477 15.0523 19 14.5 19H9.5Z" fill="#4A515F"/>
            <path d="M6.14658 8.02797C6.5876 6.14787 8.05559 4.67988 9.93569 4.23887C11.2935 3.92038 12.7065 3.92038 14.0643 4.23887C15.9444 4.67988 17.4124 6.14788 17.8534 8.02797C18.1719 9.38575 18.1719 13.7988 17.8534 15.1566C17.4124 17.0367 15.9444 15.5047 14.0643 15.9457C12.7065 16.2642 11.2935 16.2642 9.93569 15.9457C8.05559 15.5047 6.5876 17.0367 6.14658 15.1566C5.82809 13.7988 5.82809 9.38575 6.14658 8.02797Z" stroke="#4A515F" stroke-width="2"/>
            </svg>

            ''',
          ),
          onPressed: () {
            // onPressed 로직
          },
        ),
        IconButton(
          icon: SvgPicture.string(
            '''
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M4.29406 8.95869C4.83698 6.64417 6.64417 4.83698 8.95869 4.29406C10.6302 3.90198 12.3698 3.90198 14.0413 4.29406C16.3558 4.83698 18.163 6.64417 18.7059 8.9587C19.098 10.6302 19.098 12.3698 18.7059 14.0413C18.163 16.3558 16.3558 18.163 14.0413 18.7059C12.3698 19.098 10.6302 19.098 8.9587 18.7059C6.64418 18.163 4.83698 16.3558 4.29406 14.0413C3.90198 12.3698 3.90198 10.6302 4.29406 8.95869Z" stroke="#4A515F" stroke-width="2"/>
            <path d="M17.2476 17.2476L20 20" stroke="#4A515F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            ''',
          ),
          onPressed: () {
            // onPressed 로직
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
