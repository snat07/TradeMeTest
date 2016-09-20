//
//  ItemPhoto.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "ItemPhotoModel.h"

@implementation ItemPhotoModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"key":         @"Key",
                                                                  @"value":       @"Value",
                                                                  }];
}

@end
