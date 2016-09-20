//
//  Category.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 15/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                       @"path":             @"Path",
                                                       @"number":           @"Number",
                                                       @"hasClassifieds":   @"HasClassifieds",
                                                       @"name":             @"Name",
                                                       @"subcategories":    @"Subcategories",
                                                       @"count":            @"Count",
                                                       }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"hasClassifieds"] ||
        [propertyName isEqualToString:@"count"]){
        return YES;
    }
    return NO;
}
@end
