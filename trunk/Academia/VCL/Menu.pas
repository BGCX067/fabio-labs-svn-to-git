unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ActnList,
  PlatformDefaultStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, Entities;

type
  TFMenu = class(TForm)
    ActionMainMenuBar: TActionMainMenuBar;
    ActionManager: TActionManager;
    Aluno: TAction;
    Matricula: TAction;
    Sair: TAction;
    actCadastroProdutos: TAction;
    procedure SairExecute(Sender: TObject);
    procedure AlunoExecute(Sender: TObject);
    procedure MatriculaExecute(Sender: TObject);
    procedure actCadastroProdutosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

uses CadastroAluno, FormCadastro, Matricula, CadastroProduto, PesquisaAluno, PesquisaPadrao;

{$R *.dfm}

procedure TFMenu.actCadastroProdutosExecute(Sender: TObject);
var
  Form : TFFormCadastro;
begin
  Form := TFCadastroProduto.create(TProduto.Create, Self);
  Form.ShowModal;
  Form.Free;
end;

procedure TFMenu.AlunoExecute(Sender: TObject);
var
  Form : TFFormCadastro;
  FormPesquisa : TfrmPesquisaPadrao;
begin
  FormPesquisa := TfPesquisaAluno.Create(Self);
  FormPesquisa.ShowModal;
  FormPesquisa.Free;
  {
  Form := TFCadastroAluno.create(TAluno.Create, Self);
  Form.ShowModal;
  Form.Free;
  }
end;


procedure TFMenu.MatriculaExecute(Sender: TObject);
var
  Form : TFFormCadastro;

  //Teste matricula
  Mat : TMatricula;
  Aluno : TAluno;
  Pagtos : TArrayOfPagamento;
begin
  Mat := TMatricula.create;
  Aluno := TAluno.create;
  Aluno.Name := 'Fábio Lindemberg';
  Aluno.Celular := '8186832621';
  Aluno.Email := 'fabiolindemberg@gmai.com';
  Aluno.DOB := StrToDate('25/09/1979');
  Aluno.Sexo := sMasculino;

  SetLength(Pagtos,3);
  Pagtos[0] := TPagamento.Create;
  Pagtos[0].Descricao := 'Matrícula';
  Pagtos[0].Data := Now;
  Pagtos[0].Valor := 45.00;
  Pagtos[1] := TPagamento.Create;
  Pagtos[1].Descricao := 'Men.02/2014';
  Pagtos[1].Data := Now;
  Pagtos[1].Valor := 45.00;
  Pagtos[2] := TPagamento.Create;
  Pagtos[2].Descricao := 'Men.03/2014';
  Pagtos[2].Data := Now;
  Pagtos[0].Valor := 45.00;

  Mat.Matricula := 12321;
  Mat.Aluno := Aluno;
  Mat.Pagamentos := Pagtos;
  Mat.Data := Now;

  Form := TFMatricula.create(Mat, Self);
  Form.ShowModal;
  Form.Free;
end;

procedure TFMenu.SairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

end.
