//
//  SearchResultModel.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "FoundItemModel.h"

@implementation FoundItemModel


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"listingId":         @"ListingId",
                                                                  @"title":           @"Title",
                                                                  @"category":               @"Category",
                                                                  @"startPrice":         @"StartPrice",
                                                                  @"buyNowPrice":    @"BuyNowPrice",
                                                                  @"startDate":         @"StartDate",
                                                                  @"endDate":           @"EndDate",
                                                                  @"isBold":               @"IsBold",
                                                                  @"categoryPath":         @"CategoryPath",
                                                                  @"pictureHref":    @"PictureHref",
                                                                  @"region":         @"Region",
                                                                  @"suburb":           @"Suburb",
                                                                  @"hasBuyNow":               @"HasBuyNow",
                                                                  @"subtitle":         @"Subtitle",
                                                                  @"priceDisplay":    @"PriceDisplay",
                                                                  }];
}


+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"isBold"] ||
        [propertyName isEqualToString:@"buyNowPrice"] ||
        [propertyName isEqualToString:@"hasBuyNow"]){

        return YES;
    }
    return NO;
}

@end
