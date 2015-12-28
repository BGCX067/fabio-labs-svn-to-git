unit FormCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Entities;

type
  TFFormCadastro = class(TForm)
    pnButtons: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor create( obj : TEntidade; Sender : TComponent); virtual;
  end;

var
  FFormCadastro: TFFormCadastro;

implementation

{$R *.dfm}

{ TFFormCadastro }



{ TFFormCadastro }

procedure TFFormCadastro.BitBtn2Click(Sender: TObject);
begin
  Self.Close;
end;

constructor TFFormCadastro.create(obj: TEntidade; Sender: TComponent);
begin
  inherited create(Sender);
end;

end.
