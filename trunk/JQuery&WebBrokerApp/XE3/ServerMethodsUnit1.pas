unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TServerMethods1 = class(TDSServerModule)
    FBEMPLOYEE: TSQLConnection;
    sqlCostumers: TSQLQuery;
    dspCostumers: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

