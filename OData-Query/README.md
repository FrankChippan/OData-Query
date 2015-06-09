# OData Query

Quickly create strings which comply with OData conventions.
* [OData URI conventions](http://www.odata.org/documentation/odata-version-2-0/uri-conventions/)

## Example

Create a simple list query

```objective-c
NSString *listString = [NSString listStringWithBuilderBlock:^(ODataListStringBuilder *builderBlock) {
builderBlock.name = @"staff";
}];

NSString *queryString = [NSString queryStringWithBuilderBlock:^(ODataQueryStringBuilder *builderBlock) {
builderBlock.protocol = @"http";
builderBlock.server = @"server";
builderBlock.siteURL = @"siteurl";
builderBlock.list = listString;
}];

http://server/siteurl/_vti_bin/ListData.svc/staff  
```

Create a select query

```objective-c
NSString *listString = [NSString listStringWithBuilderBlock:^(ODataListStringBuilder *builderBlock) {
builderBlock.name = @"staff";
builderBlock.identifier = @"1";
builderBlock.property = @"name";
}];

NSString *queryString = [NSString queryStringWithBuilderBlock:^(ODataQueryStringBuilder *builderBlock) {
builderBlock.protocol = @"http";
builderBlock.server = @"server";
builderBlock.siteURL = @"siteurl";
builderBlock.list = listString;
builderBlock.select = @[@"name", @"surname", @"age"];
}];

http://server/siteurl/_vti_bin/ListData.svc/staff(1)/name?$select=name,surname,age
```

Create a filter query 

```objective-c
NSString *listString = [NSString listStringWithBuilderBlock:^(ODataListStringBuilder *builderBlock) {
builderBlock.name = @"staff";
builderBlock.identifier = @"1";
builderBlock.property = @"name";
}];

NSString *filterItemNameString = [NSString filterItemStringWithBuilderBlock:^(ODataFilterItemStringBuilder *builderBlock) {
builderBlock.name = @"name";
builderBlock.comparisonOperator = @"eq";
builderBlock.value = @"John";
}];

NSString *filterItemAgeString = [NSString filterItemStringWithBuilderBlock:^(ODataFilterItemStringBuilder *builderBlock) {
builderBlock.name = @"age";
builderBlock.comparisonOperator = @"gt";
builderBlock.value = @"21";
}];

NSString *filterItemSalaryString = [NSString filterItemStringWithBuilderBlock:^(ODataFilterItemStringBuilder *builderBlock) {
builderBlock.name = @"salary";
builderBlock.comparisonOperator = @"lt";
builderBlock.value = @"50,000";
}];

NSString *filterItemRegionString = [NSString filterItemStringWithBuilderBlock:^(ODataFilterItemStringBuilder *builderBlock) {
builderBlock.name = @"region";
builderBlock.comparisonOperator = @"eq";
builderBlock.value = @"Asia";
}];

NSString *filterString = [NSString filterStringWithBuilderBlock:^(ODataFilterStringBuilder *builderBlock) {
builderBlock.items = @[filterItemNameString, filterItemAgeString, filterItemSalaryString, filterItemRegionString];
}];

NSString *queryString = [NSString queryStringWithBuilderBlock:^(ODataQueryStringBuilder *builderBlock) {
builderBlock.protocol = @"http";
builderBlock.server = @"server";
builderBlock.siteURL = @"siteurl";
builderBlock.list = listString;
builderBlock.filter = filterString;
builderBlock.select = @[@"name", @"surname", @"age"];
}];


http://server/siteurl/_vti_bin/ListData.svc/staff(1)/name?$select=name,surname,age&$filter=name%20eq%20%27John%27%20and%20age%20gt%20%2721%27%20and%20salary%20lt%20%2750,000%27%20and%20region%20eq%20%27Asia%27   
```

## TODO

Basic functionality is supported, but there are many areas which are not. Date support and additional operators for filtering for example


