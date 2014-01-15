//
//  Contato.m
//  ContatosIP67
//
//  Created by ios4212 on 13/01/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import "Contato.h"


@interface Contato ()

@end

@implementation Contato

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject: self.nome forKey:@"nome"];
    [aCoder encodeObject: self.telefone forKey:@"telefone"];
    [aCoder encodeObject: self.email forKey:@"email"];
    [aCoder encodeObject: self.endereco forKey:@"endereco"];
    [aCoder encodeObject: self.site forKey:@"site"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.telefone = [aDecoder decodeObjectForKey:@"telefone"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.endereco = [aDecoder decodeObjectForKey:@"endereco"];
        self.site = [aDecoder decodeObjectForKey:@"site"];        
    }
    return self;
}

@end
