//
//  ItemDetailModel.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "ItemDetailModel.h"

@implementation ItemDetailModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"listingId":        @"ListingId",
                                                                  @"title":            @"Title",
                                                                  @"category":         @"Category",
                                                                  @"startPrice":       @"StartPrice",
                                                                  @"buyNowPrice":       @"BuyNowPrice",
                                                                  @"startDate":        @"StartDate",
                                                                  @"endDate":          @"EndDate",
                                                                  @"categoryPath":     @"CategoryPath",
                                                                  @"suburb":           @"Suburb",
                                                                  @"priceDisplay":     @"PriceDisplay",
                                                                  @"hasBuyNow":        @"HasBuyNow",
                                                                  @"memberNickname":   @"Member.Nickname",
                                                                  @"body":             @"Body",
                                                                  @"photos":           @"Photos",
                                                                  }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"hasBuyNow"] ||
        [propertyName isEqualToString:@"buyNowPrice"]){
        return YES;
    }
    return NO;
}

@end
