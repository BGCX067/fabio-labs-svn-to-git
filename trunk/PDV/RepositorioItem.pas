unit RepositorioItem;

interface

uses
  Item, generics.collections;

type
  TRepositorioItem = class
  public
    function select(ACodigo : string):TItem; overload;
    function select():TList<TItem>;overload;
  end;
implementation

{ TRepositorioItem }

function TRepositorioItem.select(ACodigo: string): TItem;
begin
  if ACodigo = '1' then
  begin
    Result := TItem.Create;
    Result.Id := 1;
    Result.Descricao := 'PAPEL HIGIENICO PERFUMADO FLORAL 4 ROLOS';
    Result.ValorUnitario := 4.39;
    Result.Quantidade := 1;
  end
  else
  if ACodigo = '2' then
  begin
    Result := TItem.Create;
    Result.Id := 2;
    Result.Descricao := 'PIZZA PERDIGÃO';
    Result.ValorUnitario := 9.50;
    Result.Quantidade := 2;
  end
  else
  if ACodigo = '3' then
  begin
    Result := TItem.Create;
    Result.Id := 3;
    Result.Descricao := 'DESODORANTE REXONA';
    Result.ValorUnitario := 11.90;
    Result.Quantidade := 1;
  end
  else
  if ACodigo = '4' then
  begin
    Result := TItem.Create;
    Result.Id := 4;
    Result.Descricao := 'FEIJÃO PRETO KICALDO';
    Result.ValorUnitario := 4.60;
    Result.Quantidade := 4;
  end;
end;

function TRepositorioItem.select: TList<TItem>;
begin

end;

end.
