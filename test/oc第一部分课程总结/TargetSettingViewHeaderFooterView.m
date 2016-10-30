//
//  TargetSettingViewHeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/29.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewHeaderFooterView.h"

@implementation TargetSettingViewHeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _upView = [[[NSBundle mainBundle] loadNibNamed:@"TargetSettingViewHeaderView" owner:self options:nil] firstObject];
        [self.contentView addSubview:_upView];
    }
    
    return self;
}

@end
