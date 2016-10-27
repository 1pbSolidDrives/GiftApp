//
//  ViewC1.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/18.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "ViewC1.h"
#import "Masonry.h"
@interface ViewC1 ()


@end

@implementation ViewC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest* url = [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://www.baidu.com"]];
    [_webView loadRequest:url];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    // 2、配置加载请求
    // 注意：网络资源地址必须以“http://”开头；
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    // 3、加载数据
    [webView loadRequest:request];
    
    _scoleView1.contentSize = CGSizeMake(_scoleView1.frame.size.width, _scoleView1.frame.size.height*5);
    
    // 4、添加网页视图
    //[self.view addSubview:webView];
    
    
    //masnory
//    [_uiView01 mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//    }];
    [_uiView01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.uiViewSuper);
        make.height.width.mas_equalTo(50);
    }];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.uiViewSuper);
        make.width.height.mas_equalTo(100);
    }];
    
    self.labelLeft.constant = 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonAct:(id)sender {
    
}

- (IBAction)registerButtonAct:(id)sender {
}
- (IBAction)buttonBigerAct:(UIButton *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    _uiViewSuper.frame = CGRectMake(_uiViewSuper.frame.origin.x, _uiViewSuper.frame.origin.y, _uiViewSuper.frame.size.width+30, _uiViewSuper.frame.size.height+100);
    [UIView commitAnimations];
    
}
@end
