//
//  TargetSettingViewStepHeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/8.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetSettingViewStepHeaderFooterView.h"
#import "Masonry.h"
@implementation TargetSettingViewStepHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]){
        
        if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
            
            self.textLabel.text = @"Step";
            
            UIButton* editButton = [[UIButton alloc]init ];
            editButton.backgroundColor = [UIColor clearColor];
            [editButton setTitle:@"编辑" forState:UIControlStateNormal];
            [editButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [editButton addTarget:self action:@selector(editButtonAct:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:editButton];
            
            [editButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_right).offset(-50-20 );
                make.right.equalTo(self.contentView.mas_right).offset(-20 );
                make.top.equalTo(self.contentView.mas_top).offset(3 );
                make.bottom.equalTo(self.contentView.mas_bottom).offset(-3 );
            }];
        }
    }
    
    return self;
}
-(void)editButtonAct:(id)sender{
    //修改显示文字
    UIButton* edit = (UIButton*)sender;
    if ([edit.titleLabel.text isEqualToString:@"编辑"]) {
        [edit setTitle:@"完成" forState:UIControlStateNormal];
    }
    else if ([((UIButton*)sender).titleLabel.text isEqualToString:@"完成"]){
        [edit setTitle:@"编辑" forState:UIControlStateNormal];
    }
    if (_delegate && [_delegate conformsToProtocol:@protocol(TargetSettingViewStepHeaderFooterViewProtocol) ]) {
        [_delegate stepCellEditAct:sender];
    }
}
@end
