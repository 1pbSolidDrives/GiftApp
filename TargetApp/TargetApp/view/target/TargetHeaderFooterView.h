//
//  TargetHeaderFooterView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FooterView.h"
#import "HeaderModel.h"

@class TargetHeaderFooterView;
@protocol TargetHeaderFooterViewProtocol<NSObject>

-(void)teaderFooterView:(TargetHeaderFooterView*)sender PressIdentify :(NSInteger)tag;

@end

@interface TargetHeaderFooterView : UITableViewHeaderFooterView
{

}
//显示的view
@property(strong, nonatomic)FooterView* footerView;

@property(nonatomic,weak) id<TargetHeaderFooterViewProtocol> delegate;

//初始化目标footerView
-(void)initTargetView: (HeaderModel*)headerModel;



@end
