//
//  Home2ViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "Home2ViewController.h"



@interface Home2ViewController ()


@end

@implementation Home2ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initAllView];
    UITableView *table;
    
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData{
    
    _dataTools = [[DataTools alloc]init];
 
    _plistPath = [_dataTools plistPath];
    _plistData = [_dataTools plistData];
}

-(void)initAllView{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-64) style:UITableViewStylePlain];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [_tableview setEditing:YES animated:YES];
    // 这样做没有单元格的表 就不会有分割线了
    _tableview.tableFooterView = [[UIView alloc]init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"奖励 app";
    [self.view addSubview:_tableview];

}

// 设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _plistData.count;
}
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 152;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 36;
}
//单元格 初始化
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identify = @"TestTableViewCellID2";
    Home3TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"Home3TableViewCell" owner:nil options:nil]firstObject];
    }
    [cell setMyIndexPath:indexPath];
    NSLog(@"cellForRowAtIndexPath tag = %ld",cell.tag);
    [cell initAllReacurce];

    return cell;
}
//表头初始化
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString* identify = @"headerview";

    HeaderFooterView* headerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identify];
    if (headerview == nil) {
        headerview = [[HeaderFooterView alloc]initWithReuseIdentifier:identify];
    }
    //设置表头tag
    headerview.tag = section;
    [headerview initAllViewData];
    
    headerview.delegate = self;
    //代理似乎可以多对一发送 不能 一对多发送
    return headerview;
    
}

//表头点击事件
- (void)headerFooterView:(HeaderFooterView *)sender PressIdentify:(NSInteger)tag{
    NSLog(@"我被点击了！！");
    NSLog(@"%@",sender.contentView.backgroundColor);//这个是一个模板 如果改这个 所有的头 都会改
    sender.contentView.backgroundColor = [UIColor redColor];
    NSLog(@"%ld",tag);
    
    [[DataTools getInstence]setDataValue:@"sb" ForSection:tag OfRow:0 TheKey:@"targetHeaderName"];


    [_tableview reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[DataTools getInstence]setDataValue:@"sb"
                              ForSection:indexPath.section
                                   OfRow:indexPath.row+1
                                  TheKey:@"whereGift"];
    
    [_tableview reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
}




@end
