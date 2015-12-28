unit Fachada;

interface

uses
  AClassRef, Venda;

type
  TFachada = class
  public
    class function addItem(ACodigo : string):TVenda; overload;
    class procedure addItem(var AVenda : TVenda; ACodigo : string); overload;
    class procedure FinalizarVenda(var AVenda : TVenda);
  end;

implementation

uses
  ControleVenda;

{ TFachada }


{ TFachada }

class function TFachada.addItem(ACodigo: string): TVenda;
begin
  Result := TControleVenda.addItem(ACodigo);
end;

class procedure TFachada.addItem(var AVenda: TVenda; ACodigo : string);
begin
  TControleVenda.addItem(AVenda, ACodigo);
end;

class procedure TFachada.FinalizarVenda(var AVenda: TVenda);
begin
  TControleVenda.FinalizarVenda(AVenda);
end;

{ TFachada }


end.
