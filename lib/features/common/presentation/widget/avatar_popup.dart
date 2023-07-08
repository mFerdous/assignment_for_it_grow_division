// import 'package:flutter/material.dart';

// import '../../../profile_info/presentation/cubit/profile_info_cubit.dart';

// class AvatarPopup extends StatefulWidget {
//   @override
//   _AvatarPopupState createState() => _AvatarPopupState();
// }

// class _AvatarPopupState extends State<AvatarPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       itemBuilder: (BuildContext context) {
//         return [
//           const PopupMenuItem(
//             child: Text('Option 1'),
//           ),
//           PopupMenuItem(
//             child: IconButton(
//               icon: Icon(
//                 Icons.logout,
//               ),
//               onPressed: () async {
//                       await context
//                           .read<ProfileInfoApiCubit>()
//                           .profileInfo(valState.getProfileInfoRequestModel());},
//             ),
//           ),
//           // Add more menu options as needed
//         ];
//       },
//       child: const CircleAvatar(
//         child: Icon(Icons.person),
//       ),
//     );
//   }
// }
