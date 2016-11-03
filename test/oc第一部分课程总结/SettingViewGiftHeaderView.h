//
//  SettingViewGiftHeaderView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/2.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* deleteButtonIsShow = @"NO";
@class SettingViewGiftHeader;

@protocol SettingViewGiftHeaderProtocol <NSObject>

-(void)SettingViewGiftHeaderPressAction:(NSInteger)tag;

@end

@interface SettingViewGiftHeaderView : UIView

@property(nonatomic,strong)id<SettingViewGiftHeaderProtocol>delegate;
//@property (strong, nonatomic) NSString* deleteButtonIsShow;

@property (weak, nonatomic) IBOutlet UIButton *addGiftButton;
@property (weak, nonatomic) IBOutlet UIButton *edit;

- (IBAction)addGiftButtonAct:(id)sender;
- (IBAction)editButtonAct:(id)sender;

@end
