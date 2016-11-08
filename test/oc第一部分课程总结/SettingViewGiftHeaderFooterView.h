//
//  SettingViewGiftHeaderFooterView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SettingViewGiftHeaderView.h"

@class SettingViewGiftHeaderFooterView;

@protocol SettingViewGiftHeaderFooterViewProtocol <NSObject>

-(void)settingViewGiftHeaderFooterViewProtocolGiftEditButtonAct:(UIButton*)sender;
-(void)settingViewGiftHeaderFooterViewProtocolAddGift:(UIButton*)sender;

@end

@interface SettingViewGiftHeaderFooterView : UITableViewHeaderFooterView

//@property(nonatomic,strong)SettingViewGiftHeaderView* SettingViewGiftHeaderview;
@property(nonatomic,strong)id<SettingViewGiftHeaderFooterViewProtocol>delegate;

@end
