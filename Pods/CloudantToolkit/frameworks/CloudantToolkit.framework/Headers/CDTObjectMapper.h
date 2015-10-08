/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
@class CDTStore;
@class CDTDocumentRevision;

#define CDT_DATATYPE_KEY    @"@datatype"
#define CDT_DATATYPE_INDEX_NAME @"cdtdatatypeindex"

/**
 Provides the ability to insert custom code to map native objects onto CDTDocumentRevisions.  This allows the developer to program with native objects and persist them to Cloudant.
 */
@protocol CDTObjectMapper <NSObject>

/**
 Given a native object, return the corresponding CDTDocumentRevision to persist.
 @param object The native object to persist.
 @param error Will be set upon problems.  Errors may be reported with a non-failing conversion.  If nil is returned an error should always be returned.
 @return the corresponding CDTDocumentRevision
 */
-(CDTDocumentRevision*) objectToDocument: (id) object error: (NSError**) error;

/**
 Given a CDTDocumentRevision, hydrate a native object with the contents of the CDTDocumentRevision
 @param document The CDTDocumentRevision to be used to hydrate the native object.
 @param error Will be set upon problems.  Errors may be reported with a non-failing conversion.  If nil is returned an error should always be returned.
 @return the corresponding CDTDocumentRevision
 */
-(id) documentToObject: (CDTDocumentRevision*) document error: (NSError**) error;

/**
 Looks up the data type for a given class.
 @param className The name of the class to lookup
 @return The dataType for the class.
 */
-(NSString*) dataTypeForClassName: (NSString*) className;

/**
 Looks up the Class for a given data type.
 @param dataType The data type to lookup
 @return The class name for the data type.
 */
-(NSString*) classNameForDataType: (NSString*) dataType;

/**
 Associates a data type with a Class
 @param dataType The data type to associate with the class
 @param className The class to be associated with the dataType
 */
-(void)setDataType:(NSString*)dataType forClassName: (NSString*)className;

@end
