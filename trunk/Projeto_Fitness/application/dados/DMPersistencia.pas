unit DMPersistencia;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Data.SqlExpr;

type
  TPersistencia = class(TDataModule)
    SQLDataSet: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Persistencia: TPersistencia;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses DMDados;

{$R *.dfm}

end.
