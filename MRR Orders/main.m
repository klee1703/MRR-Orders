//
//  main.m
//  MRR Orders
//
//  Created by Keith Lee on 11/21/12.
//  Copyright (c) 2012 Keith Lee. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are
//  permitted provided that the following conditions are met:
//
//   1. Redistributions of source code must retain the above copyright notice, this list of
//      conditions and the following disclaimer.
//
//   2. Redistributions in binary form must reproduce the above copyright notice, this list
//      of conditions and the following disclaimer in the documentation and/or other materials
//      provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY Keith Lee ''AS IS'' AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Keith Lee OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  The views and conclusions contained in the software and documentation are those of the
//  authors and should not be interpreted as representing official policies, either expressed
//  or implied, of Keith Lee.
//

#import <Foundation/Foundation.h>
#import "OrderEntry.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    // Create an OrderEntry object for manual release
    NSString *orderId = [[NSString alloc] initWithString:@"A1"];
    OrderEntry *entry = [[OrderEntry alloc] initWithId:orderId];
    
    // Release orderId (retained by OrderEntry object, so object not deallocated!)
    [orderId release];
    
    // View results for new order entry
    NSLog(@"New order, ID = %@, item: %@", entry->orderId, entry->item->name);
    
    // Must manually release OrderEntry!
    [entry release];
    
    // Create an autorelease OrderEntry object, released at end of autorelease pool block
    OrderEntry *autoEntry = [[[OrderEntry alloc] initWithId:@"A2"] autorelease];
    NSLog(@"New order, ID = %@, item: %@", autoEntry->orderId, autoEntry->item->name);    
  }
  return 0;
}

