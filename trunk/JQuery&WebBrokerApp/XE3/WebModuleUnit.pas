unit WebModuleUnit;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPProd;

type
  TWebModuleMain = class(TWebModule)
    PageProducer1: TPageProducer;
    procedure PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleMain;

implementation

uses DataModuleHtmlUnit;

{$R *.dfm}

procedure TWebModuleMain.PageProducer1HTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
var dm: TDataModuleHtml;

begin
  dm := TDataModuleHtml.Create(nil);
  try

    if SameText(TagString, 'doctitle') then
      ReplaceText := dm.GetTitle

    else if SameText(TagString, 'docbody') then
      ReplaceText := dm.GetBody

    else
      ReplaceText := '';

  finally
    dm.Free;
  end;
end;

end.
