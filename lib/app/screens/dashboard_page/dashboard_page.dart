import 'package:demo_pro/app/screens/dashboard_page/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardController _dashBoardController=Get.find<DashBoardController>();
   
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _dashBoardController,
      initState: (_) {
        _dashBoardController.fetchImages();
      },
      builder: (_) {
        return SafeArea(
            top: true,
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h,),
              Text("Api Fetch",style: TextStyle(
                color: Colors.black,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold
              ),),
              Divider(),
              SizedBox(height: 8.h,),
              Expanded(
                child: _dashBoardController.listUnsplashRes.length <= 0 ? SizedBox() : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    itemCount: _dashBoardController.listUnsplashRes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15))
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)),
                          child: Image.network(
                            _dashBoardController.listUnsplashRes[index].urls?.regular ?? "",fit: BoxFit.cover,),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                    }),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
