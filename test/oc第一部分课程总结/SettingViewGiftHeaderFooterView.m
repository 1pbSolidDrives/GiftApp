//
//  SettingViewGiftHeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "SettingViewGiftHeaderFooterView.h"

@implementation SettingViewGiftHeaderFooterView
//初始化的东西 加载xibview需要先加载 初始化数据单写
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
    
        _SettingViewGiftHeaderview = [[[NSBundle mainBundle]loadNibNamed:@"SettingViewGiftHeader" owner:nil options:nil]firstObject];
        [self.contentView addSubview:_SettingViewGiftHeaderview];
        _SettingViewGiftHeaderview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
    
    }
    return self;
}

@end
