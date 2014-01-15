//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios4212 on 13/01/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ListaContatosViewController.h"
#import "FormularioContatoViewControllerDelegate.h"

@interface FormularioContatoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;

@property (weak, atomic) NSMutableArray * contatos;

@property (strong, atomic) Contato * contato;

@property (weak, atomic) id <FormularioContatoViewControllerDelegate> delegate;

- (id)initWithContato: (Contato *)contato;

@end
