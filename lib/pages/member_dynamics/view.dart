import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilipala/pages/member_dynamics/index.dart';
import 'package:pilipala/utils/utils.dart';

import '../../common/widgets/http_error.dart';
import '../../models/dynamics/result.dart';
import '../dynamics/widgets/dynamic_panel.dart';

class MemberDynamicsPage extends StatefulWidget {
  const MemberDynamicsPage({super.key});

  @override
  State<MemberDynamicsPage> createState() => _MemberDynamicsPageState();
}

class _MemberDynamicsPageState extends State<MemberDynamicsPage> {
  late MemberDynamicsController _memberDynamicController;
  late Future _futureBuilderFuture;
  late ScrollController scrollController;
  late int mid;

  @override
  void initState() {
    super.initState();
    mid = int.parse(Get.parameters['mid']!);
    final String heroTag = Utils.makeHeroTag(mid);
    _memberDynamicController = Get.put(
      MemberDynamicsController(),
      tag: heroTag,
    );
    _futureBuilderFuture = _memberDynamicController.getMemberDynamic(
      'onRefresh',
    );
    scrollController = _memberDynamicController.scrollController;
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        EasyThrottle.throttle(
          'member_dynamics',
          const Duration(milliseconds: 1000),
          () {
            _memberDynamicController.onLoad();
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _memberDynamicController.scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: Text('他的动态', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: CustomScrollView(
        controller: _memberDynamicController.scrollController,
        slivers: [
          FutureBuilder(
            future: _futureBuilderFuture,
            builder: (context, snapshot) {
              // 1. 数据还在加载中，返回空的占位 Sliver
              if (snapshot.connectionState != ConnectionState.done) {
                return const SliverToBoxAdapter();
              }

              // 2. 发生网络错误或底层异常
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: HttpError(
                    errMsg: '请求失败: ${snapshot.error}',
                    fn: () => setState(() {
                      _futureBuilderFuture = _memberDynamicController
                          .getMemberDynamic('onRefresh');
                    }),
                  ),
                );
              }

              // 3. 正常获取到响应，但数据为空
              if (snapshot.data == null) {
                return SliverToBoxAdapter(
                  child: HttpError(
                    errMsg: '获取动态失败，数据为空',
                    fn: () => setState(() {
                      _futureBuilderFuture = _memberDynamicController
                          .getMemberDynamic('onRefresh');
                    }),
                  ),
                );
              }

              // 4. 数据成功解析
              Map data = snapshot.data as Map;
              RxList<DynamicItemModel> list =
                  _memberDynamicController.dynamicsList;

              if (data['status'] == true) {
                return Obx(
                  () => list.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return DynamicPanel(item: list[index]);
                          }, childCount: list.length),
                        )
                      : SliverToBoxAdapter(
                          child: Container(
                            height: 300,
                            alignment: Alignment.center,
                            child: const Text('暂无动态'),
                          ),
                        ),
                );
              } else {
                // 5. 接口返回业务错误
                return SliverToBoxAdapter(
                  child: HttpError(
                    errMsg: data['msg'] ?? '未知错误',
                    fn: () => setState(() {
                      _futureBuilderFuture = _memberDynamicController
                          .getMemberDynamic('onRefresh');
                    }),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
