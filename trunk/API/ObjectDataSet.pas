{
********************************************************************************
* Fonte:> ObjectDataSet
* Projeto:> Agfa.API
* Responsável:> axnfk - Fábio Lindemberg
* Data da criação:> 21/02/2014
* Objetivo:> Permitir a criação de uma lista generica apartir de um clientDataSet
*            Permitir a criação de um ClientDataSer apartir de uma Lista generica
* Atualizações:>*****************************************************
* Data da atualização:>
* Responsável:>
* Objetivo:>
********************************************************************************
}
unit ObjectDataSet;

interface

uses
  Generics.Collections, DBClient, DB, Classes, SysUtils, Rtti, InvokeRegistry, XSBuiltIns;

type

TGenericsFieldType = (
	gftUnknown,
	gftString,
	ftSmallint,
  gftInteger,
	gftWord,
  gftBoolean,
	gftFloat,
	gftCurrency,
	gftBCD,
	gftDate,
	gftTime,
	gftDateTime,
	gftBytes,
	gftVarBytes,
	gftAutoInc,
	gftBlob,
	gftMemo,
	gftGraphic,
	gftFmtMemo,
	gftParadoxOle,
	gftDBaseOle,
	gftTypedBinary,
	gftCursor,
	gftFixedChar,
	gftWideString,
	gftLargeint,
	gftADT,
	gftArray,
	gftReference,
	gftDataSet,
	gftOraBlob,
	gftOraClob,
	gftVariant,
	gftInterface,
	gftIDispatch,
	gftGuid,
	gftTimeStamp,
	gftFMTBcd,
	gftFixedWideChar,
	gftWideMemo,
	gftOraTimeStamp,
	gftOraInterval,
	gftLongWord,
	gftShortint,
	gftByte,
	gftExtended,
	gftConnection,
	gftParams,
	gftStream,
	gftTimeStampOffset,
	gftObject,
	gftSingle,
  gftXSDecimal,
  gtTStringBuilder,
  gtTJPEGImage
);

  InternalFieldProperties = record
    name : string;
    ftype : TGenericsFieldType;
    Size : Integer;
    required : Boolean;
  end;

  // Obtem um ClientDataSet Populado apartir de uma Lista de objetos (getDataSetFromObjectList)
  // ou apartir de um único objeto (getDataSetFromObject)
  TDataSetFromObjectList = class
  private
    class function getFieldProperties(Item : TObject; RTTIType : TRttiType):TList<InternalFieldProperties>;
    class function getFieldType(PropertyType: String): TGenericsFieldType;
    class function getObjectListDataSet(FieldProperties : TList<InternalFieldProperties>):TClientDataSet;
    class function getPopulatedDataSet(ClientDataSet : TClientDataSet; ObjectList: TList<TObject>; RTTIType : TRttiType):TClientDataSet;
  public
    class function getDataSetFromObjectList(ObjectList: TList<TObject>): TClientDataSet;
    class function getDataSetFromObject(oObject: TObject): TClientDataSet;
  end;

  // Obtem a lista do objeto do tipo passado como parametro (ClassType) a partir do dataset ClientDataSet
  TObjectListFromDataSet = class
    class function getPopulatedObjectList(ClientDataSet : TClientDataSet; RTTIType : TRttiType):TList<TObject>;
  public
    class function getObjectListFromDataSet(ClientDataSet : TClientDataSet; ClassType : TClass):TList<TObject>;
  end;

implementation

{ TObjectDataSet }

class function TDataSetFromObjectList.getDataSetFromObject(oObject: TObject): TClientDataSet;
var
  ObjectList : TList<TObject>;
begin
  ObjectList := TList<TObject>.Create;
  ObjectList.Add(oObject);
  // Este método recebe um único objeto o inclui na lista e chama o método getDataSetFromObjectList
  Result := getDataSetFromObjectList( ObjectList );
end;

class function TDataSetFromObjectList.getDataSetFromObjectList(ObjectList: TList<TObject>): TClientDataSet;
var
  samplingObjectItem : TObject; // representa o tipo do objeto inserido na lista usado para amostragem
  RTTIContext : TRttiContext;
  RTTIType : TRttiType;
begin
  // Coletando uma amostra de tipo para acilitar o ententimento da rotina
  samplingObjectItem := ObjectList[0];

  // Criando o contexto RTTI
  RTTIContext := TRttiContext.Create;

  // A classe TRttiType dispõe de métodos para pesquisar características do tipo como: propriedades, campos, métodos e atributos.
  RTTIType := RTTIContext.GetType( samplingObjectItem.ClassType );

  // Montando o ClientDataSet baseado nas propriedades dos campos (FieldProperties)
  Result := getPopulatedDataSet( getObjectListDataSet( getFieldProperties(samplingObjectItem, RTTIType) ) , ObjectList, RTTIType );
end;

class function TDataSetFromObjectList.getFieldProperties(Item: TObject; RTTIType: TRttiType): TList<InternalFieldProperties>;
var
  RTTIProperty : TRttiProperty;
  FieldProperties : InternalFieldProperties;
  CustomAttribute : TCustomAttribute;
begin
  // este método retorna as propriedades dos tipos conhecidos
  Result := TList<InternalFieldProperties>.Create;
  for RTTIProperty in RTTIType.GetDeclaredProperties do
  begin
    FieldProperties.name := RTTIProperty.Name;
    FieldProperties.ftype := getFieldType(RTTIProperty.PropertyType.ToString);
    case FieldProperties.ftype of
      gftString: FieldProperties.Size := 256; //Char
    else
      FieldProperties.Size := 0;
    end;
    Result.Add(FieldProperties);
  end;
end;

class function TDataSetFromObjectList.getFieldType(PropertyType: String): TGenericsFieldType;
begin
  PropertyType := LowerCase(PropertyType);
  if (PropertyType = 'string') or
     (PropertyType = 'widestring') or
     (PropertyType = 'ansistring') then
    Result := gftString
  else if (PropertyType = 'integer') or
          (PropertyType = 'int64') then
    Result := gftInteger
  else if (PropertyType = 'float') or
          (PropertyType = 'double') then
    Result := gftFloat
  else if (PropertyType = 'tdatetime') then
    Result := gftDateTime
  else if (PropertyType = 'boolean') then
    Result := gftBoolean
  else if (PropertyType = 'txsdecimal') then
    Result := gftXSDecimal
  else if (PropertyType = 'tstringbuilder') then
    Result := gtTStringBuilder
  else
    Result := gftUnknown;
end;

class function TDataSetFromObjectList.getObjectListDataSet(FieldProperties : TList<InternalFieldProperties>): TClientDataSet;
var
  FP : InternalFieldProperties;
  FieldType : TFieldType;
begin
  // Método responsável por criar a estrutura de campos no ClientDataSet
  Result := TClientDataSet.Create( nil );
  for FP in FieldProperties do
  begin
    case FP.ftype of
     gftUnknown:Continue;
     gftXSDecimal:FieldType := ftFloat;
     gtTStringBuilder:FieldType := ftMemo;
    else
      FieldType := TFIeldType(FP.ftype);
    end;

    Result.FieldDefs.Add(
      FP.name,
      FieldType,
      FP.Size,
      false);
  end;
  Result.CreateDataSet;
end;

class function TDataSetFromObjectList.getPopulatedDataSet(ClientDataSet : TClientDataSet; ObjectList: TList<TObject>; RTTIType : TRttiType): TClientDataSet;
var
  RTTIProperty : TRttiProperty;
  ObjectItem : TObject;
begin
  {
    Este método é responsavel por popular os datasets com as informações da lista de objetos
    recebe como parametro de entrada: o array estrututano e retornado pelo método getObjectListDataSet,
    a lista de objetos e o RTTIProperty contextualizado .
  }
  for ObjectItem in ObjectList do
  begin
    if not Assigned(ObjectItem) then
      Continue;
    ClientDataSet.Append;
    for RTTIProperty in RTTIType.GetDeclaredProperties do
    begin

      if ClientDataSet.FindField( RTTIProperty.Name ) <> nil then
      begin
        if (LowerCase( RTTIProperty.PropertyType.ToString ) = 'txsdecimal') then
          ClientDataSet.FieldByName( RTTIProperty.Name ).AsFloat := StrToFloat( TXSDecimal( RTTIProperty.GetValue( ObjectItem ).AsObject ).NativeToXS )
        else if (LowerCase( RTTIProperty.PropertyType.ToString ) = 'tdateedit') then
          ClientDataSet.FieldByName( RTTIProperty.Name ).AsFloat := RTTIProperty.GetValue( ObjectItem ).AsType<TDateTime>
        else if (LowerCase( RTTIProperty.PropertyType.ToString ) = 'tstringbuilder') then
        begin
          if RTTIProperty.GetValue( ObjectItem ).AsType<TStringBuilder> <> nil then
          
          ClientDataSet.FieldByName( RTTIProperty.Name ).AsString := RTTIProperty.GetValue( ObjectItem ).AsType<TStringBuilder>.ToString()
        end
        else
          ClientDataSet.FieldByName( RTTIProperty.Name ).AsVariant := RTTIProperty.GetValue( ObjectItem ).ToString;

      end;
    end;
    ClientDataSet.Post;
  end;
  Result := ClientDataSet;
end;

{ TObjectListFromDataSet }

class function TObjectListFromDataSet.getObjectListFromDataSet(ClientDataSet: TClientDataSet;
  ClassType: TClass): TList<TObject>;
var
  RTTIContext : TRttiContext;
  RTTIType : TRTTIType;
begin
  // Criando o contexto RTTI
  RTTIContext := TRttiContext.Create;

  // A classe TRttiType dispõe de métodos para pesquisar características do tipo como: propriedades, campos, métodos e atributos.
  RTTIType := RTTIContext.GetType(ClassType);

  // Retorna a lista de objetos populada
  Result := getPopulatedObjectList(ClientDataSet, RTTIType);
end;

class function TObjectListFromDataSet.getPopulatedObjectList(ClientDataSet: TClientDataSet;
  RTTIType: TRttiType): TList<TObject>;
var
  I : Integer;
  RTTIProperty : TRTTIProperty;
  ItemObject : TObject;
  List : TList<TObject>;
begin
  {
    Este método é responsavel por popular a lista de objetos com as informações
    contidas no dataset ClientDataSet.
  }
  List := TList<TObject>.Create;
  ClientDataSet.First;
  while not(ClientDataSet.Eof) do
  begin
    ItemObject := RTTIType.ClassType.Create;
    for I := 0 to ClientDataSet.FieldCount - 1 do
    begin
      RTTIProperty := RTTIType.GetProperty( ClientDataSet.Fields[I].FieldName );
      case ClientDataSet.Fields[I].DataType of
        ftString:RTTIProperty.SetValue(ItemObject, ClientDataSet.Fields[I].AsString);
        ftInteger:RTTIProperty.SetValue(ItemObject, ClientDataSet.Fields[I].AsInteger);
        ftFloat:RTTIProperty.SetValue(ItemObject, ClientDataSet.Fields[I].AsFloat);
        ftDateTime:RTTIProperty.SetValue(ItemObject, ClientDataSet.Fields[I].AsDateTime);
      end;
    end;
    List.Add( ItemObject );
    ClientDataSet.Next;
  end;
  Result := List;
end;

end.
