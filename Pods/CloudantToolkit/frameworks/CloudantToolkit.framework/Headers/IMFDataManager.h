/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
#import <IMFCore/IMFCore.h>

@class CDTReplicatorFactory;
@class CDTDatastoreManager;
@class CDTPushReplication;
@class CDTPullReplication;
@class CDTStore;
@protocol CDTObjectMapper;

#define DB_ACCESS_GROUP_ADMINS @"admins"
#define DB_ACCESS_GROUP_MEMBERS @"members"

@class IMFDataManager;

/**
 The IMFDataManager is the central point for interacting with the Cloudant NoSQL database.
 */
@interface IMFDataManager : NSObject

/**
 Specifies the default object mapper. This CDTObjectMapper is automatically set when a CDTStore is created.  By default, this value is set to the CDTDataObjectMapper class.
 */
@property (nonatomic, strong) id<CDTObjectMapper> defaultMapper;

/**
Specifies the CDTDatastoreManager for this class.  This CDTDatastoreManager is used to create all CDTDatastore instances.
 */
@property (readonly, atomic) CDTDatastoreManager *datastoreManager;

/**
 Specifies the CDTReplicatorFactory to be used with all CDTDatastore instances created with this IMFDataManager.
 */
@property (readonly, atomic) CDTReplicatorFactory *replicatorFactory;


/**
 IMFDataManager is a singleton that can be accessed with this method.
 @return The sharedInstance of the IMFDataManager.
 */
+(instancetype) sharedInstance;

/**
 Creates a local CDTStore.
 @param name Specifies the name of the store.
 @param error Specifies any errors, if an error was encountered.
 @return the newly created CDTStore
 */
-(CDTStore*) localStore: (NSString*) name error: (NSError**) error;

/**
 Creates a remote CDTStore.  The remote store is automatically configured to communicate with the Bluemix Cloudant database.
 @param name Specifies the name of the data store.
 @param completionHandler Specifies the completion handler that gets invoked when the operation is completed.
 */
-(void) remoteStore: (NSString*) name completionHandler: (void(^) (CDTStore *store, NSError *error)) completionHandler;

/**
 Generates a CDTPullReplication object to be used to replicate with local CDTStore created with this manager.
 @param name Specifies the name of the data store to replicate from remote to local.
 @return the CDTPullReplication object to be used.
 */
-(CDTPullReplication*) pullReplicationForStore: (NSString*) name;

/**
 Generates a CDTPullReplication object to be used to replicate with local CDTStore created with this manager.
 @param name Specifies the name of the data store to replicate from local to remote.
 @return the CDTPushReplication object to be used.
 */
-(CDTPushReplication*) pushReplicationForStore: (NSString*) name;


/**
 Sets user permissions on a remote Cloudant database.
 @param access Specifies the access group to which to add the user.  Valid values are admins or members.  For convenience, constants are provided above (DB_ACCESS_GROUP_ADMINS and DB_ACCESS_GROUP_MEMBERS)
 @param storeName Specifies the name of the remote Cloudant database on which to set permissions.
 @param completionHandler Specifies the completion handler that gets invoked when the operation is completed.
 */
-(void) setCurrentUserPermissions:(NSString*)access forStoreName:(NSString*)storeName completionHander: (void(^) (BOOL success, NSError *error)) completionHandler;

@end

/**
 IMFData provides the current version of the IMFData framework.
 */
@interface IMFData : NSObject

/**
 @return The version of the IMFData framework.
 */
+(NSString*) version;

@end
