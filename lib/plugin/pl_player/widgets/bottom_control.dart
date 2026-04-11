import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/plugin/pl_player/index.dart';
import 'package:pilipala/utils/feed_back.dart';

class BottomControl extends StatelessWidget implements PreferredSizeWidget {
  final PlPlayerController? controller;
  final Function? triggerFullScreen;
  final List<Widget>? buildBottomControl;
  const BottomControl({
    this.controller,
    this.triggerFullScreen,
    this.buildBottomControl,
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Color colorTheme = Theme.of(context).colorScheme.primary;
    final ctrl = controller!;
    return Container(
      color: Colors.transparent,
      height: 90,
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(() {
            final int value = ctrl.sliderPositionSeconds.value;
            final int max = ctrl.durationSeconds.value;
            final int buffer = ctrl.bufferedSeconds.value;
            if (value > max || max <= 0) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 6),
              child: ProgressBar(
                progress: Duration(seconds: value),
                buffered: Duration(seconds: buffer),
                total: Duration(seconds: max),
                progressBarColor: colorTheme,
                baseBarColor: Colors.white.withValues(alpha: 0.2),
                bufferedBarColor: colorTheme.withValues(alpha: 0.4),
                timeLabelLocation: TimeLabelLocation.none,
                thumbColor: colorTheme,
                barHeight: 3.5,
                thumbRadius: 7,
                onDragStart: (duration) {
                  feedBack();
                  ctrl.onChangedSliderStart();
                },
                onDragUpdate: (duration) {
                  ctrl.onUpdatedSliderProgress(duration.timeStamp);
                },
                onSeek: (duration) {
                  ctrl.onChangedSliderEnd();
                  ctrl.onChangedSlider(duration.inSeconds.toDouble());
                  ctrl.seekTo(
                    Duration(seconds: duration.inSeconds),
                    type: 'slider',
                  );
                },
              ),
            );
          }),
          Row(children: [...buildBottomControl!]),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
