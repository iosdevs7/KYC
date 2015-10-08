/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>

/**
CDTQuery is a base class for various types of query.  CDTStore performQuery:completionHandler: takes a CDTQuery to perform.  More specific details and configurations can be found in subclasses.
*/
@interface CDTQuery : NSObject

@end
