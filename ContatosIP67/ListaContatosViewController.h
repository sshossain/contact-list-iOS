//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios4212 on 14/01/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormularioContatoViewController.h"
#import "FormularioContatoViewControllerDelegate.h"

@interface ListaContatosViewController : UITableViewController <FormularioContatoViewControllerDelegate>

@property (weak, atomic) NSMutableArray * contatos;

@property (assign, atomic) NSInteger linhaSelecionada;

@end
