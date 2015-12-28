unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Datasnap.DSAuth, IPPeerServer, Datasnap.DSCommonServer, UDMData;

type
  TWebModule1 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServer1: TDSServer;
   DSAuthenticationManager1: TDSAuthenticationManager;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

uses ServerMethodsUnit, Web.WebReq;

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  DM : TDMData;
  pFacilityID, pUserID : string;
begin
  DM := TDMData.Create(Self);
  try
    Response.ContentType := 'text/xml';
    if Request.PathInfo = '/Status' then
      Response.Content     := DM.f_status()
    else if Request.PathInfo = '/FacilityList' then
      Response.Content     := DM.f_facilityList()
    else if pos('/Orgs', Request.PathInfo) <> 0 then
    begin
      {bring the detartaments(?)/wards(setores) - with links to caselists(internacao)}
      //e.g.: pathInfo: /176623/Users/17695/Orgs
      //                /{FacilityID}/Users/{UserID}/Orgs
      pFacilityID      := copy(Request.PathInfo, 2, 6);
      pUserID          := copy(Request.PathInfo, 9, 6);
      Response.Content := DM.f_orgs(pFacilityID, pUserID);
    end
    else
      Response.Content := DM.f_userList();

  finally
    FreeAndNil(DM);
  end;
end;

procedure TWebModule1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods1;
end;

procedure TWebModule1.DSAuthenticationManager1UserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  valid := True;
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

