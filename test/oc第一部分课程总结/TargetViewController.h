//
//  TargetViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetModel.h"
#import "SettingViewGiftHeaderFooterView.h"

#import "TargetViewDelegates.h"

#import "TargetSettingViewAddGiftTableViewCell.h"

@class TargetViewController;

@protocol TargetViewControllerProtocol <NSObject>

-(void)TargetViewControllerProtocolSaveData;

@end

@interface TargetViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
TargetSettingViewAddGiftTableViewCellUpdataProtocol,
SettingViewGiftHeaderProtocol
>


@property(nonatomic,strong) UITableView* tableView;
@property(nonatomic,strong) TargetModel* targetModel;
//cell 用的数据

@property(nonatomic,strong)NSMutableArray* cellsModel;
//代理

@property(nonatomic,strong)TargetViewDelegates* delegatesMaster;

@property(nonatomic,strong)id<TargetViewControllerProtocol> delegate;
@end
