//
//  EmployeeModel.h
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

@interface EmployeeModel: NSObject

@property (nonatomic, copy, readonly) NSString* firstName;
@property (nonatomic, copy, readonly) NSString* secondName;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, copy, readonly) NSURL* avatar;

- (instancetype) initWithDictionary:(NSDictionary*) dictionary;
- (instancetype) initWithOther: (EmployeeModel*) model;
@end
