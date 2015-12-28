unit mor.Entity;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, mor.Attribut, Generics.Collections, Db;

Type
  TDataEngine = (deBDE, deDBEXPRESS);

  TEntity   = Class
  private
    FEntityName: String;
    FAttributes: TList<TAttribut>;
    FEntityPKName: String;
    FTargetLocation : String;
    FDataEngine: TDataEngine;
    procedure SetAttributes(const Value: TList<TAttribut>);
    procedure SetEntityName(const Value: String);
  public
    procedure builtEntityClass;
    procedure builtEntityRepositoryClass;
    procedure builtEntityControlClass;
    procedure builtEntityFacadeClass;
    property TargetLocation : String read FTargetLocation write FTargetLocation;
    property EntityName : String read FEntityName write SetEntityName;
    property EntityPKName : String read FEntityPKName write FEntityPKName;
    Property Attributes : TList<TAttribut> read FAttributes write SetAttributes;
    Property DataEngine : TDataEngine read FDataEngine write FDataEngine;
    Constructor create(pTargetLocation : String);

  End;

implementation

{ TEntity }

procedure TEntity.builtEntityClass;
Var
  EntityUnit : TStringList;
  I: Integer;
begin
  EntityUnit := TStringList.Create;
  Try
    EntityUnit.Add('unit uNegocio.'+EntityName+';');
    EntityUnit.Add('');
    EntityUnit.Add('interface');
    EntityUnit.Add('');
    EntityUnit.Add('Uses');
    EntityUnit.Add('  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,');
    EntityUnit.Add('  FMX.Types, FMX.Controls, uObjectModel;');
    EntityUnit.Add('');
    EntityUnit.Add('Type');
    EntityUnit.Add('  T'+EntityName+' = Class(TEntityObject)');
    EntityUnit.Add('  Private');
    for I := 0 to Pred(Attributes.Count) do
    begin
      EntityUnit.Add('    F'+Attributes.Items[I].AttribName+ ': String;');
    end;
    EntityUnit.Add('');
    EntityUnit.Add('  Public');
    for I := 0 to Pred(Attributes.Count) do
    begin
      EntityUnit.Add('    property '+Attributes.Items[I].AttribName+ ': String read F'+Attributes.Items[I].AttribName+ ' write F'+Attributes.Items[I].AttribName+ ';');
    end;
    EntityUnit.Add('  End;');
    EntityUnit.Add('implementation');
    EntityUnit.Add('');
    EntityUnit.Add('{ '+EntityName+' }');
    EntityUnit.Add('');
    EntityUnit.Add('end.');
  Finally
    EntityUnit.SaveToFile(TargetLocation+'\uNegocio.'+EntityName+'.pas');
    FreeAndNil(EntityUnit);
  End;
end;

procedure TEntity.builtEntityControlClass;
var
  EntityControlUnit : TStringList;
begin
///////////
///
  EntityControlUnit := TStringList.Create;
  Try
    EntityControlUnit.Add('unit uControlador.'+EntityName+';');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('interface');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('uses');
    EntityControlUnit.Add('  uControlador.Base, uObjectModel, uRepositorio.'+EntityName+', uNegocio.'+EntityName+', SysUtils;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('type');
    EntityControlUnit.Add('  TControlador_'+EntityName+' = class(TControladorBase)');
    EntityControlUnit.Add('  private');
    EntityControlUnit.Add('    FRepositorio_'+EntityName+': TRepositorio_'+EntityName+';');
    EntityControlUnit.Add('  public');
    EntityControlUnit.Add('    constructor Create;');
    EntityControlUnit.Add('    destructor Destroy; override;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('    procedure Insert(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('    procedure Update(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('    procedure Delete(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('    function getEntityObjectById(const Id: string): T'+EntityName+';');
    EntityControlUnit.Add('  end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('implementation');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('procedure TControlador_'+EntityName+'.update(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  FRepositorio_'+EntityName+'.update(AEntityObject);');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('function TControlador_'+EntityName+'.getEntityObjectById(');
    EntityControlUnit.Add('  const Id: string): T'+EntityName+';');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  Result := T'+EntityName+'(FRepositorio_'+EntityName+'.getEntityObjectById(Id));');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('constructor TControlador_'+EntityName+'.Create;');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  FRepositorio_'+EntityName+' := TRepositorio_'+EntityName+'.Create;');
    EntityControlUnit.Add('  Self.RepositorioTransacao := FRepositorio_'+EntityName+';');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('procedure TControlador_'+EntityName+'.delete(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  FRepositorio_'+EntityName+'.delete(AEntityObject);');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('destructor TControlador_'+EntityName+'.Destroy;');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  FreeAndNil(FRepositorio_'+EntityName+');');
    EntityControlUnit.Add('  inherited;');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('procedure TControlador_'+EntityName+'.insert(AEntityObject: TEntityObject);');
    EntityControlUnit.Add('begin');
    EntityControlUnit.Add('  { Aqui faremos nossas validações e regras de negócio }');
    EntityControlUnit.Add('  if not Assigned(AEntityObject) then');
    EntityControlUnit.Add('    raise Exception.Create(''Cliente não foi definido na classe Controladora.'');');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('  if (Trim(T'+EntityName+'(AEntityObject).'+EntityPKName+') = '''') then');
    EntityControlUnit.Add('    raise Exception.Create(''É obrigatório informar o CIC do cliente'');');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('  FRepositorio_'+EntityName+'.insert(AEntityObject);');
    EntityControlUnit.Add('end;');
    EntityControlUnit.Add('');
    EntityControlUnit.Add('end.');
    ///
    ///////////
  finally
    EntityControlUnit.SaveToFile(TargetLocation+'\uControlador.'+EntityName+'.pas');
    FreeAndNil(EntityControlUnit);
  end;
end;

procedure TEntity.builtEntityFacadeClass;
var
  EntityFacadeUnit : TStringList;
  I : Integer;
begin
  EntityFacadeUnit := TStringList.Create;
  try
    /////////////
    ///
    EntityFacadeUnit.Add('unit uFachada.'+EntityName+';');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('interface');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('uses');
    EntityFacadeUnit.Add('  SysUtils, Forms, Windows, uNegocio.'+EntityName+', uControlador.'+EntityName+',');
    EntityFacadeUnit.Add('  Dialogs, Classes, DBClient, Variants, DB, Controls, uObjectModel;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('type');
    EntityFacadeUnit.Add('  TFachada_'+EntityName+' = class');
    EntityFacadeUnit.Add('  private');
    EntityFacadeUnit.Add('    FControlador_'+EntityName+' : TControlador_'+EntityName+';');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('    class var FInstancia: TFachada_'+EntityName+';');
    EntityFacadeUnit.Add('  public');
    EntityFacadeUnit.Add('    class function ObterInstancia: TFachada_'+EntityName+';');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('    procedure insert(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('    procedure update(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('    procedure delete(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('    function getEntityObjectById(const Id: string): T'+EntityName+';');
    EntityFacadeUnit.Add('  end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('implementation');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('{ TFachada }');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('procedure TFachada_'+EntityName+'.update(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('begin');
    EntityFacadeUnit.Add('  FControlador_'+EntityName+' := TControlador_'+EntityName+'.Create;');
    EntityFacadeUnit.Add('  try');
    EntityFacadeUnit.Add('    FControlador_'+EntityName+'.update(AEntityObject);');
    EntityFacadeUnit.Add('  finally');
    EntityFacadeUnit.Add('    FreeAndNil(FControlador_'+EntityName+');');
    EntityFacadeUnit.Add('  end;');
    EntityFacadeUnit.Add('end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('function TFachada_'+EntityName+'.getEntityObjectById(const Id: string): T'+EntityName+';');
    EntityFacadeUnit.Add('begin');
    EntityFacadeUnit.Add('  FControlador_'+EntityName+' := TControlador_'+EntityName+'.Create;');
    EntityFacadeUnit.Add('  try');
    EntityFacadeUnit.Add('    { Pesquisa pelo CIC }');
    EntityFacadeUnit.Add('    Result := FControlador_'+EntityName+'.getEntityObjectById(Id);');
    EntityFacadeUnit.Add('  finally');
    EntityFacadeUnit.Add('    FreeAndNil(FControlador_'+EntityName+');');
    EntityFacadeUnit.Add('  end;');
    EntityFacadeUnit.Add('end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('procedure TFachada_'+EntityName+'.delete(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('begin');
    EntityFacadeUnit.Add('  FControlador_'+EntityName+' := TControlador_'+EntityName+'.Create;');
    EntityFacadeUnit.Add('  try');
    EntityFacadeUnit.Add('    FControlador_'+EntityName+'.delete(AEntityObject);');
    EntityFacadeUnit.Add('  finally');
    EntityFacadeUnit.Add('    FreeAndNil(FControlador_'+EntityName+');');
    EntityFacadeUnit.Add('  end;');
    EntityFacadeUnit.Add('end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('procedure TFachada_'+EntityName+'.insert(AEntityObject: TEntityObject);');
    EntityFacadeUnit.Add('begin');
    EntityFacadeUnit.Add('  FControlador_'+EntityName+' := TControlador_'+EntityName+'.Create;');
    EntityFacadeUnit.Add('  try');
    EntityFacadeUnit.Add('    FControlador_'+EntityName+'.insert(AEntityObject);');
    EntityFacadeUnit.Add('  finally');
    EntityFacadeUnit.Add('    FreeAndNil(FControlador_'+EntityName+');');
    EntityFacadeUnit.Add('  end;');
    EntityFacadeUnit.Add('end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('class function TFachada_'+EntityName+'.ObterInstancia: TFachada_'+EntityName+';');
    EntityFacadeUnit.Add('begin');
    EntityFacadeUnit.Add('  if not Assigned(FInstancia) then');
    EntityFacadeUnit.Add('    FInstancia := TFachada_'+EntityName+'.Create;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('  Result := FInstancia;');
    EntityFacadeUnit.Add('end;');
    EntityFacadeUnit.Add('');
    EntityFacadeUnit.Add('end.');
    /////////////
  finally
    EntityFacadeUnit.SaveToFile(TargetLocation+'\uFachada.'+EntityName+'.pas');
    FreeAndNil(EntityFacadeUnit);
  end;
end;

procedure TEntity.builtEntityRepositoryClass;
var
  EntityRepositotyUnit : TStringList;
  I : Integer;
  sDataSetType : string;
begin
  try
    EntityRepositotyUnit := TStringList.Create;
    case DataEngine of
      deBDE:sDataSetType := 'TQuery';
      deDBEXPRESS:sDataSetType := ''+sDataSetType+'';
    end;
    /////////////
    ///
    EntityRepositotyUnit.Add('unit uRepositorio.'+EntityName+';');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('interface');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('uses');
    EntityRepositotyUnit.Add('  uRepositorio.Base, uObjectModel, uNegocio.'+EntityName+', SqlExpr;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('type');
    EntityRepositotyUnit.Add('  TRepositorio_'+EntityName+' = class(TRepositorioBase)');
    EntityRepositotyUnit.Add('  private');
    EntityRepositotyUnit.Add('    function QueryToEntityObject(Query: '+sDataSetType+'): TEntityObject;');
    EntityRepositotyUnit.Add('  public');
    EntityRepositotyUnit.Add('    procedure Insert(AEntityObject: TEntityObject);override;');
    EntityRepositotyUnit.Add('    procedure Update(AEntityObject: TEntityObject);override;');
    EntityRepositotyUnit.Add('    procedure Delete(AEntityObject: TEntityObject);override;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('    function getEntityObjectById(const Id: string): TEntityObject;override;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('implementation');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('{ TRepositorioCliente }');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('procedure TRepositorio_'+EntityName+'.Update(AEntityObject: TEntityObject);');
    EntityRepositotyUnit.Add('var');
    EntityRepositotyUnit.Add('  LQuery: '+sDataSetType+';');
    EntityRepositotyUnit.Add('begin');
    EntityRepositotyUnit.Add('  with ObterQuery do');
    EntityRepositotyUnit.Add('  begin');
    EntityRepositotyUnit.Add('    try');
    EntityRepositotyUnit.Add('      CommandText :=');
    for I := 0 to Pred(Attributes.Count) do
    begin
      if I = 0 then
        EntityRepositotyUnit.Add('''      UPDATE '+EntityName+' SET '+Attributes.Items[I].AttribName+' = :p'+Attributes.Items[I].AttribName+'''+');

      EntityRepositotyUnit.Add('''            ,'+Attributes.Items[I].AttribName+' = :p'+Attributes.Items[I].AttribName+'''+');
    end;
    EntityRepositotyUnit.Add('''       WHERE '+EntityName+ '.'+EntityPKName+' = :p'+EntityPKName+''';');
    for I := 0 to Pred(Attributes.Count) do
    begin
      EntityRepositotyUnit.Add('      ParamByName(''p'+Attributes.Items[I].AttribName+''').AsString := T'+EntityName+'(AEntityObject).'+Attributes.Items[I].AttribName+';');
    end;
    EntityRepositotyUnit.Add('      ParamByName(''p'+EntityPKName+''').AsString := T'+EntityName+'(AEntityObject).'+EntityPKName+';');
    EntityRepositotyUnit.Add('      ExecSQL();');
    EntityRepositotyUnit.Add('    finally');
    EntityRepositotyUnit.Add('      Free;');
    EntityRepositotyUnit.Add('    end;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('function TRepositorio_'+EntityName+'.getEntityObjectById(const Id: string): TEntityObject;');
    EntityRepositotyUnit.Add('var');
    EntityRepositotyUnit.Add('  LQuery: '+sDataSetType+';');
    EntityRepositotyUnit.Add('begin');
    EntityRepositotyUnit.Add('  Result := nil;');
    EntityRepositotyUnit.Add('  LQuery := ObterQuery;');
    EntityRepositotyUnit.Add('  try');
    EntityRepositotyUnit.Add('    with LQuery do');
    EntityRepositotyUnit.Add('    begin');
    EntityRepositotyUnit.Add('      CommandText :=');
    for I := 0 to Pred(Attributes.Count) do
    begin
      if I = 0 then
        EntityRepositotyUnit.Add('    ''  SELECT '+Attributes.Items[I].AttribName+'''+')
      else
        EntityRepositotyUnit.Add('    ''        ,'+Attributes.Items[I].AttribName+'''+');
    end;
    EntityRepositotyUnit.Add('    ''    FROM '+ EntityName+'''+');
    EntityRepositotyUnit.Add('    ''   WHERE '+ EntityName + '.'+EntityPKName+' = :p'+EntityPKName+''';');
    EntityRepositotyUnit.Add('      ParamByName(''p'+EntityPKName+''').AsString := Id;');
    EntityRepositotyUnit.Add('      Open;');
    EntityRepositotyUnit.Add('      if not IsEmpty then Result := QueryToEntityObject(LQuery);');
    EntityRepositotyUnit.Add('    end;');
    EntityRepositotyUnit.Add('  finally');
    EntityRepositotyUnit.Add('    LQuery.Free;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('procedure TRepositorio_'+EntityName+'.delete(AEntityObject: TEntityObject);');
    EntityRepositotyUnit.Add('var');
    EntityRepositotyUnit.Add('  LQuery: '+sDataSetType+';');
    EntityRepositotyUnit.Add('begin');
    EntityRepositotyUnit.Add('  with ObterQuery do');
    EntityRepositotyUnit.Add('  begin');
    EntityRepositotyUnit.Add('    try');
    EntityRepositotyUnit.Add('      CommandText :=');
    EntityRepositotyUnit.Add('''      DELETE FROM '+EntityName+'''+');
    EntityRepositotyUnit.Add('''       WHERE '+EntityName+ '.'+EntityPKName+' = :p'+EntityPKName+''';');
    EntityRepositotyUnit.Add('      ParamByName(''p'+EntityPKName+''').AsString := T'+EntityName+'(AEntityObject).'+EntityPKName+';');
    EntityRepositotyUnit.Add('      ExecSQL();');
    EntityRepositotyUnit.Add('    finally');
    EntityRepositotyUnit.Add('      Free;');
    EntityRepositotyUnit.Add('    end;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('procedure TRepositorio_'+EntityName+'.insert(AEntityObject: TEntityObject);');
    EntityRepositotyUnit.Add('begin');
    EntityRepositotyUnit.Add('  with ObterQuery do');
    EntityRepositotyUnit.Add('  begin');
    EntityRepositotyUnit.Add('    try');
    EntityRepositotyUnit.Add('      CommandText :=');
    for I := 0 to Pred(Attributes.Count) do
    begin
      {TODO: Verificar se o campo é autoincremento, se for repover do insert para evitar erros}

      if I = 0 then
        EntityRepositotyUnit.Add('''      INSERT INTO ('+Attributes.Items[I].AttribName+'''+')
      else
        EntityRepositotyUnit.Add('''            ,'+Attributes.Items[I].AttribName+'''+');
    end;
    EntityRepositotyUnit.Add(''')''+');
    for I := 0 to Pred(Attributes.Count) do
    begin
      {TODO: Verificar se o campo é autoincremento, se for repover do insert para evitar erros}

      if I = 0 then
        EntityRepositotyUnit.Add('''         VALUES( :p'+Attributes.Items[I].AttribName+'''+')
      else
        EntityRepositotyUnit.Add('''            ,:p'+Attributes.Items[I].AttribName+'''+');
    end;
    EntityRepositotyUnit.Add(''')'';');

    EntityRepositotyUnit.Add('');
    for I := 0 to Pred(Attributes.Count) do
    begin
      {TODO: Verificar se o campo é autoincremento, se for repover do insert para evitar erros}
      EntityRepositotyUnit.Add('      ParamByName('''+Attributes.Items[I].AttribName+''').AsString := T'+EntityName+ '(AEntityObject).'+Attributes.Items[I].AttribName+';');
    end;
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('      ExecSQL();');
    EntityRepositotyUnit.Add('    finally');
    EntityRepositotyUnit.Add('      Free;');
    EntityRepositotyUnit.Add('    end;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('function TRepositorio_'+EntityName+'.QueryToEntityObject(Query: '+sDataSetType+'): TEntityObject;');
    EntityRepositotyUnit.Add('var');
    EntityRepositotyUnit.Add('  o'+EntityName+' : T'+EntityName+';');
    EntityRepositotyUnit.Add('begin');
    EntityRepositotyUnit.Add('  o'+EntityName+' := T'+EntityName+'.Create;');
    EntityRepositotyUnit.Add('  with Query do');
    EntityRepositotyUnit.Add('  begin');
    EntityRepositotyUnit.Add('    if not IsEmpty then');
    EntityRepositotyUnit.Add('    begin');
    for I := 0 to Pred(Attributes.Count) do
    begin
      EntityRepositotyUnit.Add('      o'+EntityName+'.'+Attributes.Items[I].AttribName+' := FieldByName('''+Attributes.Items[I].AttribName+''').AsString;');
    end;
    EntityRepositotyUnit.Add('    end;');
    EntityRepositotyUnit.Add('  end;');
    EntityRepositotyUnit.Add('  Result := o'+EntityName+';');
    EntityRepositotyUnit.Add('end;');
    EntityRepositotyUnit.Add('');
    EntityRepositotyUnit.Add('end.');
    ///
    /////////////
  finally
    EntityRepositotyUnit.SaveToFile(TargetLocation+'\uRepositorio.'+EntityName+'.pas');
    FreeAndNil(EntityRepositotyUnit);
  end;
end;

constructor TEntity.create(pTargetLocation : String);
begin
  Attributes := TList<TAttribut>.Create();
  Self.TargetLocation := pTargetLocation;
end;

procedure TEntity.SetAttributes(const Value: TList<TAttribut>);
begin
  FAttributes := Value;
end;

procedure TEntity.SetEntityName(const Value: String);
begin
  FEntityName := Value;
end;

end.
