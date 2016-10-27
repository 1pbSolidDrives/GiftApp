//
//  TargetHeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetHeaderFooterView.h"

@implementation TargetHeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        
        _footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil] firstObject];
        
        //初始化所有视图
        _footerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [self.contentView addSubview:_footerView];
        //创建触摸事件
        
        self.contentView.backgroundColor = [UIColor blueColor];
        self.layer.borderWidth = 0.34;
        self.layer.borderColor = [UIColor redColor].CGColor;

        
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTapGestureRecognizer:)];
        [self.contentView addGestureRecognizer:tapRecognizer];
    }
    return self;
}

-(void)pressTapGestureRecognizer:(UITapGestureRecognizer*)sender{
    if (_delegate && [_delegate conformsToProtocol:@protocol(TargetHeaderFooterViewProtocol)]) {
        [_delegate teaderFooterView:self PressIdentify:self.tag];
    }
}

-(void)initTargetView:(HeaderModel*)headerModel{
    UIImage* targetImage = [UIImage imageNamed:headerModel.targetHeaderImagePath];
    _footerView.targetImage.image = targetImage;
    _footerView.targetNameLabel.text = headerModel.targetHeaderName;  
}





@end
