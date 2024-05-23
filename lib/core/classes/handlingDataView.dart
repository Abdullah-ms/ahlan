import 'package:ahlan/core/classes/statusRequest.dart';
import 'package:flutter/material.dart';
import '../constants/assetsImages.dart';
import '../constants/colors.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          )
        : statusRequest == StatusRequest.offline
            ? const Center(
                child: Text('offline : Check WiFi'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Text('Error : Server Failure'),
                  )
                : statusRequest == StatusRequest.noData
                    ? Text('No Data')
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;

  final Widget widget;

  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          )
        : statusRequest == StatusRequest.offline
            ? const Center(
                child: Text('offline : Check WiFi'),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Text('Error : Server Failure'),
                  )
                : widget;
  }
}
