unit Reaproveitamento.Extintor.Controle;

interface

uses
  variants,
  AClassRef,
  Generics.Collections,
  Reaproveitamento.Extintor.Negocio,
  Reaproveitamento.Extintor.Repositorio,
  Reaproveitamento.Extintor.Excecoes,
  Reaproveitamento.Extintor.AppConfig;

type

  TControleExtintor = class
  public
    class function obterLista():TList<TExtintor>; overload;
    class function obterLista(AFiltroSQL : string):TList<TExtintor>; overload;
    class function obterItem(AChave :variant):TExtintor;
    class function adicionarItem(AItem :TExtintor):TExtintor;
    class function modificarItem(AItem :TExtintor):Boolean;
    class function removerItem(AItem :TExtintor):Boolean;
  end;

  TControleFabricante = class
  public
    class function obterLista():TList<TFabricante>; overload;
    class function obterLista(AFiltroSQL : string):TList<TFabricante>; overload;
    class function obterItem(AChave :variant):TFabricante;
    class function adicionarItem(AItem :TFabricante):TFabricante;
    class function modificarItem(AItem :TFabricante):Boolean;
    class function removerItem(AItem :TFabricante):Boolean;
  end;

implementation

uses
  ADPLFacade, ADPLHelper, SysUtils;

{ TControleExtintor }

class function TControleExtintor.adicionarItem(AItem: TExtintor): TExtintor;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create;
  try
    try
      // Se o ID não foi preenchido, pega um novo ID
      if AItem.Id = 0 then
        AItem.Id := TRepositorioUtilidades.obterProximoId(AItem);

       Result := Repositorio.adicionarItem(AItem);
    Except
      on e:TExcecaoAdicionar do
        Result := Repositorio.obterItem(AItem.Id);
    end;
  finally
    Repositorio.Free;
  end;
end;

class function TControleExtintor.modificarItem(AItem: TExtintor): Boolean;
//var
//  Repositorio : TRepositorioExtintor;
//begin
//  Repositorio := TRepositorioExtintor.Create;
//  try
//    try
//      // Se o ID não foi preenchido, pega um novo ID
//      Result := Repositorio.ModificarItem(AItem);
//    Except
//      on e:TExcecaoModificar do
//        Result := false;
//    end;
//  finally
//    Repositorio.Free;
//  end;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create();
  Result := Repositorio.ModificarItem(AItem);
  Repositorio.Free;
end;

class function TControleExtintor.obterItem(AChave: variant): TExtintor;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create;
  try
    Result := Repositorio.obterItem(AChave);
  finally
    Repositorio.Free;
  end;
end;

class function TControleExtintor.obterLista: TList<TExtintor>;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create;
  try
    Result := Repositorio.obterLista();
  finally
    Repositorio.Free;
  end;
end;

class function TControleExtintor.obterLista(AFiltroSQL: string): TList<TExtintor>;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create;
  try
    Result := Repositorio.obterLista(AFiltroSQL);
  finally
    Repositorio.Free;
  end;
end;

class function TControleExtintor.removerItem(AItem: TExtintor): Boolean;
var
  Repositorio : TRepositorio<TExtintor>;
begin
  Repositorio := TRepositorio<TExtintor>.Create;
  try
    Result := Repositorio.removerItem(AItem);
  finally
    Repositorio.Free;
  end;
end;

{ TControleFabricante }

class function TControleFabricante.adicionarItem(AItem: TFabricante): TFabricante;
var
  Repositorio : TRepositorioFabricante;
begin
  Repositorio := TRepositorioFabricante.Create;
  try
    try
      // Se o ID não foi preenchido, pega um novo ID
      if AItem.Id = 0 then
        AItem.Id := TRepositorioUtilidades.obterProximoId(AItem);

      // Tenta adicionar o objeto ao banco de dados
      Result := Repositorio.adicionarItem(AItem);
    Except
      // Se já existir retorna
      on E:TExcecaoAdicionar do
        Result := Repositorio.obterItem(AItem.Id);
    end;
  finally
    Repositorio.Free;
  end;
end;

class function TControleFabricante.modificarItem(AItem: TFabricante): Boolean;
begin

end;

class function TControleFabricante.obterItem(AChave: variant): TFabricante;
var
  Repositorio : TRepositorioFabricante;
begin
  Repositorio := TRepositorioFabricante.Create;
  try
    Result := Repositorio.obterItem(AChave);
  finally
    Repositorio.Free;
  end;
end;

class function TControleFabricante.obterLista: TList<TFabricante>;
begin

end;

class function TControleFabricante.obterLista(AFiltroSQL: string): TList<TFabricante>;
begin

end;

class function TControleFabricante.removerItem(AItem: TFabricante): Boolean;
begin

end;

end.
