//
//  SearchModel.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 15/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "FoundItemModel.h"
#import "FoundCategoryModel.h"

@protocol FoundItemModel;
@protocol FoundCategoryModel;

@interface SearchModel : JSONModel

@property (nonatomic) int                                   totalCount;
@property (nonatomic) int                                   pageSize;
@property (nonatomic, strong) NSArray<FoundItemModel>    *list;
@property (nonatomic, strong) NSString<Optional>            *didYouMean;
@property (nonatomic, strong) NSArray<FoundCategoryModel>  *foundCategories;


@end
