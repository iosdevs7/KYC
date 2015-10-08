/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
#import <CloudantToolkit/CDTObjectMapper.h>
@protocol CDTDataObject;
@protocol CDTPropertySerializer;

/**
 The CDTObjectMapper handles the conversion of Objective-C objects to NSDictionary JSON objects.  Serializable objects must conform to the CDTDataObject protocol.  Top level properties will be serialized if they are of the type NSString, NSNumber, NSNull, or NSDate.  Properties with primitive data types will also be serialized.  Additional types may be serialized by using the setPropertySerializer:forClassName:withDataType: method.  For example, support for CLLocation could be added by providing a property serializer for CLLocation.
 */
@interface CDTDataObjectMapper : NSObject<CDTObjectMapper>

/**
 Provides a custom serializer for a class.  With a custom serializer, you can handle cross platform serialization of any object or override the default serialization of an object.  For example, the CDTDataObjectMapper serializes NSDate objects.  However, you can use this extension to override how NSDate objects are serialized.  You also might provide serialization of CLLocation objects, which are currently ignored by the CDTDataObjectMapper.  All properties with the newly added data type will be serialized.
 @param serializer Specifies the CDTPropertySerializer that handles serialization of properties with type data type and class.
 @param className Specifies the name of the class to serialize with this serializer.
 @param dataType Specifies the cross-platform data type of the class to be serialized.
 */
-(void)setPropertySerializer: (id<CDTPropertySerializer>) serializer forClassName: (NSString*) className withDataType: (NSString*) dataType;

@end
