//
//  HeaderView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/21.
//  Copyright © 2016年 sanghonglu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeaderView;

@protocol headerViewProtocol<NSObject>

-(void)headerView : (HeaderView*)sender didSelectedWithTag:(NSInteger)tag;//目录索引点击事件协议


@end


@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong) UILabel* headerText;//标题
@property(nonatomic,strong) UIImageView* headerImage;//头部图片

@property(nonatomic,weak)id<headerViewProtocol> delegate;//代理



@end

