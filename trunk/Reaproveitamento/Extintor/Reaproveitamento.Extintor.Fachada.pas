unit Reaproveitamento.Extintor.Fachada;

interface

uses
  variants,
  Generics.Collections,
  Reaproveitamento.Extintor.Negocio, Reaproveitamento.Extintor.Controle;

type
  TFachada = class
  public
    // Métodos de Extintor
    class function obterListaDeExtintores():TList<TExtintor>; overload;
    class function obterListaDeExtintores(AFiltroSQL : string):TList<TExtintor>; overload;
    class function obterExtintor(AChave :variant):TExtintor;overload;
    class function adicionarExtintor(AItem :TExtintor):TExtintor;overload;
    class function modificarExtintor(AItem :TExtintor):Boolean;overload;
    class function removerExtintor(AItem :TExtintor):Boolean; overload;

    // Métodos do Fabricante
    class function obterListaDeFabricantes():TList<TFabricante>; overload;
    class function obterListaDeFabricantes(AFiltroSQL : string):TList<TFabricante>; overload;
    class function obterFabricante(AChave :variant):TFabricante;overload;
    class function adicionarFabricante(AItem :TFabricante):TFabricante;overload;
    class function modificarFabricante(AItem :TFabricante):Boolean;overload;
    class function removerFabricante(AItem :TFabricante):Boolean;overload;
  end;

implementation

{ TFachada }

class function TFachada.adicionarExtintor(AItem: TExtintor): TExtintor;
begin
  Result := TControleExtintor.adicionarItem(AItem);
end;

class function TFachada.modificarExtintor(AItem: TExtintor): Boolean;
begin
  Result := TControleExtintor.modificarItem(AItem);
end;

class function TFachada.obterExtintor(AChave: variant): TExtintor;
begin

end;

class function TFachada.obterListaDeExtintores: TList<TExtintor>;
begin

end;

class function TFachada.obterListaDeExtintores(AFiltroSQL: string): TList<TExtintor>;
begin

end;

class function TFachada.removerExtintor(AItem: TExtintor): Boolean;
begin

end;

class function TFachada.adicionarFabricante(AItem: TFabricante): TFabricante;
begin
  Result := TControleFabricante.adicionarItem(AItem);
end;

class function TFachada.modificarFabricante(AItem: TFabricante): Boolean;
begin

end;

class function TFachada.obterFabricante(AChave: variant): TFabricante;
begin
  Result := TControleFabricante.obterItem(AChave);
end;

class function TFachada.obterListaDeFabricantes: TList<TFabricante>;
begin

end;

class function TFachada.obterListaDeFabricantes(AFiltroSQL: string): TList<TFabricante>;
begin

end;

class function TFachada.removerFabricante(AItem: TFabricante): Boolean;
begin

end;

end.
