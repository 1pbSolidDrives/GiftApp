//
//  ocToJs.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/19.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "ocToJs.h"

@interface ocToJs ()

@end

@implementation ocToJs

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载本地html文件
    NSString* path =[[NSBundle mainBundle]bundlePath];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSString* htmlPath = [[NSBundle mainBundle]pathForResource:@"myFirstJS" ofType:@"html"];
    NSString* htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:htmlCont baseURL:url];
    
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    _webView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self addCustomAtions];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self addCustomAtions];
}
-(void)addCustomAtions{
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [self setCh:context];
}

-(void)setCh:(JSContext*)context{
    context[@"alert"] = ^(){
        NSArray *args = [JSContext currentArguments];
        NSLog(@"%@",args[0]);

        return @"发送的是1";
        
    };
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeButtonAct:(UIButton *)sender {
}
@end
