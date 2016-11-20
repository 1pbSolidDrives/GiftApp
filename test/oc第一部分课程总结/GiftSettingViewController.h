//
//  GiftSettingViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
@interface GiftSettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *shopListView;
@property (weak, nonatomic) IBOutlet UIWebView *shopWebView;
@property (nonatomic) BOOL shopListIsShow;
@property (weak, nonatomic) IBOutlet UIView *maskView;

@property (weak, nonatomic) IBOutlet UITableView *shopListTableView;


//数据相关
@property (nonatomic,strong)NSMutableArray* shopSearchUrlList;//商城搜索地址
@property (nonatomic,strong)NSMutableArray* shopList;//gift数据
@property (nonatomic,strong)NSString* giftName;


@end
