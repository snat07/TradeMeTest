//
//  SearchCategory.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "FoundCategoryModel.h"

@implementation FoundCategoryModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"count":         @"Count",
                                                                  @"category":      @"Category",
                                                                  @"name":          @"Name",
                                                                  @"categoryId":    @"CategoryId",
                                                                  }];
}

@end
