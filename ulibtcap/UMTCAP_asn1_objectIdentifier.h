//
//  UMTCAP_asn1_objectIdentifier.h
//  ulibtcap
//
//  Created by Andreas Fink on 26.04.16.
//  Copyright © 2016 Andreas Fink. All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.

#import <ulib/ulib.h>
#import <ulibasn1/ulibasn1.h>

@interface UMTCAP_asn1_objectIdentifier : UMASN1ObjectPrimitive
{
    
}

- (UMTCAP_asn1_objectIdentifier *)initWithString:(NSString *)context;
@end
