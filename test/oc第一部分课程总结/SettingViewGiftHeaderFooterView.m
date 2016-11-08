//
//  SettingViewGiftHeaderFooterView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "SettingViewGiftHeaderFooterView.h"
#import "Masonry.h"
@implementation SettingViewGiftHeaderFooterView
//初始化的东西 加载xibview需要先加载 初始化数据单写
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
    
        self.textLabel.text = @"Gift";
        
        UIButton* editButton = [[UIButton alloc]init ];
        editButton.backgroundColor = [UIColor clearColor];
        [editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [editButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //editButton.titleLabel.textColor = [UIColor blueColor];
        [editButton addTarget:self action:@selector(editButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:editButton];

        [editButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_right).offset(-50-20 );
            make.right.equalTo(self.contentView.mas_right).offset(-20 );
            make.top.equalTo(self.contentView.mas_top).offset(3 );
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3 );
        }];
        
        UIButton* addButton = [[UIButton alloc]init ];
        addButton.backgroundColor = [UIColor clearColor];
        [addButton setTitle:@"添加" forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //editButton.titleLabel.textColor = [UIColor blueColor];
        [addButton addTarget:self action:@selector(addButtonAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:addButton];
        
        [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_right).offset(-50-10-50-20 );
            make.right.equalTo(self.contentView.mas_right).offset(-10-50-20 );
            make.top.equalTo(self.contentView.mas_top).offset(3 );
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3 );
        }];
    }
    return self;
}

-(void)addButtonAct:(id)sender{
    if (_delegate && [_delegate conformsToProtocol:@protocol(SettingViewGiftHeaderFooterViewProtocol) ]) {
        [_delegate settingViewGiftHeaderFooterViewProtocolAddGift:sender];
    }
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
    if (_delegate && [_delegate conformsToProtocol:@protocol(SettingViewGiftHeaderFooterViewProtocol) ]) {
        [_delegate settingViewGiftHeaderFooterViewProtocolGiftEditButtonAct:sender];
    }
}


@end
