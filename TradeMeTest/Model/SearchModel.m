//
//  SearchModel.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 15/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"totalCount":         @"TotalCount",
                                                                  @"pageSize":           @"PageSize",
                                                                  @"list":               @"List",
                                                                  @"didYouMean":         @"DidYouMean",
                                                                  @"foundCategories":    @"FoundCategories",
                                                                  }];
}

@end
