program WebBrokerjQueryMobileBoilerplate;
{$APPTYPE GUI}

uses
  Forms,
  WebReq,
  IdHTTPWebBrokerBridge,
  MainFormUnit in 'MainFormUnit.pas' {FormMain},
  WebModuleUnit in 'WebModuleUnit.pas' {WebModuleMain: TWebModule},
  DataModuleHtmlUnit in 'DataModuleHtmlUnit.pas' {DataModuleHtml: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
