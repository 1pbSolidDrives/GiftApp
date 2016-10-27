//
//  ocToJs.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/19.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ocToJs : UIViewController
<
UIWebViewDelegate
>
@property (weak, nonatomic) IBOutlet UIButton *changeButton;
- (IBAction)changeButtonAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *jsToOcButton;
@property (weak, nonatomic) IBOutlet UILabel *jsText;

@end
