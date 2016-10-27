//
//  Step.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gift.h"
@interface Step : NSObject
{
    NSString* stepName;
    NSString* stepImagePath;
    NSString* stepEndTime;
    NSString* stepBuildTIme;
    NSString* stepDetails;
    NSInteger giftPath;
    NSArray* steps;
}
@end
