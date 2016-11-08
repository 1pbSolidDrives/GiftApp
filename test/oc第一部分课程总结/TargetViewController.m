//
//  TargetViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/25.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TargetViewController.h"
#import "TargetSettingViewTargetTableViewCell.h"
#import "TargetSettingViewSetpsCellTableViewCell.h"
#import "TargetSettingViewStepDetailView.h"

#import "footerTestViewController.h"
#import "Masonry.h"


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
#define CELLHIEGHT_STEP_DETAIL 248
#define CELLHIEGHT_STEP_SUMMAY 76

@class targetSettingViewSetpsCellTableViewCellProtocol;

@interface TargetViewController ()
<targetSettingViewSetpsCellTableViewCellProtocol>
//当前设置的是谁
@property(nonatomic)NSInteger whoEdit; // 0 谁也没编辑 1 gift 2 step
@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //刷新tableView消息

    [self initMyViewInfo];
    [self registeNotificatinCenters];
    [self initTableView];
    [self registerKeybordNotification];
    [self initKeyboardViewTool];
    
}

-(void)initMyViewInfo{
    self.title = @"添加新target";
    //添加
    UIBarButtonItem *liftBar = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = liftBar;

    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    _whoEdit = 0;
}

-(void)registeNotificatinCenters{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(reloadCellSender:) name:@"upDataStepCells" object:nil ];

}

- (void)setTargetModel:(TargetModel *)model
{
    _targetModel = model;
    [self initCellData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectRightAction:(UIBarButtonItem*)sender{
    [self saveData];
    //回退
    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count-2] animated:YES];
    
    NSNotification * notice = [NSNotification notificationWithName:@"reloadHomeTabelView" object: nil ];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

-(void)selectLeftAction:(UIBarButtonItem*)sender{
    
    [self.navigationController popViewControllerAnimated:true];
    //返回数据
    
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
    return 3;
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
        {
            NSInteger height = 0;
            StepModel* stepModel = _cellsModel[indexPath.section][indexPath.row];
            height = CELLHIEGHT_STEP_SUMMAY;
            if (stepModel.isShowDetail) {
                height = CELLHIEGHT_STEP_SUMMAY + CELLHIEGHT_STEP_DETAIL;
            }
            return height;
        }
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
    //cell被选中的时候不高亮显示
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section) {
        case CELLTAYP_TARGET:
            return nil;
            break;
        case CELLTAYP_GIFT:
        {
            static NSString* identify = @"giftHeaderview";
            SettingViewGiftHeaderFooterView* giftHeaderview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identify];
            if (giftHeaderview == nil) {
                giftHeaderview = [[SettingViewGiftHeaderFooterView alloc]initWithReuseIdentifier:identify];
                giftHeaderview.delegate = self;
            }
            return giftHeaderview;
        }
            break;
        case CELLTAYP_STEP:
        {
            static NSString* identify = @"stepHeaderview";
            TargetSettingViewStepHeaderFooterView* stepHeaderview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identify];
            if (stepHeaderview == nil) {
                stepHeaderview = [[TargetSettingViewStepHeaderFooterView alloc]initWithReuseIdentifier:identify];
                stepHeaderview.delegate = self;
            }
            return stepHeaderview;
        }
            break;
        default:
            break;
    }
    return nil;
}

//创建 targetCell
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
//创建stepCell
-(UITableViewCell*)createStepCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     TargetSettingViewSetpsCellTableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"GiftCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TargetSettingViewSetpsCellTableViewCell" owner:nil options:nil]firstObject];
        [cell setMyData:_cellsModel[indexPath.section][indexPath.row]];
        cell.delegate = self;
        [_delegatesMaster addDelegateTargets:cell];
    }
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
//键盘上边的toolView
-(void)initKeyboardViewTool{

    _keyBoardView = [[UIView alloc]init];
    _keyBoardView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_keyBoardView];
    
    UIButton* done = [[UIButton alloc]init];
    [_keyBoardView addSubview:done];
    [done setTag:1];
    [done setTitle:@"done" forState:UIControlStateNormal];
    done.titleLabel.font = [UIFont systemFontOfSize:16];
    done.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [done setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

    
    [done mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_keyBoardView.mas_right).offset(-20 -50);
        make.right.equalTo(_keyBoardView.mas_right).offset(-20);
        make.top.bottom.equalTo(_keyBoardView);


    }];
//    done.backgroundColor = [UIColor blueColor];
    [done addTarget:self action:@selector(keyboardViewButton) forControlEvents:UIControlEventTouchUpInside];
    _keyBoardView.hidden = YES;

}
//点击done 后的相应
-(void)keyboardViewButton{
    NSLog(@"ssss");
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

}


// 键盘弹出时候 tabelview高度适应
- (void)registerKeybordNotification {
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification removeObserver:self];
    [notification addObserver:self
                     selector:@selector(showKeyboard:)
                         name:UIKeyboardWillShowNotification
                       object:nil];
    [notification addObserver:self
                     selector:@selector(hideKeyboard:)
                         name:UIKeyboardWillHideNotification
                       object:nil];
#ifdef __IPHONE_5_0
    // 5.0以上系统中文键盘高度与4.0系统不一样
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 5.0) {
        [notification addObserver:self
                         selector:@selector(showKeyboard:)
                             name:UIKeyboardWillChangeFrameNotification
                           object:nil];
    }
#endif
}

- (void)showKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyboardHeight = CGRectGetHeight([aValue CGRectValue]);
    CGFloat height = CGRectGetHeight(self.view.frame) - 100 - keyboardHeight;
    
    /* 使用动画效果，过度更加平滑 */
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    {
        CGRect rect = _tableView.frame;
        rect.size.height = height;
        
        [_keyBoardView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.view.mas_bottom).offset(-keyboardHeight - 40);
            make.height.mas_equalTo(40);
        }];
        _keyBoardView.hidden = NO;
        
        //NSLog(@"高是11=%f",height);
        _tableView.frame = rect;
    }
    [UIView commitAnimations];
}

- (void)hideKeyboard:(NSNotification *)notification {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    {
        CGRect rect = _tableView.frame;
        rect.size.height = CGRectGetHeight(self.view.frame) - 100;
        _keyBoardView.hidden = YES;
        _tableView.frame = rect;
        //NSLog(@"高是22=%f",rect.size.height);
    }
    [UIView commitAnimations];
}


 //初始化stepcell用的model
-(void)initCellData{
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
    StepModel* singleStepModel = nil;
    for (NSInteger j =0 ; j < stepsModelBuf.count; j++) {
        singleStepModel = stepsModelBuf[j];
        singleStepModel.SpaceNum = 0;
        [self pushStepForCell:singleStepModel in:cellBuf];
    }
    [_cellsModel addObject:cellBuf];
}



-(void)pushStepForCell:(StepModel*)singleStep in:(NSMutableArray*)cellBuf{
    //遍历每个节点 如果可以显示就显示
    StepModel* singleStepModel = nil;

    if (singleStep.isShow == YES) {
        [cellBuf addObject:singleStep];
        for (NSInteger i =0 ; i < singleStep.stepModels.count; i++) {
            singleStepModel = singleStep.stepModels[i];
            singleStepModel.SpaceNum = singleStep.SpaceNum + 1;
            [self pushStepForCell:singleStepModel in:cellBuf];
        }
    }else{
        //什么也不做
    }
}

//点击右上角保存按钮时的操作
-(void)saveData{
    //收回键盘
    NSNotification * notice = [NSNotification notificationWithName:UIKeyboardWillHideNotification object:nil];

    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
    if (_delegate ) {
        [_delegate TargetViewControllerProtocolSaveData];
        
    }
    NSLog(@"保存完毕");
    //这里手动将数据写入
    [_targetModel upDataAll];
    [self dataTest];
}
//添加gift时
-(void)settingViewGiftHeaderFooterViewProtocolAddGift:(UIButton *)sender{
    GiftModel* newGiftModel = [[DataController getInstence]getNewGiftModel];
    [_targetModel.giftsModel addObject:newGiftModel];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: CELLTAYP_GIFT  ] withRowAnimation:UITableViewRowAnimationNone];
}

//gift点击编辑
-(void)settingViewGiftHeaderFooterViewProtocolGiftEditButtonAct:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"完成"]) {
        _whoEdit = 1;
        [_tableView setEditing:YES animated:YES];
    }
    else if ([sender.titleLabel.text isEqualToString:@"编辑"]){
        _whoEdit = 0;
        [_tableView setEditing:NO animated:YES];
    }
}
//step点击编辑
-(void)stepCellEditAct:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"完成"]) {
        _whoEdit = 2;
        [_tableView setEditing:YES animated:YES];

    }
    else if ([sender.titleLabel.text isEqualToString:@"编辑"]){
        _whoEdit = 0;
        [_tableView setEditing:NO animated:YES];
    }
}
//决定这个cell 是否可以被移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 2 ){
        return UITableViewCellEditingStyleDelete;
    }
    if(indexPath.section == 1 ){
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleDelete;
}
//当触发编辑状态还没有结束时，调用该协议
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"willBeginEditingRowAtIndexPath %li",indexPath.section);
}
//当触发编辑状态结束后，调用该协议
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didEndEditingRowAtIndexPath %li",indexPath.section);
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"  moveRowAtIndexPath indexPath.section %li  indexPath.row %li",sourceIndexPath.section,sourceIndexPath.row);
}
/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == CELLTAYP_GIFT) {
        NSMutableArray* giftCellModels =   _cellsModel[indexPath.section];
        GiftModel* giftModel =  giftCellModels[indexPath.row];
        [_targetModel.giftsModel removeObject:giftModel];
        [_targetModel upDataAll];
        [self initCellData];
        
    }
    else if(indexPath.section == CELLTAYP_STEP){
        NSMutableArray* stepCellModels =   _cellsModel[indexPath.section];
        StepModel* stepModel = stepCellModels[indexPath.row];
        [stepModel deleteMe];
        [self initCellData];

    }
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: indexPath.section  ] withRowAnimation:UITableViewRowAnimationAutomatic];

    NSLog(@"%ld  indexPath.section %li  indexPath.row %li",(long)editingStyle,indexPath.section,indexPath.row);
}
//决定这个cell 是否可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return NO;
    }
    NSLog(@"indexPath.section %li  _whoEdit %li",indexPath.section,_whoEdit);
    if(_whoEdit == indexPath.section ){
        return YES;
    }
    return NO;
}
//giftcell内部修改后 在这里刷新
-(void)targetSettingViewAddGiftTableViewCellUpdataProtocol:(TargetSettingViewAddGiftTableViewCell *)sender updataModelAndTabelView:(GiftModel *)myData{
    //刷新 gift相关cell
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: CELLTAYP_GIFT  ] withRowAnimation:UITableViewRowAnimationAutomatic];
    //这是需要保存么
}

-(void)reloadStepsCell:(TargetSettingViewSetpsCellTableViewCell *)sender{
    [self initCellData];
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex: CELLTAYP_STEP  ] withRowAnimation:UITableViewRowAnimationAutomatic];
}
//通过nsNotifaction 发送消息
-(void)reloadCellSender:(id)sender{
    NSDictionary* sendInfo = [sender userInfo];
    NSString* sectionString = sendInfo[@"seciton"];
    NSInteger section = [sectionString intValue];
    switch (section) {
        case CELLTAYP_STEP:
        {
            [self initCellData];
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex: CELLTAYP_STEP  ] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        case CELLTAYP_GIFT:
        {
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex: CELLTAYP_GIFT  ] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
            break;
        default:
            break;
    }
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
