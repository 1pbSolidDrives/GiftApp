//
//  TargetViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetViewController.h"
#import "TargetSettingViewHeaderFooterView.h"
#import "TargetListCellTableViewCell.h"
#import "TargetSettingViewAddGiftButtonTableViewCell.h"
#import "TargetSettingViewAddGiftTableViewCell.h"
#import "TargetSettingViewTargetTableViewCell.h"


#define CELLID_TARGET @"Target"
#define CELLID_GIFT @"Gift"
#define CELLID_STEP @"step"

//cell的顺序
typedef enum : NSUInteger {
    CELLTAYP_TARGET,
    CELLTAYP_GIFT,
    CELLTAYP_STEP,
} CELLTAYP;
//#define CELLTAYP_TARGET 0
//#define CELLTAYP_GIFT 1
//#define CELLTAYP_STEP 3
//cell数量
#define CELLNUM_TARGET 1
#define CELLNUM_GIFT [_cellsModel[CELLTAYP_GIFT]count]
#define CELLNUM_STEP [_cellsModel[CELLTAYP_STEP]count]
//cell高度
#define CELLHIEGHT_TARGET 100
#define CELLHIEGHT_GIFT [_cellsModel[CELLTAYP_GIFT]count]*50
#define CELLHIEGHT_STEP [_cellsModel[CELLTAYP_STEP]count]*50



@interface TargetViewController ()


@end

@implementation TargetViewController

-(TargetViewController*)init:(TargetModel *)targetModel{
    self = [super init];
    if (self != nil) {
        _targetModel = targetModel;
        _delegatesMaster = [[TargetViewDelegates alloc]init];
        _delegate = (id)_delegatesMaster;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    UIBarButtonItem *liftBar = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftAction:)];
    self.navigationItem.rightBarButtonItem = liftBar;
    
    [self initTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectLeftAction:(UIBarButtonItem*)sender{
    [self saveData];
}

//tabelView相关
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case CELLTAYP_TARGET:
            return CELLNUM_TARGET;
            break;
        case CELLTAYP_GIFT:
            return CELLNUM_GIFT;
            break;
        case CELLTAYP_STEP:
            return CELLNUM_STEP;
            break;
        default:
            break;
    }
    return 10;
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case CELLTAYP_TARGET:
            return CELLHIEGHT_TARGET;
            break;
        case CELLTAYP_GIFT:
            return CELLHIEGHT_GIFT;
            break;
        case CELLTAYP_STEP:
            return CELLHIEGHT_STEP;
            break;
        default:
            break;
    }
    return 95;
}
////组高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//
//-----------------------------------------设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [self createCells:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}
//-----------------------------------------设置表头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case CELLTAYP_TARGET:
            return @"Target";
            break;
        case CELLTAYP_GIFT:
            return @"Gift";
            break;
        case CELLTAYP_STEP:
            return @"Step";
            break;
        default:
            break;
    }
    return @"";
}

-(UITableViewCell*)createCells:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据当前的位置来
    UITableViewCell* cell = nil;
    switch (indexPath.section) {
        case CELLTAYP_TARGET:
            cell = [self createTargetCell:tableView cellForRowAtIndexPath:indexPath];
            break;
        case CELLTAYP_GIFT:
            
            break;
        case CELLTAYP_STEP:
            
            break;
        default:
            break;
    }
    return cell;
}


-(UITableViewCell*)createTargetCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TargetSettingViewTargetTableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"TargetCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TargetSettingViewTargetTableViewCell" owner:nil options:nil]firstObject];
        //不知道传cell可不可以 它应该还是在的 不存在就试试别的方法吧

        [cell initAllView:_cellsModel[CELLTAYP_TARGET]];
    }
    [_delegatesMaster addDelegateTargets:cell];
    return cell;
}

-(UITableViewCell*)createGiftCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    return cell;
}

-(UITableViewCell*)createStepCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    return cell;
}
//=----------------------初始化tableView
-(void)initTableView{
    if (self.tableView == nil) {
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds )-64) style:UITableViewStylePlain];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.tableView.dataSource       = self;
        self.tableView.delegate         = self;
        self.tableView.tableFooterView = [[UIView alloc]init];

        [self.view addSubview:self.tableView];
    }
}

//初始化stepcell用的model
-(void)initStepData{
    NSMutableArray* cellBuf = [[NSMutableArray alloc]init];
    TargetModel* targetModelBuf = nil;
    HeaderModel* headerModelBuf = nil;
    //添加target
    headerModelBuf = _targetModel.headerModel;
    [_cellsModel addObject:headerModelBuf];
    
    //添加gift
    NSMutableArray* giftBuf = nil;
    giftBuf = targetModelBuf.giftsModel;
    
    for (NSInteger k=0 ; k<giftBuf.count; k++) {
        [_cellsModel addObject:giftBuf[k]];
     }
    
    NSMutableArray* stepsModelBuf = nil;
    stepsModelBuf = _targetModel.stepsModel;
    for (NSInteger j =0 ; j < stepsModelBuf.count; j++) {
        [self pushStepForCell:stepsModelBuf[j] in:cellBuf];
    }
    [_cellsModel addObject:cellBuf];
}

-(void)pushStepForCell:(StepModel*)singleStep in:(NSMutableArray*)cellBuf{
    //遍历每个节点 如果可以显示就显示
    if (singleStep.isShow == YES) {
        [cellBuf addObject:singleStep];
        for (NSInteger i =0 ; i < singleStep.stepModels.count; i++) {
            [self pushStepForCell:singleStep.stepModels[i] in:cellBuf];
        }
    }else{
        //什么也不做
    }
}


-(void)saveData{
    if (_delegate ) {
        [_delegate TargetViewControllerProtocolSaveData];
    }
    NSLog(@"保存完毕");
    //这里手动将数据写入
    [_targetModel upDataAll];
}


@end
