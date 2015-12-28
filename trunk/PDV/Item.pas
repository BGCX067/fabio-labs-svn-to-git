unit Item;

interface

uses
  AClassRef;

type
  TItem = Class(TAClassRef)
  private
    FDescricao: string;
    FValorUnitario: double;
    FId: integer;
    FQuantidade: double;
  public
    function getValorTotal():String;
    function getValorUnitario():String;
    function getQuantidade():String;

    property Id : integer read FId write FId;
    property Descricao : string read FDescricao write FDescricao;
    property Quantidade : double read FQuantidade write FQuantidade;
    property ValorUnitario : double read FValorUnitario write FValorUnitario;
  End;
implementation

uses
  SysUtils;

{ TItem }

function TItem.getQuantidade: String;
begin
  Result := FormatFloat('0.000', FQuantidade);
end;

function TItem.getValorTotal: String;
var
  I: Integer;
begin
  Result := FormatFloat('0,.00', FValorUnitario * FQuantidade);
  for I := length(Result) to 8 do
    Result := ' ' + Result;
end;

function TItem.getValorUnitario: String;
var
  I: Integer;
begin
  Result := FormatFloat('0,.00', FValorUnitario);
  for I := length(Result) to 6 do
    Result := ' ' + Result;
end;

end.
