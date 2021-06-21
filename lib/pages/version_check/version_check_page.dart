import 'package:app_review/app_review.dart';
import 'package:calculate/enums/update_request_type.dart';
import 'package:calculate/pages/home/home_page.dart';
import 'package:calculate/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VersionCheck extends ConsumerWidget {
  Future<void> _showUpdateDialog(
    BuildContext context,
    UpdateRequestType requestType,
  ) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          // AndroidのBackボタンで閉じられないようにする
          onWillPop: () async => false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 320,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '最新の更新があります。\nアップデートをお願いします。',
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (requestType == UpdateRequestType.cancelable)
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                minimumSize: Size(120, 44),
                                primary: Colors.grey.shade200,
                              ),
                              child: const Text('キャンセル'),
                            ),
                          if (requestType == UpdateRequestType.cancelable)
                            const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () async {
                              await AppReview.storeListing;
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              minimumSize: Size(120, 44),
                            ),
                            child: const Text('アップデート'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateRequest = ref.watch(updateRequestProvider);
    return Scaffold(
      body: updateRequest.when(
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, _) {
          return Center(
            child: Text('$error'),
          );
        },
        data: (requestType) {
          WidgetsBinding.instance!.addPostFrameCallback(
            (_) {
              if (requestType != UpdateRequestType.not) {
                _showUpdateDialog(context, requestType);
              }
            },
          );

          return Home();
        },
      ),
    );
  }
}
