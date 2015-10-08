/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
#import <CloudantToolkit/CDTQuery.h>

/**
 * CDTCloudant query provides the convenience of using NSPredicates and performing a query on either a remote or local database.  Cloudant queries can also be specified directly as an NSDictionary.
 */
@interface CDTCloudantQuery : CDTQuery

/**
 * Specifies a reference to a Cloudant query in the form of a NSDictionary.
 */
@property (nonatomic, strong) NSDictionary* cloudantQuery;


/**
 * Specifies a reference to a sort descriptor. A Sort Descriptor is a Dictionary. The key is the field on which to sort.
 * The value is "asc" or "desc".
 * For example, if you want the results sorted by a key named "foo",
 * specify query.sortDescriptors = @[@{@"foo", "asc"}]
 */
@property (nonatomic, strong) NSArray* sortDescriptors;

/**
 * Initializes an instance of CDTQuery with NSPredicate.
 * @param predicate NSPredicate to generate a query.
 * @return An instance of CDTQuery.
 */
- (instancetype) initWithPredicate: (NSPredicate*) predicate;

/**
 * Initializes an instance of CDTQuery with NSPredicate and sort descriptors.
 * @param predicate NSPredicate to generate a query.
 * @param sortDescriptors A list of columns to sort in the form of: @{<colname>:@"asc" | @"desc"}
 * @return An instance of CDTCloudantQuery.
 */
- (instancetype) initWithPredicate: (NSPredicate*) predicate sortDescriptors: (NSArray*) sortDescriptors;

/**
 * Initializes an instance of CDTQuery with NSPredicate to query for data type.
 * @param dataType The type of objects to return from the query.  Only objects of type datatype are returned.
 * @return An instance of CDTCloudantQuery.
 */
- (instancetype) initDataType: (NSString*) dataType;

/**
 * Initializes an instance of CDTQuery with NSPredicate.
 * @param dataType The type of objects to return from the query.  Only objects of type datatype are returned.
 * @param predicate NSPredicate to generate a query.
 * @return An instance of CDTCloudantQuery.
 */
- (instancetype) initDataType: (NSString*) dataType withPredicate: (NSPredicate*) predicate;

/**
 * Initializes an instance of CDTQuery with NSPredicate and sort descriptors.
 * @param dataType The type of objects to return from the query.  Only objects of type datatype are returned.
 * @param predicate NSPredicate to generate a query.
 * @param sortDescriptors A list of columns to sort in the form of: @{<colname>:@"asc" | @"desc"}
 * @return An instance of CDTCloudantQuery.
 */
- (instancetype) initDataType: (NSString*) dataType withPredicate: (NSPredicate*) predicate sortDescriptors: (NSArray*) sortDescriptors;

/**
 * Initializes an instance of CDTQuery with NSPredicate and sort descriptors.
 * @param cloudantQuery The NSDictionary that contains a Cloudant Query.
 * @return An instance of CDTCloudantQuery.
 */
-(instancetype) initWithCloudantQuery: (NSDictionary*) cloudantQuery;

/**
 * Initializes an instance of CDTQuery with NSPredicate and sort descriptors.
 * @param cloudantQuery The NSDictionary that contains a Cloudant Query.
 * @param sortDescriptors A list of columns to sort in the form of: @{<colname>:@"asc" | @"desc"}
 * @return An instance of CDTCloudantQuery.
 */
-(instancetype) initWithCloudantQuery: (NSDictionary*) cloudantQuery sortDescriptors: (NSArray*) sortDescriptors;


@end
