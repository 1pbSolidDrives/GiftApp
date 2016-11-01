//
//  TargetSetingViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/27.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
//@class TargetSetingViewController;
//
//@protocol targetSetingViewControllerProtocol <NSObject>
//
////保存相关
////通知target保存
//-(NSMutableDictionary*)targetSetingViewControllerProtocolSaveActionToTarget;
////通知gift保存
//-(NSMutableDictionary*)targetSetingViewControllerProtocolSaveActionToGift;
////通知step保存
//-(NSMutableDictionary*)targetSetingViewControllerProtocolSaveActionToStep;
//
//@end

@interface TargetSetingViewController : UIViewController
///<
//UITableViewDelegate,
//UITableViewDataSource
//>

//-(instancetype)init:(TargetModel*)targetModel;


@property(nonatomic,strong)TargetModel* targetModel;

@end
