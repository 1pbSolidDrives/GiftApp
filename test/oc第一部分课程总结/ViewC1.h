//
//  ViewC1.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/18.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewC1 : UIViewController
<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeft;
@property (weak, nonatomic) IBOutlet UITextField *textUsername;
@property (weak, nonatomic) IBOutlet UITextField *textPassWord;
@property (weak, nonatomic) IBOutlet UIButton *logInbutton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)loginButtonAct:(id)sender;
- (IBAction)registerButtonAct:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scoleView1;
@property (weak, nonatomic) IBOutlet UIButton *buttonBiger;
- (IBAction)buttonBigerAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *uiView01;
@property (weak, nonatomic) IBOutlet UIView *uiView02;
@property (weak, nonatomic) IBOutlet UIView *uiView03;
@property (weak, nonatomic) IBOutlet UIView *uiView04;
@property (weak, nonatomic) IBOutlet UIView *uiView05;
@property (weak, nonatomic) IBOutlet UIView *uiViewSuper;

@end
