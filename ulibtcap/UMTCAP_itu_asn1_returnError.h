//
//  UMTCAP_itu_asn1_returnError.h
//  ulibtcap
//
//  Created by Andreas Fink on 29/03/16.
//  Copyright (c) 2016 Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.

#import <ulibasn1/ulibasn1.h>
#import "UMTCAP_itu_asn1_componentPDU.h"
@class UMTCAP_itu_asn1_errorCode;

@interface UMTCAP_itu_asn1_returnError : UMTCAP_itu_asn1_componentPDU
{
    NSString *errorDescription;
}

@property(readwrite,strong) NSString *errorDescription;


@end
