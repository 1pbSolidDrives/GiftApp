//
//  TarGetMaster.h
//  oc第一部分课程总结
//
//  Created by edz on 2016/10/24.
//  Copyright © 2016年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Step.h"
#import "Gift.h"
@interface TarGetMaster : NSObject
{
    NSString* targetHeaderImagePath;
    NSString* targetHeaderName;
    NSString* targetDetails;
    
    NSArray* _steps;
    NSArray* _gifts;
}
@end
