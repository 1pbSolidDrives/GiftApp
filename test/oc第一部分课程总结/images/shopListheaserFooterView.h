//
//  shopListheaserFooterView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class shopListheaserFooterView;

@protocol shopListheaserFooterViewProtocol <NSObject>

-(void)shopListheaserFooterViewSearchAct:(shopListheaserFooterView*)sender;

@end

@interface shopListheaserFooterView : UITableViewHeaderFooterView
@property(nonatomic,strong)UILabel* shopNameLabel;
@property(nonatomic,strong)UILabel* searchGitText;

@property(nonatomic,strong)NSString* searchURL;
@property(nonatomic,strong)NSString* shopName;

@property(nonatomic,strong)id<shopListheaserFooterViewProtocol>delegate;
-(void)initView:(NSString* )shopName searchUrl:(NSString*)searchUrl;
@end
