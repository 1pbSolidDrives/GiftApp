//
//  footerTestViewController.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/26.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetHeaderFooterView.h"
#import "DataController.h"
#import "BodyTableViewCell.h"
#import "GiftCellTableViewCell.h"
@interface footerTestViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource,
TargetHeaderFooterViewProtocol,
BodyTableViewCellProtocol,
GiftCellTableViewCellProtocol
>

@property(strong,nonatomic)TargetHeaderFooterView* targetFooterView;
@property(strong,nonatomic)UITableView* tableView;

@end
