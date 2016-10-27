//
//  HeaderView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/21.
//  Copyright © 2016年 sanghonglu. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

//从父类那里继承过来的 自己的初始化函数 这个函数的意思就是重用时的那个东西
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    //如果父类的存在这个类似的实例
//    也可能是加载的时候加载了一个 具体不清楚
    if ((self = [super initWithReuseIdentifier:reuseIdentifier]) ) {
        //设置这个头部的颜色
        self.contentView.backgroundColor = [UIColor blueColor];
        //设置边界线的颜色
        self.layer.borderWidth = 0.34;
        //边界线的颜色
        self.layer.borderColor = [UIColor blueColor].CGColor;
        //添加控件
        UIView * uiview = [[UIView alloc]init];
        uiview.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:uiview];
        [self.contentView addSubview:[self getLable]];
        
        //添加触碰事件
        UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressBegan:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

-(void)pressBegan:(UITapGestureRecognizer*)recgnizer{
    if (_delegate&& [_delegate conformsToProtocol:@protocol(headerViewProtocol)]) {
        [_delegate headerView:self didSelectedWithTag:self.tag];
    }
}


#pragma getters  控件
//头部的图片
-(UIImageView*)getImageView{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]init];
        _headerImage.bounds = CGRectMake(0, 0, 20, 20);
        //设置锚点
        _headerImage.center = CGPointMake(15, 22);
        _headerImage.image = [[UIImage alloc]initWithContentsOfFile:@"apple.jpg"];
        
    }
    return _headerImage;
}
//头部的文字
-(UILabel*)getLable{
    if (!_headerText) {
        _headerText = [[UILabel alloc]init];
        _headerText.bounds = CGRectMake(0, 0, 200, 30);
        _headerText.center = CGPointMake(CGRectGetMaxX(self.headerImage.frame) + CGRectGetMidX(_headerText.bounds) + 10, 22);
        _headerText.font = [UIFont boldSystemFontOfSize:18];

    }
    return _headerText;
}




@end
