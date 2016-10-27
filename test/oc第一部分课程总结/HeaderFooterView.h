//
//  HeaderFooterView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTools.h"

@class HeaderFooterView;

@protocol HeaderFooterViewProtocol <NSObject>

-(void)headerFooterView:(HeaderFooterView*)sender PressIdentify :(NSInteger)tag;

@end

@interface HeaderFooterView : UITableViewHeaderFooterView
{
    UIImageView* _headerImageView;   //targetImagePath
    UILabel* _headerLabel;           //targetText
 }
@property(nonatomic,weak) id<HeaderFooterViewProtocol> delegate;
@property(strong, nonatomic) DataTools* dataTools;

-(void)initAllViewData;
@end
