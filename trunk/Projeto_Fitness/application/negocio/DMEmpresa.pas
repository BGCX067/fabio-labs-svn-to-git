unit DMEmpresa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TEmpresa = class(TDataModule)
    DataSetProvider: TDataSetProvider;
    CDSEmpresa: TClientDataSet;
    procedure CDSEmpresaBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Empresa: TEmpresa;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TEmpresa.CDSEmpresaBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    CDSEmpresa.FieldByName('EMPRESA_ID').AsInteger := 0;
  end;
end;

procedure TEmpresa.DataModuleCreate(Sender: TObject);
begin
  CDSEmpresa.Open;
end;

end.
