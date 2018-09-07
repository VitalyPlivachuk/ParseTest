//
//  EmployeeModel.m
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeModel.h"

@interface EmployeeModel()

@property (nonatomic, copy, readwrite) NSString* firstName;
@property (nonatomic, copy, readwrite) NSString* secondName;
@property (nonatomic, readwrite) NSInteger age;
@property (nonatomic, copy, readwrite) NSURL* avatar;
@end


@implementation EmployeeModel
- (instancetype) initWithDictionary:(NSDictionary*) dictionary {
    self = [self init];
    if(self){
        self.firstName = dictionary[@"firstName"];
        self.secondName = dictionary[@"secondName"];
        self.age = [dictionary[@"age"] integerValue];
        
        NSURL *wikiLink = [NSURL.alloc initWithString:((NSString *)dictionary[@"avatar"])];
        
        self.avatar = [EmployeeModel getImageLink:wikiLink];
    }
    return self;
}

- (instancetype) initWithOther: (EmployeeModel*)model
{
    self = [super init];
    if (self) {
        self.firstName = model.firstName;
        self.secondName = model.secondName;
        self.age = model.age;
        self.avatar = model.avatar;
    }
    return self;
}

+(NSURL *)getImageLink: (NSURL*)wikiURL
{
    NSString *fileName = [wikiURL lastPathComponent];
    NSString *imagePath = [NSString.alloc initWithFormat:@"https://en.wikipedia.org/w/api.php?action=query&titles=%@&prop=imageinfo&iiprop=url&format=json", fileName];
    
    NSURL *imageURL = [NSURL.alloc initWithString:imagePath];
    NSString *res = [NSString.alloc initWithContentsOfURL:imageURL encoding:NSUTF8StringEncoding error:nil];
    
    NSRange r1 = [res rangeOfString:@"\"url\":\""];
    NSRange r2 = [res rangeOfString:@"\",\"descriptionurl\""];
    NSRange rSub = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length);
    NSString *sub = [res substringWithRange:rSub];
    return [NSURL.alloc initWithString:sub];
}

@end
