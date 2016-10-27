//
//  TableView.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/18.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TableView.h"

@interface TableView ()

@end

@implementation TableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    _arryBig = [[NSMutableArray alloc]init];
    
    for (int i='A'; i<'Z'; i++) {
       // NSMutableArray* arrySmall = [[NSMutableArray alloc]init];
//        for (int j = 1; j<6; j++) {
//            //[arrySmall addObject:[NSString stringWithFormat:@"%c %d",i,j]];
//        }
        [_arryBig addObject:[NSString stringWithFormat:@"A %d",i]];
    }
    
    [self createBtn];
    
}
//获取魅族元素显示的行数
//必须要实现的协议函数
//函数在现实数据视图 会掉用
//p1 视图对象本身
//p2 那一组需要的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (NSInteger)([_arryBig count]);
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return _arryBig.count;
//}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* str = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        //创建一个单元格
        //p1 单元格样式
        //p2 单元格复用标记
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    //将单元格的主文字内容赋值

    cell.textLabel.text = _arryBig[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)createBtn{
    _btnEdit = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit) ];
    _btnFinish = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish) ];
    _btnDelete = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete) ];
    self.navigationItem.rightBarButtonItem = _btnEdit;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_arryBig removeObject: _arryBig[indexPath.row]];
    [_tableView reloadData];
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCellEditingStyleNone
    //UITableViewCellEditingStyleDelete
    //UITableViewCellEditingStyleInsert
    
    //UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert
    return UITableViewCellEditingStyleDelete;
}

-(void)pressEdit{
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _btnFinish;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem = _btnDelete;
}

-(void)pressFinish{
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _btnEdit;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}

-(void)pressDelete{
    
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

@end
