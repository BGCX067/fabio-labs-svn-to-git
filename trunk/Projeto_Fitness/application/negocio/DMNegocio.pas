unit DMNegocio;

interface

uses
  System.SysUtils, System.Classes, DMPersistencia, Datasnap.Provider, Data.DB,
  Datasnap.DBClient;

type
  TNegocio = class(TDataModule)
    CDSUsuario: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    CDSEmpresa: TClientDataSet;
    CDSAluno: TClientDataSet;
    CDSMatricula: TClientDataSet;
    CDSProduto: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Negocio: TNegocio;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}



{$R *.dfm}

end.
