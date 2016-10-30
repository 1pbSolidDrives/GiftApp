//
//  UITableViewHeaderFooterUIView.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITableViewHeaderFooterUIView;

@protocol UITableViewHeaderFooterUIViewProtocol <NSObject>

-(void)uITableViewHeaderFooterUIViewAddAction : (UITableViewHeaderFooterUIView*)sender;

@end


@interface UITableViewHeaderFooterUIView : UIView
@property (weak, nonatomic) IBOutlet UILabel *headerName;
@property (strong,nonatomic)id<UITableViewHeaderFooterUIViewProtocol>delegate;

- (IBAction)addAct:(id)sender;

@end
