//
//  UMTCAP_ansi_asn1_dialoguePortion.m
//  ulibtcap
//
//  Created by Andreas Fink on 28.03.16.
//  Copyright (c) 2016 Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.

#import "UMTCAP_ansi_asn1_dialoguePortion.h"
#import "UMTCAP_ansi_asn1_confidentiality.h"

@implementation UMTCAP_ansi_asn1_dialoguePortion

@synthesize version;
@synthesize integerApplicationId;
@synthesize objectApplicationId;
@synthesize userInformation;
@synthesize integerSecurityId;
@synthesize objectSecurityId;
@synthesize confidentiality;


- (UMTCAP_ansi_asn1_dialoguePortion *)processAfterDecodeWithContext:(id)context
{
    version = [self getObjectAtPosition:0];
    
    UMASN1Object *choice = [self getObjectAtPosition:1];
    if((choice.asn1_tag.tagNumber == 27) && (choice.asn1_tag.tagClass== UMASN1Class_Private))
    {
        /* IntegerApplicationContext */
        integerApplicationId = [[UMASN1Integer alloc]initWithASN1Object: choice context:context];
    }
    if((choice.asn1_tag.tagNumber == 28) && (choice.asn1_tag.tagClass== UMASN1Class_Private))
    {
        /* ObjectIDApplicationContext */
        objectApplicationId = choice;
    }
    
    userInformation = [self getObjectAtPosition:2];
    
    
    choice = [self getObjectAtPosition:3];
    if(choice.asn1_tag.tagNumber == 0)
    {
        /* ObjectIDApplicationContext */
        integerSecurityId = [[UMASN1Integer alloc]initWithASN1Object: choice context:context];
    }
    else if(choice.asn1_tag.tagNumber == 1)
    {
        /* ObjectIDApplicationContext */
        objectSecurityId = choice;
    }
    
    UMASN1Object *obj = [self getObjectAtPosition:4];
    if(obj)
    {
        confidentiality = [[UMTCAP_ansi_asn1_confidentiality alloc]initWithASN1Object:obj context:context];
    }
    return self;
}

- (void)processBeforeEncode
{
    [super processBeforeEncode];

    asn1_tag.tagClass =UMASN1Class_Private;
    asn1_tag.tagNumber = 25;
    [asn1_tag setTagIsConstructed];
    asn1_list = [[NSMutableArray alloc]init];
    if(version)
    {
        [asn1_list addObject:version];
    }
    if((integerApplicationId!=NULL) && (objectApplicationId==NULL))
    {
        [asn1_list addObject:integerApplicationId];
    }
    else if((!integerApplicationId) && (objectApplicationId))
    {
        [asn1_list addObject:objectApplicationId];
    }
    if((integerSecurityId!=NULL) && (objectSecurityId==NULL))
    {
        objectSecurityId.asn1_tag.tagNumber = 0;
        [asn1_list addObject:integerSecurityId];
    }
    else if((integerSecurityId==NULL) && (objectSecurityId!=NULL))
    {
        objectSecurityId.asn1_tag.tagNumber = 1;
        [asn1_list addObject:objectSecurityId];
    }
    if(confidentiality)
    {
        [asn1_list addObject:confidentiality];
    }
}

- (NSString *)objectName
{
    return @"dialoguePortion";
}

@end
