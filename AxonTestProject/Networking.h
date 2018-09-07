//
//  Networking.h
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeModel.h"

@interface Networking : NSObject
+(void)getEmployees: (void (^)(NSArray<EmployeeModel *> *))completionBlock;
@end
