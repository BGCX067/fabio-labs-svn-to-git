unit uRepositorio.Base;

interface

uses
  DBXCommon, DBClient, SqlExpr, SysUtils, DB, Variants, Forms, uObjectModel,
  mor.Attribut, mor.Entity, XMLdoc, XMLIntf, XMLDom;

type

  TRepositorioBase = class
  private
    class var FTransacao: TDBXTransaction;
    class var FConexao: TSqlConnection;
  protected
    function ObterQuery: TSQLDataSet;
  public
    procedure Insert(AEntityObject: TEntityObject); virtual;
    procedure Update(AEntityObject: TEntityObject); virtual;
    procedure Delete(AEntityObject: TEntityObject); virtual;
    function getEntityObjectById(const Id: string): TEntityObject; virtual;

    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;
    procedure IniciarTransacao;
    constructor Create;
  end;

implementation

{ TRepositorioBase }

procedure TRepositorioBase.ConfirmarTransacao;
begin
  if FConexao.InTransaction then
    FConexao.CommitFreeAndNil(FTransacao);
end;

constructor TRepositorioBase.Create;
var
  DataBaseFile, DataBaseUser, DataBasePass, XmlFile : String;
  cdsConfig : TClientDataSet;
begin
  if not Assigned(FConexao) then
  begin
    FConexao := TSqlConnection.Create(nil);
    cdsConfig := TClientDataSet.Create(nil);
    XmlFile:= ExtractFilePath(Application.ExeName) + 'sysconfig.xml';
    cdsConfig.LoadFromFile(XmlFile);
    DataBaseFile := cdsConfig.FieldByName('file').AsString;
    DataBaseUser := cdsConfig.FieldByName('user').AsString;
    DataBasePass := cdsConfig.FieldByName('password').AsString;
    try
      with FConexao do
      begin
        DriverName := 'Firebird';
        GetDriverFunc := 'getSQLDriverINTERBASE';
        LibraryName := 'dbxfb.dll';
        LoginPrompt := False;
        Params.Values['DriverUnit='] := 'Data.DBXFirebird';
        Params.Values['DriverPackageLoader'] :=
          'TDBXDynalinkDriverLoader,DbxCommonDriver160.bpl';
        Params.Values['DriverAssemblyLoader'] :=
          'Borland.Data.TDBXDynalinkDriverLoader,Borland.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b';
        Params.Values['MetaDataPackageLoader'] :=
          'TDBXFirebirdMetaDataCommandFactory,DbxFirebirdDriver160.bpl';
        Params.Values['MetaDataAssemblyLoader'] :=
          'Borland.Data.TDBXFirebirdMetaDataCommandFactory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b';
        Params.Values['GetDriverFunc'] := 'getSQLDriverINTERBASE';
        Params.Values['LibraryName'] := 'dbxfb.dll';
        Params.Values['LibraryNameOsx'] := 'libsqlfb.dylib';
        Params.Values['VendorLib'] := 'fbclient.dll';
        Params.Values['VendorLibWin64'] := 'fbclient.dll';
        Params.Values['VendorLibOsx'] :=
          '/Library/Frameworks/Firebird.framework/Firebird';
        // Params.Values['Database']:='C:\Arquivos de programas\Firebird\Firebird_1_5\examples\EMPLOYEE.FDB';
        Params.Values['Database'] := 'C:\DB\GESTAO_GAMA-PE.GDB';
        Params.Values['User_Name'] := 'sysdba';
        Params.Values['Password'] := 'masterkey';
        Params.Values['Role'] := 'RoleName';
        Params.Values['MaxBlobSize'] := '-1';
        Params.Values['LocaleCode'] := '0000';
        Params.Values['IsolationLevel'] := 'ReadCommitted';
        Params.Values['SQLDialect'] := '3';
        Params.Values['CommitRetain'] := 'False';
        Params.Values['WaitOnLocks'] := 'True';
        Params.Values['TrimChar'] := 'False';
        Params.Values['BlobSize'] := '-1';
        Params.Values['RoleName'] := 'RoleName';
        Params.Values['Trim Char'] := 'False';
        VendorLib := 'fbclient.dll';
        try
          Open;
        except
          on e: Exception do
          begin
            raise Exception.Create
              ('Não foi possível conectar-se com o Banco de Dados. ' + #13 +
              e.Message);
          end;
        end;
      end;
    Finally
      FreeAndNil(cdsConfig);
    end;
  end;
end;

procedure TRepositorioBase.Delete(AEntityObject: TEntityObject);
begin

end;

procedure TRepositorioBase.DesfazerTransacao;
begin
  if FConexao.InTransaction then
    FConexao.RollbackFreeAndNil(FTransacao);
end;

function TRepositorioBase.getEntityObjectById(const Id: string): TEntityObject;
begin

end;

procedure TRepositorioBase.IniciarTransacao;
begin
  if not FConexao.InTransaction then
    FTransacao := FConexao.BeginTransaction;
end;

procedure TRepositorioBase.Insert(AEntityObject: TEntityObject);
begin

end;

function TRepositorioBase.ObterQuery: TSQLDataSet;
begin
  Result := TSQLDataSet.Create(nil);
  Result.SQLConnection := FConexao;
end;

procedure TRepositorioBase.Update(AEntityObject: TEntityObject);
begin

end;

end.
