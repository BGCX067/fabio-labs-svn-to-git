program HTTPsMobileServer;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FHTTPServer in '..\FHTTPServer.pas' {Form1},
  ServerMethodsUnit in '..\ServerMethodsUnit.pas',
  WebModuleUnit in '..\WebModuleUnit.pas' {WebModule1: TWebModule},
  UDMData in '..\UDMData.pas' {DMData: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMData, DMData);
  Application.Run;
end.
