//
//  Home2TableViewCell.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/22.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTools.h"
@class Home2TableViewCell;

@protocol Home2TableViewCellProtocl <NSObject>

-(NSMutableDictionary*)Home2TableViewCellGetMyData;

 @end


@interface Home2TableViewCell : UITableViewCell
{
    DataTools* _dataTools;
}
@property (weak, nonatomic) IBOutlet UIImageView *cellIamge;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) id<Home2TableViewCellProtocl>delegate;

@property (strong,nonatomic) NSMutableDictionary* myData;

 @end
