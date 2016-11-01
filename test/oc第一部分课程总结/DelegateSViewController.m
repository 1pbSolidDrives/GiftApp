//
//  DelegateSViewController.m
//  oc第一部分课程总结
//
//  Created by edz on 2016/11/1.
//  Copyright © 2016年 edz. All rights reserved.
//

#import "DelegateSViewController.h"
#import "delegateTest.h"
#import "ScrollDelegate.h"

@interface DelegateSViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DelegateSViewController{
    delegateTest *_multipleDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    
    _multipleDelegate = [delegateTest new];
    [_multipleDelegate initWeakRefTargets];
    //[_multipleDelegate addDelegate:self];
    [_multipleDelegate addDelegate:[ScrollDelegate new]];
    [_multipleDelegate addDelegate:self];

    
    //NSArray *array = @[self, [ScrollDelegate new]];
    //[_multipleDelegate setDelegateTargets:array];

 //    //添加要处理delegate方法的对象
//    [_multipleDelegate addDelegateTargets:[ScrollDelegate new]];
//    [_multipleDelegate addDelegateTargets:self];

    
    self.scrollView.delegate = (id)_multipleDelegate;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"++++++++%s", __PRETTY_FUNCTION__);
}

@end
