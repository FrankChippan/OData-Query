//
//  OData-QueryTests.m
//  OData-QueryTests
//
//  Created by Ewan Thomas on 06/09/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//


#import "ODataList.h"
#import "ODataQuery.h"
#import "ODataFilter.h"
#import "ODataFilterItem.h"
#import "ODataFilterSortDescriptor.h"
#import "NSString+ODataFormattedQueryString.h"

SpecBegin(InitialSpecs)

describe(@"building query urls", ^{
  
  it(@"can build a list query", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
    }];
    
    expect(queryString).to.equal(@"staff");
    
  });
  
  it(@"can build a list query by id", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
    }];
    
    expect(queryString).to.equal(@"staff(1)");
    
  });
  
  it(@"can build a list query by id and property", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
    }];
    
    expect(queryString).to.equal(@"staff(1)/name");
    
  });
  
  it(@"can build a list query with a select", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.select = @[@"name", @"surname", @"age"];
    }];
    
    expect(queryString).to.equal(@"staff(1)/name?$select=name,surname,age");
    
  });
  
  it(@"can build a list query with a filter", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *filterItemString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"name";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"John";
    }];
    
    NSString *filterString = [NSString filterWithBlock:^(ODataFilter *builderBlock) {
      builderBlock.items = @[filterItemString];
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.filter = filterString;
    }];
    
    expect(queryString).to.equal(@"staff(1)/name?$filter=name%20eq%20%27John%27");
    
  });
  
  it(@"can build a list query with a filter and a select", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *filterItemString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"name";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"John";
    }];
    
    NSString *filterString = [NSString filterWithBlock:^(ODataFilter *builderBlock) {
      builderBlock.items = @[filterItemString];
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.filter = filterString;
      builderBlock.select = @[@"name", @"surname", @"age"];
    }];
    
    expect(queryString).to.equal(@"staff(1)/name?$select=name,surname,age&$filter=name%20eq%20%27John%27");
    
  });
  
  it(@"can build a list query with select and a complex filter", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *filterItemNameString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"name";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"John";
    }];
    
    NSString *filterItemAgeString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"age";
      builderBlock.comparisonOperator = @"gt";
      builderBlock.value = @"21";
    }];
    
    NSString *filterItemSalaryString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"salary";
      builderBlock.comparisonOperator = @"lt";
      builderBlock.value = @"50,000";
    }];
    
    NSString *filterItemRegionString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"region";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"Asia";
    }];
    
    NSString *filterString = [NSString filterWithBlock:^(ODataFilter *builderBlock) {
      builderBlock.items = @[filterItemNameString, filterItemAgeString, filterItemSalaryString, filterItemRegionString];
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.filter = filterString;
      builderBlock.select = @[@"name", @"surname", @"age"];
    }];
    
    expect(queryString).to.equal(@"staff(1)/name?$select=name,surname,age&$filter=name%20eq%20%27John%27%20and%20age%20gt%20%2721%27%20and%20salary%20lt%20%2750,000%27%20and%20region%20eq%20%27Asia%27");
    
  });
  
  it(@"can build a list query with a filter and an order by", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
      builderBlock.identifier = @"1";
      builderBlock.property = @"name";
    }];
    
    NSString *filterItemString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"name";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"John";
    }];
    
    NSString *filterString = [NSString filterWithBlock:^(ODataFilter *builderBlock) {
      builderBlock.items = @[filterItemString];
    }];
    
    NSString *orderbyString = [NSString sortDescriptorWithBlock:^(ODataFilterSortDescriptor *builderBlock) {
      builderBlock.properties = @[@"age"];
      builderBlock.ascending = NO;
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.filter = filterString;
      builderBlock.orderBy = orderbyString;
    }];
    
    expect(queryString).to.equal(@"staff(1)/name?$filter=name%20eq%20%27John%27&$orderby=age%20desc");
    
  });
  
  it(@"can build a list query an order by", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    
    NSString *orderbyString = [NSString sortDescriptorWithBlock:^(ODataFilterSortDescriptor *builderBlock) {
      builderBlock.properties = @[@"age"];
      builderBlock.ascending = YES;
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.orderBy = orderbyString;
    }];
    
    expect(queryString).to.equal(@"staff?$orderby=age%20asc");
    
  });
  
  it(@"can build a list query an order by", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    
    NSString *orderbyString = [NSString sortDescriptorWithBlock:^(ODataFilterSortDescriptor *builderBlock) {
      builderBlock.properties = @[@"age"];
      builderBlock.ascending = YES;
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.orderBy = orderbyString;
    }];
    
    expect(queryString).to.equal(@"staff?$orderby=age%20asc");
    
  });
  
  it(@"can build a list query with a top", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.top = @"100";
    }];
    
    expect(queryString).to.equal(@"staff?$top=100");
    
  });
  
  it(@"can build a list query with a select, a filter and a top", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    NSString *filterItemString = [NSString filterItemWithBlock:^(ODataFilterItem *builderBlock) {
      builderBlock.name = @"name";
      builderBlock.comparisonOperator = @"eq";
      builderBlock.value = @"John";
    }];
    
    NSString *filterString = [NSString filterWithBlock:^(ODataFilter *builderBlock) {
      builderBlock.items = @[filterItemString];
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.filter = filterString;
      builderBlock.select = @[@"name", @"surname", @"age"];
      builderBlock.top = @"100";
    }];
    
    expect(queryString).to.equal(@"staff?$select=name,surname,age&$filter=name%20eq%20%27John%27&$top=100");
    
  });
  
  it(@"can build a list query with a skip", ^{
    
    NSString *listString = [NSString listWithBlock:^(ODataList *builderBlock) {
      builderBlock.name = @"staff";
    }];
    
    NSString *queryString = [NSString queryWithBlock:^(ODataQuery *builderBlock) {
      builderBlock.list = listString;
      builderBlock.skip = @"100";
    }];
    
    expect(queryString).to.equal(@"staff?$skip=100");
    
  });
  
  
});

SpecEnd