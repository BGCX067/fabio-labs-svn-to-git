unit Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadastro, StdCtrls, Buttons, ExtCtrls, Entities, Mask, rxToolEdit, rxCurrEdit;

type
  TFPagamento = class(TFFormCadastro)
    Label1: TLabel;
    lbDescricao: TLabel;
    pnInfoMatricula: TPanel;
    lbMatricula: TLabel;
    lbAluno: TLabel;
    Label5: TLabel;
    edValor: TRxCalcEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Pagamento : TPagamento;
  public
    { Public declarations }
    constructor create( obj : TEntidade; Sender : TComponent); override;
  end;

var
  FPagamento: TFPagamento;

implementation

{$R *.dfm}

{ TFPagamento }

constructor TFPagamento.create(obj: TEntidade; Sender: TComponent);
begin
  inherited;
  Pagamento := obj as TPagamento;
end;

procedure TFPagamento.FormShow(Sender: TObject);
begin
  inherited;
  lbMatricula.Caption := 'Matrícula: ' + IntToStr(Pagamento.MatriculaID);
  lbAluno.Caption := '';
  lbDescricao.Caption := Pagamento.Descricao;
  edValor.Value := Pagamento.Valor;

end;

end.
