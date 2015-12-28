unit Reaproveitamento.Extintor.Repositorio;

interface

uses
  variants,
  AClassRef,
  ADPLFacade,
  Generics.Collections,
  Reaproveitamento.Extintor.Negocio,
  Reaproveitamento.Extintor.Excecoes,
  Reaproveitamento.Extintor.AppConfig;

type
  IRepositorio<T> = Interface
    function obterLista():TList<T>; overload;
    function obterLista(AFiltroSQL : string):TList<T>; overload;
    function obterItem(AChave :variant):T;
    function adicionarItem(AItem :T):T;
    function modificarItem(AItem :T):Boolean;
    function removerItem(AItem :T):Boolean;
  end;

  TRepositorioUtilidades = class
  public
    class function obterProximoId(AValue: TAClassRef): integer;
  end;

  TRepositorio<T> = class(TInterfacedObject, IRepositorio<T>)
  public
    function obterLista():TList<T>; overload;
    function obterLista(AFiltroSQL : string):TList<T>; overload;
    function obterItem(AChave :variant):T;
    function adicionarItem(AItem :T):T;
    function modificarItem(AItem :T):Boolean;
    function removerItem(AItem :T):Boolean;
  end;

//  TRepositorioExtintor = class(TInterfacedObject, IRepositorio<TExtintor>)
//  public
//    function obterLista():TList<TExtintor>; overload;
//    function obterLista(AFiltroSQL : string):TList<TExtintor>; overload;
//    function obterItem(AChave :variant):TExtintor;
//    function adicionarItem(AItem :TExtintor):TExtintor;
//    function modificarItem(AItem :TExtintor):Boolean;
//    function removerItem(AItem :TExtintor):Boolean;
//  end;
//
  TRepositorioFabricante = class(TInterfacedObject, IRepositorio<TFabricante>)
  public
    function obterLista():TList<TFabricante>; overload;
    function obterLista(AFiltroSQL : string):TList<TFabricante>; overload;
    function obterItem(AChave :variant):TFabricante;
    function adicionarItem(AItem :TFabricante):TFabricante;
    function modificarItem(AItem :TFabricante):Boolean;
    function removerItem(AItem :TFabricante):Boolean;
  end;
//
//
implementation

uses
  ADPLHelper, SysUtils;
//
//{ TRepositorioExtintor }
//
//function TRepositorioExtintor.adicionarItem(AItem: TExtintor): TExtintor;
//var
//  EmTransacao : boolean; // Valor padrão e falso;
//  Helper : THelper;
//begin
//  Helper := TADPLFacade.NewInstance.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
//  try
//    TADPLFacade.NewInstance.Insert(AItem, EmTransacao, Helper);
//  except
//    on e:Exception do
//    begin
//      Result := nil;
//      raise TExcecaoAdicionar.Create(e.Message);
//    end;
//  end;
//  Result := AItem;
//end;
//
//function TRepositorioExtintor.modificarItem(AItem: TExtintor): Boolean;
//var
//  EmTransacao : boolean; // Valor padrão e falso;
//  Helper : THelper;
//  Fac : TADPLFacade;
//begin
//  Fac := TADPLFacade.NewInstance;
//  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
//  try
//    Result := Fac.Update(AItem, EmTransacao, Helper) = 0;
//  Except
//    on e:TExcecaoModificar do
//      raise TExcecaoModificar.Create('Error ao modificar extintor!');
//  end;
//end;
//
//function TRepositorioExtintor.obterItem(AChave: variant): TExtintor;
//var
//  EmTransacao : boolean; // Valor padrão e falso;
//  Helper : THelper;
//  Fac : TADPLFacade;
//begin
//  Fac := TADPLFacade.NewInstance;
//  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
//  try
//    TAClassRef(Result) := Fac.SelectOne(TExtintor.Create, 'ID = ' + varToStr(AChave), Helper);
//  except
//    on e:TExcecaoObter do
//      raise TExcecaoObter.Create('Erro ao obter extintor!');
//  end;
//end;
//
//function TRepositorioExtintor.obterLista: TList<TExtintor>;
//begin
//  Result := Self.obterLista('');
//end;
//
//function TRepositorioExtintor.obterLista(AFiltroSQL: string): TList<TExtintor>;
//var
//  EmTransacao : boolean; // Valor padrão e falso;
//  Helper : THelper;
//  Fac : TADPLFacade;
//begin
//  Fac := TADPLFacade.NewInstance;
//  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
//  try
//    TList<TAClassRef>(Result) := Fac.Select(TExtintor.Create, AFiltroSQL, Helper);
//  except
//    on e:TExcecaoObter do
//      raise TExcecaoObter.Create('Erro ao obter a lista de extintores!');
//  end;
//end;
//
//function TRepositorioExtintor.removerItem(AItem: TExtintor): Boolean;
//var
//  EmTransacao : boolean; // Valor padrão e falso;
//  Helper : THelper;
//  Fac : TADPLFacade;
//begin
//  Fac := TADPLFacade.NewInstance;
//  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
//  try
//    Result := Fac.Delete(AItem, EmTransacao, 'ID', Helper) = 0;
//  Except
//    on e:TExcecaoModificar do
//      raise TExcecaoRemover.Create('Error ao modificar extintor!');
//  end;
//end;
//
{ TRepositorioFabricante }

function TRepositorioFabricante.adicionarItem(AItem: TFabricante): TFabricante;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
  Fac : TADPLFacade;
begin
  Fac := TADPLFacade.NewInstance;
  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    Fac.Insert(AItem, EmTransacao, Helper);
  except
    on e:Exception do
    begin
      Result := nil;
      raise TExcecaoAdicionar.Create(e.Message);
    end;
  end;
  Result := AItem;
end;

function TRepositorioFabricante.modificarItem(AItem: TFabricante): Boolean;
begin

end;

function TRepositorioFabricante.obterItem(AChave: variant): TFabricante;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
  Filter : TStringBuilder;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  Filter := TStringBuilder.Create;
  try
    Filter.Append('ID = ').Append(varToStr(AChave));
    Result := TADPLFacade.NewInstance.SelectOne(TFabricante.Create , Filter.ToString(), Helper) as TFabricante;
  except
    on e:Exception do
    begin
      Result := nil;
      raise TExcecaoObter.Create(e.Message);
    end;
  end;
end;

function TRepositorioFabricante.obterLista: TList<TFabricante>;
begin

end;

function TRepositorioFabricante.obterLista(AFiltroSQL: string): TList<TFabricante>;
begin

end;

function TRepositorioFabricante.removerItem(AItem: TFabricante): Boolean;
begin

end;

{ TRepositorio<T> }

function TRepositorio<T>.adicionarItem(AItem: T): T;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    TADPLFacade.NewInstance.Insert(TAClassRef(AItem), EmTransacao, Helper);
  except
    on e:Exception do
    begin
      raise TExcecaoAdicionar.Create(e.Message);
    end;
  end;
  Result := AItem;
end;

function TRepositorio<T>.modificarItem(AItem: T): Boolean;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    Result := TADPLFacade.NewInstance.Update(TAClassRef(AItem), EmTransacao, Helper) = 0;
  except
    on e:TExcecaoAdicionar do
    begin
      Result := false;
      raise TExcecaoAdicionar.Create('Erro ao modificar item! ' + e.Message);
    end;
  end;
end;

function TRepositorio<T>.obterItem(AChave: variant): T;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
  Fac : TADPLFacade;
begin
  Fac := TADPLFacade.NewInstance;
  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    TAClassRef(Result) := Fac.SelectOne(TExtintor.Create, 'ID = ' + varToStr(AChave), Helper);
  except
    on e:TExcecaoObter do
      raise TExcecaoObter.Create('Erro ao obter item! ' + e.Message);
  end;
end;

function TRepositorio<T>.obterLista: TList<T>;
begin
  Result := Self.obterLista('');
end;

function TRepositorio<T>.obterLista(AFiltroSQL: string): TList<T>;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
  Fac : TADPLFacade;
begin
  Fac := TADPLFacade.NewInstance;
  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    TList<TAClassRef>(Result) := Fac.Select(TExtintor.Create, AFiltroSQL, Helper);
  except
    on e:TExcecaoObter do
      raise TExcecaoObter.Create('Erro ao obter a lista! ' + e.Message);
  end;
end;

function TRepositorio<T>.removerItem(AItem: T): Boolean;
var
  EmTransacao : boolean; // Valor padrão e falso;
  Helper : THelper;
  Fac : TADPLFacade;
begin
  Fac := TADPLFacade.NewInstance;
  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    Result := Fac.Delete(TAClassRef(AItem), EmTransacao, 'ID', Helper) = 0;
  Except
    on e:TExcecaoModificar do
    begin
      Result := false;
      raise TExcecaoRemover.Create('Error ao modificar item! ' + e.Message);
    end;
  end;
end;

{ TRepositorioUtils }



{ TRepositorioUtilidades }

class function TRepositorioUtilidades.obterProximoId(AValue: TAClassRef): integer;
var
  Fac : TADPLFacade;
  Helper : THelper;
begin
  try
    Fac := TADPLFacade.NewInstance;
    Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
    try
      Result := integer(Fac.SelectMax(AValue, 'ID', '', Helper)) + 1;
    Except
      on e:EVariantTypeCastError do
        Result := 1;
    end;
  except
    on e:TExcecaoProximoId do
      raise Exception.Create('Erro ao tentar obter o proximo ID');
  end;
end;


end.
