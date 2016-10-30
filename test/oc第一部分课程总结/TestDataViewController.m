//
//  TestDataViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TestDataViewController.h"
#import "TargetModel.h"
@interface TestDataViewController ()

@end

@implementation TestDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TargetModel* targetBuf = [[DataController getInstence] targetMaster][0];
    NSLog(@"%@",targetBuf);
    [self testModle];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testModle{
    //DataController* pDataController = [DataController getInstence];

    //创建一个目标的流程是
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
