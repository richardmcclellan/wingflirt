//
//  Message.h
//  Wingflirt
//
//  Created by Richard McClellan on 3/20/13.
//  Copyright (c) 2013 Richard McClellan. All rights reserved.
//

@interface Message : PFObject <PFSubclassing> {

}

@property (nonatomic, strong) PFInstallation *installation;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSMutableArray *comments;

@end
