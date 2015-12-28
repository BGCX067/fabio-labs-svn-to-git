unit Matricula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, FormCadastro, StdCtrls, Buttons,
  ExtCtrls, Mask, rxToolEdit, Grids, Entities, Constants, CheckLst,
  Generics.Collections;

type
  TFMatricula = class(TFFormCadastro)
    Label1: TLabel;
    EdMatricula: TEdit;
    Label2: TLabel;
    edData: TDateEdit;
    Label3: TLabel;
    cbAlunos: TComboBox;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    clbProdutos: TCheckListBox;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Matricula : TMatricula;
    procedure carregarProdutos(Produtos : TList<TProduto>);
  public
    { Public declarations }
    constructor create( obj : TEntidade; Sender : TComponent); override;
  end;

var
  FMatricula: TFMatricula;

implementation

uses Pagamento;

{$R *.dfm}

procedure TFMatricula.BitBtn1Click(Sender: TObject);
var
  Form : TFFormCadastro;
  Produto : TObject;
  Pagto : TPagamento;
  I : Integer;
begin
  inherited;
  Pagto := TPagamento.Create;
  Pagto.Descricao := 'Matrícula ';
  //Somar o valor dos produtos selecionados
  for I := 0 to clbProdutos.Items.Count -1 do
  begin
    Pagto.Descricao := Pagto.Descricao + TProduto(clbProdutos.Items.Objects[I]).Descricao + ', ';
    if clbProdutos.Items.Count > I then
      Pagto.Descricao := Pagto.Descricao + ', ';
    Pagto.Valor := Pagto.Valor + TProduto(clbProdutos.Items.Objects[I]).Valor;
  end;
  Form := TFPagamento.create(Pagto, Self);
  Form.ShowModal;
  Form.Free;
end;

procedure TFMatricula.carregarProdutos(Produtos: TList<TProduto>);
var
  Produto : TProduto;
begin
  for Produto in Produtos do
    clbProdutos.AddItem(Produto.Descricao, Produto);
end;

constructor TFMatricula.create(obj: TEntidade; Sender: TComponent);
begin
  inherited create(obj, Sender);
  Matricula := obj as TMatricula;
end;

procedure TFMatricula.FormShow(Sender: TObject);
var
  Pagto : TPagamento;
  Pos : Integer;
  Produtos : TList<TProduto>;
begin
  Pos := 1;
  inherited;
  EdMatricula.Text := IntToStr(Matricula.Matricula);
  edData.Date := Matricula.Data;

  // Carregar a lista de alunos
  cbAlunos.AddItem(Matricula.Aluno.Name, Matricula.Aluno);
  cbAlunos.ItemIndex := 0;

  // Carregar produtos e servios
  Produtos := TList<TProduto>.Create;
  Produtos.Add(TProduto.Create);
  Produtos.Add(TProduto.Create);
  Produtos[0].Id := 1;
  Produtos[0].Descricao := 'Musculação';
  Produtos[0].Valor := 45.00;
  Produtos[1].Id := 2;
  Produtos[1].Descricao := 'Boxe';
  Produtos[1].Valor := 65.00;
  carregarProdutos(Produtos);

  StringGrid1.Cells[0, 0] := 'Descrição';
  StringGrid1.Cells[1, 0] := 'Data';
  StringGrid1.Cells[2, 0] := 'Valor';
  for Pagto in Matricula.Pagamentos do
  begin
    StringGrid1.Cells[0, Pos] := Pagto.Descricao;
    StringGrid1.Cells[1, Pos] := FormatDateTime(_DateFormat, Pagto.Data);
    StringGrid1.Cells[2, Pos] := FormatFloat(_MonetaryFormat, Pagto.Valor);
    Inc(Pos);
  end;

end;

end.
