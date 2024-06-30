import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight/src/common/utils/extensions/context_extension.dart';
import 'package:insight/src/common/widgets/shimmer.dart';
import 'package:insight/src/features/profile/bloc/profile_bloc.dart';
import 'package:insight/src/features/profile/bloc/profile_state.dart';
import 'package:insight/src/features/profile/widget/components/avatar_widget.dart';

/// {@template profile_widget}
/// ProfileWidget widget.
/// {@endtemplate}
class ProfileWidget extends StatelessWidget {
  /// {@macro profile_widget}
  const ProfileWidget({
    super.key,
    required this.onPressed,
    required this.onEditPressed,
  });

  final VoidCallback onPressed;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: ShapeDecoration(
        color: context.colorScheme.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.hasData) {
            final user = state.data!;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onPressed,
              child: Row(
                children: [
                  AvatarWidget(
                    user.avatarUrl,
                    size: Size.square(size.shortestSide * .15),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.fullName),
                      Text(
                        user.email,
                        style: context.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onEditPressed,
                    icon: const Icon(Icons.edit),
                  )
                ],
              ),
            );
          }
          return const _BodySkeleton();
        },
      ),
    );
  }
}

class _BodySkeleton extends StatelessWidget {
  const _BodySkeleton();

  @override
  Widget build(BuildContext context) => const Row(
        children: [
          Shimmer(size: Size(60, 60), cornerRadius: 100),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer(size: Size(128, 28)),
              SizedBox(height: 8),
              Shimmer(size: Size(144, 24)),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.edit),
          )
        ],
      );
}
