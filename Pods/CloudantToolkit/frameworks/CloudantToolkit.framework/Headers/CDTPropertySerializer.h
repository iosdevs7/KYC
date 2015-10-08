/*
 * Licensed Materials - Property of IBM
 * (C) Copyright IBM Corp. 2014, 2014. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>

/**
 Provides a custom serializer for a class.  You can handle cross-platform serialization of any object or override the default serialization of an object.  For example, CDTDataObjectMapper serializes NSDate objects.  However, you can use this extension to override how NSDate is serialized.  You might also provide serialization of CLLocation objects, which are currently ignored by the CDTDataObjectMapper.
 */
@protocol CDTPropertySerializer <NSObject>

/**
 Creates a JSON object from a given an NSObject.  If it is not a valid JSON object, an execption is thrown.

 @param propertyValue The Objective C property value to be serialized to a JSON dictionary.
 @param error Errors if any that occured during serialization.
 @return The JSON Object object that will be stored in the JSON document.
 
 */
-(id) propertyValueToJSONValue: (id) propertyValue error: (NSError**) error;

/**
 Converts the NSDictionary to an NSObject, given an JSON NSDictionary.  The data type can be used to identify the NSDictionary as corresponding to a native class (without parsing its contents).

 @param jsonValue Specifies the JSON Object to convert back to the original NSObject.  Use the data type to identify the Class.
 @param error Specifies any errors that occured during serialization.
 @return An NSObject with the corresponding data type Class.  The object contains the JSON content.

 */
-(id) jsonValueToPropertyValue: (id) jsonValue error: (NSError**) error;

@end
