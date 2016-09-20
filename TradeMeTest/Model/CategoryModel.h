//
//  Category.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 15/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol CategoryModel;


@interface CategoryModel : JSONModel

@property (nonatomic, strong) NSString                           *name;
@property (nonatomic, strong) NSString                           *number;
@property (nonatomic, strong) NSString<Optional>                 *path;
@property (nonatomic)         BOOL                               hasClassifieds;
@property (nonatomic, strong) NSArray<Optional, CategoryModel>   *subcategories;
@property (nonatomic)         int                                count;


@end
