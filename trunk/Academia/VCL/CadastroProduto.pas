unit CadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormCadastro, StdCtrls, Buttons, ExtCtrls, Entities, Mask, rxToolEdit, rxCurrEdit;

type
  TFCadastroProduto = class(TFFormCadastro)
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    RxCalcEdit1: TRxCalcEdit;
  private
    { Private declarations }
    Produto : TProduto;
  public
    { Public declarations }
    constructor create( obj : TEntidade; Sender : TComponent); override;
  end;

var
  FCadastroProduto: TFCadastroProduto;

implementation

{$R *.dfm}

{ TFCadastroProduto }

constructor TFCadastroProduto.create(obj: TEntidade; Sender: TComponent);
begin
  inherited create(obj, Sender);
  Produto := obj as TProduto;
end;

end.
