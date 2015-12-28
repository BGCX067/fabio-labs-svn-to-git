unit ControleVenda;

interface

Uses
  AClassRef, Venda, Item;

type
  TControleVenda = Class
  Private
    class function novaVenda():TVenda;
    class procedure addItem(var AVenda : TVenda; AItem : TItem); overload;
  public
    class function addItem(ACodigo : string):TVenda; overload;
    class procedure addItem(var AVenda : TVenda; ACodigo : string); overload;
    class procedure FinalizarVenda(var AVenda : TVenda);
  End;
implementation

uses
  RepositorioItem, System.SysUtils;

{ TControleVenda }

class function TControleVenda.addItem(ACodigo: string): TVenda;
var
  RepositorioItem : TRepositorioItem;
begin
  RepositorioItem := TRepositorioItem.Create;
  try
    Result := novaVenda;
    Result.Id := 1;
    Result.Itens.Add( RepositorioItem.select( ACodigo ) );
  finally
    RepositorioItem.Free;
  end;
end;

class procedure TControleVenda.addItem(var AVenda: TVenda; ACodigo : string);
var
  RepositorioItem : TRepositorioItem;
  IndiceEncontrado : Integer;
begin
  RepositorioItem := TRepositorioItem.Create;
  try
    // Consulta o Item
    addItem(AVenda, RepositorioItem.select( ACodigo ));
  finally
    RepositorioItem.Free;
  end;
end;

class procedure TControleVenda.FinalizarVenda(var AVenda: TVenda);
begin
  AVenda.addRodapeInfo('');
  AVenda.addRodapeInfo('');
  AVenda.addRodapeInfo('');
  AVenda.addRodapeInfo('--------------------------------------------------------');
  AVenda.addRodapeInfo('Total:........................................' + AVenda.getTotalVenda);
end;

class function TControleVenda.novaVenda: TVenda;
begin
  Result := TVenda.Create;
  Result.Id := 1;
  Result.Data := now;
end;

class procedure TControleVenda.addItem(var AVenda: TVenda; AItem: TItem);
var
  IndiceEncontrado : Integer;
begin
    // se o item já estiver na lista, incrementa a quantidade
    if AVenda.Itens.BinarySearch(AItem, IndiceEncontrado) then
      AVenda.Itens[IndiceEncontrado].Quantidade := AVenda.Itens[IndiceEncontrado].Quantidade + AItem.Quantidade
    else
      AVenda.Itens.Add( AItem );
end;

end.
