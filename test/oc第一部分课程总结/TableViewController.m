//
//  TableViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/20.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "ViewC1.h"
#import "Masonry.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initArray];
    NSLog(@"%f",self.view.frame.size.height);
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //添加tableview
    [self.view addSubview:_tableView];
    
    self.view.backgroundColor = [UIColor blackColor];
    //-----导航控制器相关
    self.title = @"哈哈哈";
    self.navigationItem.title =@"你好";
    
//    添加按钮 itembar
    UIBarButtonItem* bar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = bar;
    
    UIImage* image = [[UIImage alloc]initWithContentsOfFile:@"0111.png"];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(20, 20, 20, 20);
    
    UILabel* label1= [[UILabel alloc]init];
    label1.text = @"hahah";
    label1.textAlignment = NSTextAlignmentCenter;
    UIBarButtonItem* barRight = [[UIBarButtonItem alloc]initWithCustomView:label1];
    NSArray* bars = [NSArray arrayWithObjects:bar,barRight ,nil];
    self.navigationItem.rightBarButtonItems = bars;
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
//    self.navigationItem.rightBarButtonItem = barRight;
//    开启工具栏
    self.navigationController.toolbar.translucent = NO;
    self.navigationController.toolbarHidden = NO;
    //工具栏颜色
    self.navigationController.toolbar.barTintColor = [UIColor yellowColor];
    
    UIBarButtonItem* bar1 = [[UIBarButtonItem alloc]initWithTitle:@"woshi sb" style:UIBarButtonItemStylePlain target:nil action:nil];
    bar1.tintColor = [UIColor blackColor];
    UIBarButtonItem* bar2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    UIBarButtonItem* bar3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    UIBarButtonItem* bar4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:nil];
    //固定距离占位
    UIBarButtonItem* bar5 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    bar5.width = 10;
    //自动距离占位
    UIBarButtonItem* bar6 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //添加方式 只要放在 两个按钮中间就可以了
    NSArray* array = [NSArray arrayWithObjects:bar1,bar6,bar2,bar6,bar3,bar6,bar4,nil];
    
    self.toolbarItems = array;
 }

-(void)pressLeft{
    NSLog(@"hhahah");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
//tableview必须要实现的方法
/*
 1， 设置（获取）tableview的行数
 返回值是行数
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return (NSInteger)[_array count];
}

//还可以设置分组 当然跟 sections 分组

//设置cell  tableview 的核心 tableview上每一行实例（不知道怎么说就说实例吧）都与这个函数有关
/*
 p1 tableview实例
 p2 indexpath 行 分组 都有它传送
 
 内部：
    1，声明一个静态的tag 是一个字符串 相当于这个cell的id
    2，创建一个cell 所有行都是根据这个为模版创建的 （表单元） 作用是只给正在显示的 表单元分配资源
    3，其实并不知道这部分是什么意思 有机会问下球球吧 为什么呢？ 网上查只是说跟复用相关 但是具体流程不太清楚 可能需要了解内部的一些代理的东西吧
 
 
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* singleCellId=@"singleCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:singleCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:singleCellId];
    }
    cell.textLabel.text = _array[indexPath.row];
    //添加图片 图片也是 cell的属性之一
    UIImage* image = [UIImage imageNamed:@"0111.png"];
    cell.imageView.image = image;
    return cell;
}
//这里就是即将被选中时调用的方法
//其他的cell相关的响应函数似乎都指望着这个return呢 所以如果返回nil
//那么其他的调用方法就不管用了 也就是说
//这个函数时 在cell被选中前作用的 相当于提供点击的索引
//作用：用于禁止或者 修改用户的点击操作
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hahah%ld",(long)indexPath.row);
    return indexPath;
}
//被选中之后调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"哈哈哈 我被点中了%ld",(long)indexPath.row);
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    
    //detailVc.context = ((NSArray *)_dataSource[_sortedKeys[indexPath.section]])[indexPath.row];
    UIView* view = [[UIView alloc]initWithFrame:self.view.bounds];
    
    ViewC1* c1 = [[ViewC1 alloc]init];
    
    [self.navigationController pushViewController:c1 animated:YES];
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  70;
}

-(void)initArray{
    _array = [[NSMutableArray alloc]init];
    for (int i=1; i<=10; i++) {
        
        NSString* buffer = [NSString stringWithFormat:@"A %d",i];
        [_array addObject:buffer];
    }
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
