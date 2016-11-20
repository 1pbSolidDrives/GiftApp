//
//  GiftSettingViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/28.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "GiftSettingViewController.h"
#import "shopListTableViewCell.h"
#import "shopListheaserFooterView.h"
@interface GiftSettingViewController ()
<UIWebViewDelegate,
UITableViewDelegate,
UITableViewDataSource,
shopListheaserFooterViewProtocol
>

@end

@implementation GiftSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initWebView];
    [self initItem];
    [self initShopListView];
    [self initMaskView];
}
#pragma mark - 初始化

#pragma mark 外部传输数据

-(void)setData:(NSString *)giftName setShopList:(NSMutableArray *)shopList{
    _giftName = giftName;
    _shopList = shopList;
}

#pragma mark  初始化 数据
-(void)initData{
    //初始化商城搜索数据
    _shopSearchUrlList = [[NSMutableArray alloc]init];
    _shopSearchUrlList = [[DataController getInstence]shopSearchList];
    //----------测试用
    _giftName = @"iphone7";
}

#pragma mark  初始化item

-(void)initItem{
    UIBarButtonItem* browseItem = [[UIBarButtonItem alloc]initWithTitle:@"显示List" style:UIBarButtonItemStylePlain target:self action:@selector(showWebViewList)];
    self.navigationItem.rightBarButtonItem = browseItem;
    
    self.navigationController.toolbarHidden = NO;
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"后退", @"刷新", @"停止", @"前进"]];
    segmentedControl.frame = CGRectMake(0, 0, 170, 30);
    segmentedControl.tintColor = [UIColor clearColor];
    
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [segmentedControl addTarget:self action:@selector(respondsToSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *segmentedItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    self.toolbarItems = @[flexibleItem, segmentedItem, flexibleItem];

}

#pragma mark 初始化mask
-(void)initMaskView{
    UITapGestureRecognizer* maskTach = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showWebViewList)];
    [_maskView addGestureRecognizer:maskTach];
}

#pragma mark 初始化商城列表

-(void)initShopListView{
    _shopListIsShow = NO;
    self.shopListView.frame = CGRectMake(self.shopListView.frame.origin.x +self.shopListView.frame.size.width,
                                         self.shopListView.frame.origin.y,
                                         self.shopListView.frame.size.width,
                                         self.shopListView.frame.size.height);
    
    [self initShopListTableView];
}

#pragma mark - 初始化商城列表——tableview

-(void)initShopListTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.shopListTableView.dataSource       = self;
    self.shopListTableView.delegate         = self;
    self.shopListTableView.tableFooterView = [[UIView alloc]init];
    
}
#pragma mark 初始化cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"shopListCell"];

    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"shopListTableViewCell" owner:nil options:nil]firstObject];
        //初始化cell
        
    }
    
    return cell;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
//选中Cell响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
}
//行缩进
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    return row;
}
#pragma mark 初始化header
//头文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return @"";
}
//头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = nil;
    static NSString* identify = @"shopListHeader";

    headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identify];
    if (headerView == nil) {
        
        shopListheaserFooterView* shopHeaderView =[[shopListheaserFooterView alloc]initWithReuseIdentifier:identify];
        [shopHeaderView initView:_shopSearchUrlList[section][@"shopName"] searchUrl:_shopSearchUrlList[section][@"searchURL"]];
        shopHeaderView.delegate = self;
        headerView = shopHeaderView;
    }
    return headerView;
}
////组高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _shopSearchUrlList.count;
}


#pragma mark - 是否显示商城列表 回调
-(void)showWebViewList{
    [UIView animateWithDuration:0.5 animations:^{
        NSInteger shopListViewx ;
        if (_shopListIsShow) {
            shopListViewx =self.shopListView.frame.origin.x +self.shopListView.frame.size.width;
            _shopListIsShow = NO;
            _maskView.alpha = 0;

        }
        else{
            shopListViewx =self.shopListView.frame.origin.x -self.shopListView.frame.size.width;
            _shopListIsShow=YES;
            _maskView.hidden = NO;
            _maskView.alpha = 0.5;
        }
        self.shopListView.frame = CGRectMake(shopListViewx,
                                             self.shopListView.frame.origin.y,
                                             self.shopListView.frame.size.width,
                                             self.shopListView.frame.size.height);
    } completion:^(BOOL finished) {
        //finished判断动画是否完成
        if (finished) {
            if (!_shopListIsShow) _maskView.hidden = YES;


            
            //刷新listView
            NSLog(@"finished");
        }
    }];
}




#pragma mark - 底部工具栏回调

- (void)respondsToSegmentedControl:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
            // 返回
        case 0:[_shopWebView goBack];break;
            // 加载
        case 1:
        {
            [_shopWebView reload];
        }
            break;
            // 停止加载
        case 2:[_shopWebView stopLoading];break;
            // 前进
        case 3:[_shopWebView goForward];break;
        default:
            break;
    }
}
#pragma mark - 初始化webView
-(void)initWebView{
        // 初始化网页视图

        // 配置URL：http:// +...
        NSURL *url = [NSURL URLWithString:@"https://baidu.com"];
        
        // 创建请求
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // 自动对页面进行缩放以适应屏幕
        _shopWebView.scalesPageToFit = YES;
        
        // 自动检测网页上的电话号码，单击可以拨打
        // _webView.detectsPhoneNumbers = YES;
        
        // 加载网页
        [_shopWebView loadRequest:request];
        
        // 设置代理
        _shopWebView.delegate = self;
        
        // 设置是否回弹
        _shopWebView.scrollView.bounces = NO;
//        [self.view addSubview:_shopWebView];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);

}

// 是否允许开始加载
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

// 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
//    _completeView = webView;
}

// 加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    
    
}
#pragma mark - 自定义代理
#pragma mark 商城搜索事件代理
-(void)shopListheaserFooterViewSearchAct:(shopListheaserFooterView *)sender{
    [self showWebViewList];
    //加载新的搜索框
    
    NSURL *url = [NSURL URLWithString:[self setGiftNameInSearchURL:sender.searchURL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_shopWebView loadRequest:request];
    
}

-(NSString*)setGiftNameInSearchURL:(NSString*)searchURL{
    NSString* newString= [searchURL stringByReplacingOccurrencesOfString: @"{gift}"withString:_giftName];
    return newString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
