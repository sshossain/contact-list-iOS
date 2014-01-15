//
//  FormularioContatoViewControllerDelegate.h
//  ContatosIP67
//
//  Created by Soraya Hossain on 1/15/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FormularioContatoViewControllerDelegate <NSObject>

- (void) contatoAdicionado:(Contato *)contato;

@optional

- (void) contatoAlterado:(Contato *)contato;

@end
