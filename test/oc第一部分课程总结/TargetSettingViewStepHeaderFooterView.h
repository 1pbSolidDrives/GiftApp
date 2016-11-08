//
//  TargetSettingViewStepHeaderFooterView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/8.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TargetSettingViewStepHeaderFooterView;

@protocol TargetSettingViewStepHeaderFooterViewProtocol <NSObject>

-(void)stepCellEditAct:(UIButton*)sender;

@end

@interface TargetSettingViewStepHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,strong)id<TargetSettingViewStepHeaderFooterViewProtocol>delegate;

@end
