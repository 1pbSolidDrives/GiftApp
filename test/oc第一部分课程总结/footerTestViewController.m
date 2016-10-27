//
//  footerTestViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/26.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "footerTestViewController.h"
#import "Home2ViewController.H"

static NSString* headerFooterIdentify = @"targetHeaderFooter";
static NSString* cellIdentify = @"cell";

@interface footerTestViewController ()

@end

@implementation footerTestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMyself];
    [self initTableView];
    // Do any additional setup after loading the view.
}

-(void)initMyself{
    self.title = @"进度条";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DataController* dataBuf = [DataController getInstence] ;
    
    NSMutableArray* stepsModel = dataBuf.stepCellMaster[section];
    NSMutableArray* giftsModel = dataBuf.giftMaster[section];

    NSInteger rows = stepsModel.count + giftsModel.count;
    
    
    return rows;
}
//设置行高 这个可以自动实现
//设置组数

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    DataController* dataBuf = [DataController getInstence] ;
    
    return dataBuf.stepCellMaster.count;
}
//设置组高
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 50;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 107;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}
//头部点击事件代理
/*
 目前点击事件需要传送给controller的也就是切换页面需要
 
 */
-(void)teaderFooterView:(TargetHeaderFooterView *)sender PressIdentify:(NSInteger)tag{
    
}

//设置footer 设置头部分组视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //初始化头部视图
    NSLog(@"------------%li",section);
    TargetHeaderFooterView* targetFooterViewBuf;
    targetFooterViewBuf = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentify];
    if (targetFooterViewBuf == nil) {
        targetFooterViewBuf = [[TargetHeaderFooterView alloc]initWithReuseIdentifier:headerFooterIdentify];
    }
    //获取headerfooter数据
    DataController* dataBuf = [DataController getInstence] ;

    HeaderModel* headerFooterBuf = dataBuf.headerFooterMaster[section];
    //初始化footerview
    [targetFooterViewBuf initTargetView:headerFooterBuf];
    
    return targetFooterViewBuf;
}

//设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    DataController* dataBuf = [DataController getInstence] ;

     if (indexPath.row == 0) {
        //初始化giftcell 第一个版本只有一个giftcell
         //疑问 如果 不同类型的cell 用了同一个id会怎么样？
         GiftCellTableViewCell* giftCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
         if(giftCell == nil){
             giftCell = [[[NSBundle mainBundle]loadNibNamed:@"GiftCellTableViewCell" owner:nil options:nil]firstObject];
         }
         cell = giftCell;
    }
    else{
        //初始化stepcell
        BodyTableViewCell *stepCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (stepCell == nil) {
            stepCell = [[[NSBundle mainBundle] loadNibNamed:@"BodyTableViewCell" owner:nil options:nil] firstObject];
        }
        
        NSMutableArray* stepCellMaster = dataBuf.stepCellMaster;
        StepModle* stepBuf = stepCellMaster[indexPath.section][indexPath.row - 1];// 由于是跟gift分开着的 所以要减一
        stepCell.tag = indexPath.row;
        stepCell.delegate = self;
        stepCell.myIndexPath = indexPath;
        
        [stepCell initAllView:stepBuf];
     
        cell = (UITableViewCell *)stepCell;
    }

    return cell;
}

//--------------------------cell代理-----------------------------
//**step代理
//切换到设置页面
-(void)bodyTableViewCellPressForOpenSetView:(BodyTableViewCell *)sender{
    NSLog(@"切换页面啊");
    Home2ViewController *fvc = [[Home2ViewController alloc] init];
    fvc.view.backgroundColor = [UIColor blueColor];
    [self.navigationController pushViewController:fvc animated:YES];
}
//点击打开子节点
-(void)bodyTableViewCell:(BodyTableViewCell *)sender PressForOpenSonsteps:(NSInteger)tag{
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: sender.myIndexPath.section  ] withRowAnimation:UITableViewRowAnimationNone];
}
//gift代理
-(void)giftCellTableViewCellPressAct:(GiftCellTableViewCell *)sender andTag:(const NSInteger)tag{
    
}
//=----------------------初始化tableView
-(void)initTableView{
    if (self.tableView == nil) {
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        
        self.tableView.dataSource       = self;
        self.tableView.delegate         = self;
        [self.view addSubview:self.tableView];
    }
}

@end
