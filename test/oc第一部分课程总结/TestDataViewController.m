//
//  TestDataViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "TestDataViewController.h"
#import "TargetModle.h"
@interface TestDataViewController ()

@end

@implementation TestDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testModle];
//    DataController* pDataController = [DataController getInstence];
//    
//    NSMutableDictionary* target = [pDataController getTargetDictionaryForHeaderFooter:0];
//    NSLog(@"测试结果target = %@",target);
//    [target setObject:@"sb" forKey:@"completeness"];
//    [pDataController setTargetDictionary:target ForHeaderFooterInTag:0];
//    target = [pDataController getTargetDictionaryForHeaderFooter:0];
//
//    NSMutableArray* data = [pDataController getStepsArrayFor:0 fromFather:nil];
//    NSLog(@"测试结果------------data = %@",data);
//
//    NSMutableArray* data2 = [pDataController getStepsArrayFor:0 fromFather:data];
//    NSLog(@"测试结果------------data2 = %@",data2);
//
//    NSMutableDictionary* target2 = data2[0];
//    
//    [pDataController setStepsArray:data2 For:0 inFather:data];
//    
//    NSMutableArray* gift = [pDataController getGiftsArrayFor:0];
//
//    
//    
//    NSLog(@"测试结果------------gift1 = %@",gift);
//    NSString* sb=  gift[0][@"giftName"] ;
//    sb = @"sb";
//    //[gift[0] setObject:@"sb" forKey:@"giftName"];
//    
//    [pDataController setGiftsArray:gift ForTag:0];
//    NSMutableArray* gift2 = [pDataController getGiftsArrayFor:0];
//
//    NSLog(@"测试结果------------gift2 = %@",gift2);

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testModle{
        DataController* pDataController = [DataController getInstence];

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
