//
//  TargetViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetViewController.h"
#import "TargetSettingViewTargetTableViewCell.h"


#define CELLID_TARGET @"Target"
#define CELLID_GIFT @"Gift"
#define CELLID_STEP @"step"

//cell的顺序
//typedef enum : NSUInteger {
//    CELLTAYP_TARGET,
//    CELLTAYP_GIFT,
//    CELLTAYP_STEP,
//} CELLTAYP;
#define CELLTAYP_TARGET 0
#define CELLTAYP_GIFT 1
#define CELLTAYP_STEP 2
//cell数量
#define CELLNUM_TARGET 1
#define CELLNUM_GIFT [_cellsModel[CELLTAYP_GIFT]count]
#define CELLNUM_STEP [_cellsModel[CELLTAYP_STEP]count]
//cell高度
#define CELLHIEGHT_TARGET 100
#define CELLHIEGHT_GIFT [_cellsModel[CELLTAYP_GIFT]count]*100
#define CELLHIEGHT_STEP [_cellsModel[CELLTAYP_STEP]count]*50

#define CELLHIEGHT_GIFT_Father 132

#define CELLHIEGHT_GIFT_SHOPLIST 160
@interface TargetViewController ()


@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    UIBarButtonItem *liftBar = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftAction:)];
    self.navigationItem.rightBarButtonItem = liftBar;
    
    [self initTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setModel:(TargetModel *)model
{
    _targetModel = model;
    [self initStepData];
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
        {
            NSMutableArray* models = _cellsModel[section];
            NSInteger cellNum = models.count;
            return cellNum;
        }
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
    NSInteger section =indexPath.section;
    switch (section) {
        case CELLTAYP_TARGET:
            return CELLHIEGHT_TARGET;
            break;
        case CELLTAYP_GIFT:
        {
            NSInteger height = 0;
            GiftModel* gift = _cellsModel[indexPath.section][indexPath.row];
            height = CELLHIEGHT_GIFT_Father + gift.giftUrl.count *CELLHIEGHT_GIFT_SHOPLIST;
            
            return height;
        }

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
    return 30;
}
//
//-----------------------------------------设置单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //根据当前的位置来
    UITableViewCell* cell = nil;
    switch (indexPath.section) {
        case CELLTAYP_TARGET:
            cell = [self createTargetCell:tableView cellForRowAtIndexPath:indexPath];
            break;
        case CELLTAYP_GIFT:
            cell = [self createGiftCell:tableView cellForRowAtIndexPath:indexPath];
            
            break;
        case CELLTAYP_STEP:
            cell = [self createStepCell:tableView cellForRowAtIndexPath:indexPath];
            break;
        default:
            break;
    }
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
            return @"";
            break;
        case CELLTAYP_STEP:
            return @"Step";
            break;
        default:
            break;
    }
    return @"";
}



-(UITableViewCell*)createTargetCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TargetSettingViewTargetTableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"TargetCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TargetSettingViewTargetTableViewCell" owner:nil options:nil]firstObject];
        //不知道传cell可不可以 它应该还是在的 不存在就试试别的方法吧

        [cell initAllView:_cellsModel[indexPath.section]];
        [_delegatesMaster addDelegateTargets:cell];

    }
    return cell;
}
//创建giftcell
-(UITableViewCell*)createGiftCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TargetSettingViewAddGiftTableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"GiftCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TargetSettingViewAddGiftTableViewCell" owner:nil options:nil]firstObject];
        GiftModel* giftBuf = _cellsModel[indexPath.section][indexPath.row];
        [cell initAllView:giftBuf];
        cell.delegate = self;
        [_delegatesMaster addDelegateTargets:cell];
    }
    
    return cell;
}

-(UITableViewCell*)createStepCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = nil;
    
    return cell;
}
//=----------------------初始化tableView
-(void)initTableView{
    if (self.tableView == nil) {
        NSInteger width =CGRectGetWidth(self.view.frame);
        width = [UIScreen mainScreen].bounds.size.width;
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStylePlain];
        
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
    _cellsModel = [[NSMutableArray alloc]init];
     HeaderModel* headerModelBuf = nil;
    //添加target
    headerModelBuf = _targetModel.headerModel;
    [_cellsModel addObject:headerModelBuf];
    
    //添加gift
    NSMutableArray* giftBuf = [[NSMutableArray alloc]init];
    giftBuf = _targetModel.giftsModel;
    [_cellsModel addObject:giftBuf];

    
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
    [self dataTest];
}

-(void)targetSettingViewAddGiftTableViewCellUpdataProtocol:(TargetSettingViewAddGiftTableViewCell *)sender updataModelAndTabelView:(GiftModel *)myData{
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: 1  ] withRowAnimation:UITableViewRowAnimationNone];
    
}

-(void)dataTest{
    NSMutableArray* targets =[[DataController getInstence]targetMaster];
    TargetModel* targetBuf = targets[1];
    //测试1 修改一个target项
    //        HeaderModel* headermodel = [targetBuf headerModel];
    //    //
    //        NSString* targetName = [headermodel targetHeaderName];
    //        NSLog(@"targetName %@",targetName);
    //    headermodel.targetHeaderName = @"把数据部分调通";
    //    NSLog(@"targetName %@",headermodel.targetHeaderName);
    //    [headermodel upDataAll ];
    //    TargetModel* targetBuf2 = [[DataController getInstence]targetMaster][0];
    //    NSLog(@"targetBuf %@",[[targetBuf2 headerModel] targetHeaderName]);
    //    NSLog(@"----------targetBuf %@",[[DataController getInstence] dataMaster][0][@"headerFooter"][@"targetHeaderName"]);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSLog(@"DataMaster %@",DataMaster[0][@"headerFooter"][@"targetHeaderName"]);
    
    
    //测试2 修改一个step项
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //    StepModel* step = steps[0];
    //    NSString* name = [step stepName];
    //    NSLog(@"step name %@",name);
    //    step.stepName = @"处理model";
    //    [step updataAll];
    //    NSString* name2 = [[targetBuf stepsModel][0]stepName];
    //    NSLog(@"step name %@",name2);
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSString* name3 = steps2[0][@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //    //测试3 添加一个step项
    //    StepModel* step = steps[0];
    //    [targetBuf addStep:@"写完model" stepDetails:@"好好活着" stepImagePath:@"no.png" stepBuildTime:@"20161010" stepEndTime:@"20161111" giftPath:[[NSMutableArray alloc]init]];
    //    NSMutableArray* steps =[targetBuf stepsModel];
    //
    //    //测试 4 删除一个step项
    //    StepModel* step2 = steps[2];
    //
    //    [step2 deleteMe];
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* steps2 = DataMaster[0][@"steps"];
    //    NSMutableDictionary* steps3 = steps2[2];
    //    NSString* name3 = steps3[@"setpName"];
    //    NSLog(@"setpName %@",name3);
    
    //测试 5 修改一个gift
    NSMutableArray* gifts =[targetBuf giftsModel];
    GiftModel* gift = gifts[0];
    NSLog(@"%@",gift.giftName);
    //    gift.giftName = @"好好活着";
    //    [gift updataAll];
    //    //测试 6 添加一个Gift
    //    [targetBuf addGift:@"好好活着" giftUrl:@"空" giftImage:@"sb.png" setpPath:[[NSMutableArray alloc]init]];
    //
    //    NSString* _plistPath = [[NSBundle mainBundle] pathForResource:@"targetApp" ofType:@"plist"];
    //    NSMutableArray * DataMaster = [NSMutableArray arrayWithContentsOfFile:_plistPath];
    //    NSMutableArray* gifts2 = DataMaster[0][@"gifts"];
    //    NSString* giftName = gifts2[1][@"giftName"];
    //    NSLog(@"%@",giftName);
    
}

@end
