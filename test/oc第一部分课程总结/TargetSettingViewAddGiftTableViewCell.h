//
//  TargetSettingViewAddGiftTableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@class TargetViewController;
@class TargetSettingViewAddGiftTableViewCell;

@protocol TargetSettingViewAddGiftTableViewCellUpdataProtocol <NSObject>

-(void)targetSettingViewAddGiftTableViewCellUpdataProtocol:(TargetSettingViewAddGiftTableViewCell*)sender updataModelAndTabelView:(GiftModel*)myData;

@end

@interface TargetSettingViewAddGiftTableViewCell : UITableViewCell

//shopListView
@property(strong,nonatomic)NSMutableArray* shopListViews;
@property(strong,nonatomic)GiftModel* myData;
@property(strong,nonatomic)id<TargetSettingViewAddGiftTableViewCellUpdataProtocol>delegate;

@property (weak, nonatomic) IBOutlet UITextField *giftName;

- (IBAction)addShopInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteMeButton;
- (IBAction)deleteMeButtonAct:(UIButton *)sender;
- (IBAction)giftNameTextFieldChanged:(UITextField *)sender;
- (IBAction)giftNameTextFieldEnd:(UITextField *)sender;

-(void)initAllView:(GiftModel*)giftData;

@end
