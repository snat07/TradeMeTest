//
//  SearchCategory.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 16/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface FoundCategoryModel : JSONModel

@property(nonatomic) int count;
@property(nonatomic, strong)NSString *category;
@property(nonatomic, strong)NSString *name;
@property(nonatomic) int categoryId;


@end
