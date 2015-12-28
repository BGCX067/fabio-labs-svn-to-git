unit DMUsuario;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider, EncdDecd;

type
  TUsuario = class(TDataModule)
    DataSetProvider: TDataSetProvider;
    CDSUsuario: TClientDataSet;
    procedure CDSUsuarioBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Encode(const Input: string): AnsiString;
    function Decode(const Input: AnsiString): string;
  public
    { Public declarations }
    function verificaCrediciais(usuario, senha : string):boolean;
  end;

var
  Usuario: TUsuario;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses DMPersistencia;

{$R *.dfm}

{ TDataModule1 }

procedure TUsuario.CDSUsuarioBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    CDSUsuario.FieldByName('USUARIO_ID').AsInteger := 0;
    CDSUsuario.FieldByName('USUARIO_SENHA').AsString := Encode(CDSUsuario.FieldByName('USUARIO_SENHA').AsString);
  end;
end;

procedure TUsuario.DataModuleCreate(Sender: TObject);
begin
  CDSUsuario.Open;
end;

function TUsuario.Decode(const Input: AnsiString): string;
var
  bytes: TBytes;
  utf8: UTF8String;
begin
  bytes := EncdDecd.DecodeBase64(Input);
  SetLength(utf8, Length(bytes));
  Move(Pointer(bytes)^, Pointer(utf8)^, Length(bytes));
  Result := string(utf8);
end;

function TUsuario.Encode(const Input: string): AnsiString;
var
  utf8: UTF8String;
begin
  utf8 := UTF8String(Input);
  Result := EncdDecd.EncodeBase64(PAnsiChar(utf8), Length(utf8));
end;

function TUsuario.verificaCrediciais(usuario, senha: string): boolean;
begin
  try
    CDSUsuario.Filter := 'USUARIO_LOGIN = ' + QuotedStr( usuario );
    CDSUsuario.Filtered := True;
    Result := (CDSUsuario.RecordCount = 1) and
              (CDSUsuario.FieldByName('USUARIO_SENHA').AsString = Encode( senha ));
  finally
    CDSUsuario.Filter := EmptyStr;
    CDSUsuario.Filtered := False;
  end;
end;

end.
