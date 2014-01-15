//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios4212 on 14/01/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "Contato.h"
#import "FormularioContatoViewControllerDelegate.h"

@implementation ListaContatosViewController

- (id)init
{
    self = [super init];
    if (self){
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem * botao = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeForm)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (void)exibeForm
{
    FormularioContatoViewController * form = [[FormularioContatoViewController alloc]init];
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contatos count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* pool = @"contatos"; //variavel global
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:pool];
    }
    Contato* contato = self.contatos [indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contatos removeObjectAtIndex:indexPath.row]; //remover o contato específico
        [tableView deleteRowsAtIndexPaths: @[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
        
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Contato * contato = self.contatos[sourceIndexPath.row];
    [self.contatos removeObjectAtIndex:sourceIndexPath.row];
    [self.contatos insertObject:contato atIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato * contato = self.contatos[indexPath.row];
    FormularioContatoViewController * form = [[FormularioContatoViewController alloc] initWithContato: contato];
    form.delegate = self;
    [self.navigationController pushViewController:form animated:YES];
    
}

- (void) contatoAdicionado:(Contato *) contato
{
    [self.contatos addObject:contato];
     NSLog(@"Contatos: %@", self.contatos);
}

@end
