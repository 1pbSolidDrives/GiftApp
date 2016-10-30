//
//  UITableViewHeaderFooterUIView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "UITableViewHeaderFooterUIView.h"

@implementation UITableViewHeaderFooterUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addAct:(id)sender {
    if (_delegate && [_delegate conformsToProtocol:@protocol(UITableViewHeaderFooterUIViewProtocol)]) {
        [_delegate uITableViewHeaderFooterUIViewAddAction:self];
    }
}
@end
