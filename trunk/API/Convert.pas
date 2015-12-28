unit Convert;

interface

uses
  ObjectDataSet, Generics.Collections, DBClient, SysUtils;

type
  TArrayOfObject = array of TObject;

  TConvert = class
  private
    DataSetFromObjectList: TDataSetFromObjectList;
    ObjectListFromDataSet: TObjectListFromDataSet;
  public
    class function ObjectArrayToDataSet(ArrayOfObject : TArrayOfObject): TClientDataSet;
    class function ObjectListToDataSet(ObjectList : TList<TObject>): TClientDataSet;
    class function ObjectToDataSet(aObject: TObject): TClientDataSet;
    class function DataSetToObject(ClientDataSet : TClientDataSet; ClassType : TClass): TList<TObject>;

  end;
implementation

{ TConvert }

class function TConvert.DataSetToObject(ClientDataSet: TClientDataSet; ClassType: TClass): TList<TObject>;
begin
  Result := TObjectListFromDataSet.getObjectListFromDataSet(ClientDataSet, ClassType);
end;

class function TConvert.objectArrayToDataSet(ArrayOfObject: TArrayOfObject): TClientDataSet;
var
  ObjectList : TList<TObject>;
  aObject : TObject;
begin
  // Verifica se o array possui itens
  if Length( ArrayOfObject ) = 0 then
    raise Exception.Create('Impossivel converter um array vazio!');

  ObjectList := TList<TObject>.Create;
  for aObject in ArrayOfObject do
    ObjectList.Add( aObject );
  Result := ObjectListToDataSet( ObjectList );
end;

class function TConvert.ObjectListToDataSet(ObjectList: TList<TObject>): TClientDataSet;
begin
  Result := TDataSetFromObjectList.getDataSetFromObjectList(ObjectList);
end;

class function TConvert.ObjectToDataSet(aObject: TObject): TClientDataSet;
begin
  Result := TDataSetFromObjectList.getDataSetFromObject(aObject);
end;

end.
