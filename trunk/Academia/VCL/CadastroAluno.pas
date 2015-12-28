unit CadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, FormCadastro, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, Entities;

type
  TFCadastroAluno = class(TFFormCadastro)
    Label1: TLabel;
    EdNome: TEdit;
    Label2: TLabel;
    edNascimento: TDateTimePicker;
    PnFoto: TPanel;
    Image: TImage;
    gbSexo: TRadioGroup;
    Label3: TLabel;
    edEmail: TEdit;
    Label4: TLabel;
    edCelular: TEdit;
    Label5: TLabel;
    edFone: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edCEP: TEdit;
    Label7: TLabel;
    edLogradouro: TEdit;
    Label8: TLabel;
    edNumero: TEdit;
    Label9: TLabel;
    edBairro: TEdit;
    edCidade: TEdit;
    Label10: TLabel;
    edUF: TEdit;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Aluno : TAluno;
  public
    { Public declarations }
    constructor create( obj : TEntidade; Sender : TComponent); override;
  end;

var
  FCadastroAluno: TFCadastroAluno;

implementation

{$R *.dfm}

{ TFCadastroAluno }

constructor TFCadastroAluno.create(obj: TEntidade; Sender: TComponent);
begin
  inherited Create(obj, Sender);
  Aluno := obj as TAluno;
end;

procedure TFCadastroAluno.FormShow(Sender: TObject);
begin
  inherited;
  EdNome.Text := Aluno.Name;
  edNascimento.Date := Aluno.DOB;
  gbSexo.ItemIndex := Integer(Aluno.Sexo);
  edCelular.Text := Aluno.Celular;
  edFone.Text := Aluno.FoneOutro;
  if Aluno.Foto <> Nil then
    Image.Picture.Bitmap.LoadFromStream(Aluno.Foto);
  edCEP.Text := Aluno.CEP;
  edLogradouro.Text := Aluno.Logradouro;
  edNumero.Text := Aluno.Numero;
  edCidade.Text := Aluno.Cidade;
  edBairro.Text := Aluno.Bairro;
  edUF.Text := Aluno.UF;
end;

end.
