/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
@class CDTDataObjectMetadata;

/**
Provides the basic metadata APIs that are required by the SDK to persist objects to the cloud.
 */
@protocol CDTDataObject

/**
 Stores metadata about the CDTDataObject that is being saved.  This property is set directly by the SDK.  
 */
@property (strong, nonatomic, readwrite) CDTDataObjectMetadata *metadata;

@end
