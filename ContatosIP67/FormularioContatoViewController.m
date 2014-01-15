//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios4212 on 13/01/14.
//  Copyright (c) 2014 ios4212. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"
#import "FormularioContatoViewControllerDelegate.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (id)init
{
    self = [super init];
    if (self){
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = btn;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        [self.foto setImage:self.contato.foto forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithContato: (Contato *)contato
{
    self = [super init];
    if (self) {
        self.contato = contato;
        self.navigationItem.title = @"Alteração";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Altera" style:UIBarButtonItemStylePlain target:self action: @selector(alteraContato)];
    }
    return self;
}

- (void)criaContato
{
    Contato * contato = [self pegaDadosDoFormulario];
    [self.delegate contatoAdicionado:contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)alteraContato
{
    [self pegaDadosDoFormulario];
    if ([self.delegate respondsToSelector:@selector(contatoAlterado:)]) {
        [self.delegate contatoAlterado: self.contato];        
    }

    [self.navigationController popViewControllerAnimated:YES];
}

- (Contato*)pegaDadosDoFormulario
{
    if (!self.contato) {
        self.contato = [[Contato alloc] init];
    }
    
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    self.contato.foto = self.foto.imageView.image;
    
    [self.view endEditing:YES];
    
    return self.contato;
}

- (IBAction)proximoCampo:(UITextField*)campoAtual
{
    NSInteger tag = campoAtual.tag+1;
    UIResponder* prox = [self.view viewWithTag:tag];
    if (prox) {
        [prox becomeFirstResponder];
    } else {
        [self.site resignFirstResponder];
    }
}

- (IBAction)selecionaFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
    } else {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //pode mudar para o source ser a camera
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * img = info[UIImagePickerControllerEditedImage];
    [self.foto setImage:img forState: UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
