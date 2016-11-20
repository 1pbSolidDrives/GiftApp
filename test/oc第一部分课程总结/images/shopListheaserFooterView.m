//
//  ;
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "shopListheaserFooterView.h"
#import "Masonry.h"

@implementation shopListheaserFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)initView:(NSString* )shopName searchUrl:(NSString*)searchUrl{
    _shopName = shopName;
    _searchURL = searchUrl;
    [_shopNameLabel setText: _shopName];
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _shopNameLabel = [[UILabel alloc]init];
        [_shopNameLabel setText:@"京东"];
        [self.contentView addSubview:_shopNameLabel];
        
        [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_left).offset(150 );
            make.top.equalTo(self.contentView.mas_top).offset(3 );
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3 );

        }];
        
        _searchGitText= [[UILabel alloc]init];
        [_searchGitText setText:@"进入商城搜索" ];
        _searchGitText.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_searchGitText];
        [_searchGitText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_right).offset(-200);
            make.right.equalTo(self.contentView.mas_right).offset(-10 );
            make.top.equalTo(self.contentView.mas_top).offset(3 );
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-3 );
            
        }];
        
        UIView* tachView = [[UIView alloc]init];
        [tachView setBackgroundColor:[UIColor clearColor]];
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchGift)];
        [tachView addGestureRecognizer:singleTap];
        
        
        [self.contentView addSubview:tachView];
        [tachView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView).offset(0);
            make.top.bottom.equalTo(self.contentView).offset(0);
            
        }];
    }
    
    return self;
}

-(void)searchGift{
    if (_delegate && [_delegate conformsToProtocol:@protocol(shopListheaserFooterViewProtocol) ]) {
        [_delegate shopListheaserFooterViewSearchAct:self];
    }
    NSLog(@"进入搜索商品");
}

@end
