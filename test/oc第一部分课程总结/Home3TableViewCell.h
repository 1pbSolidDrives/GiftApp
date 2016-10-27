//
//  Home3TableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTools.h"
@class Home3TableViewCell;
@protocol Home3TableViewCellProtocol <NSObject>


@end

@interface Home3TableViewCell : UITableViewCell
{
    DataTools* _dataTools;
    NSMutableDictionary* _dataDictionary;
    NSIndexPath* _myIndexPath;
}
@property (weak, nonatomic) IBOutlet UIView *targetContentView;
@property (weak, nonatomic) IBOutlet UIImageView *targetImageView;
@property (weak, nonatomic) IBOutlet UILabel *textLable;
@property (weak, nonatomic) IBOutlet UILabel *targetDetails;

@property (strong, nonatomic) NSIndexPath*  myIndexPath;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(void)initAllReacurce;

@end
