unit DataModuleHtmlUnit;

interface

uses
  SysUtils, Classes;

type
  TDataModuleHtml = class(TDataModule)
  private
    { Private declarations }
  public
    function GetTitle: string;
    function GetBody: string;
  end;

//var
//  DataModuleHtml: TDataModuleHtml;

implementation

{$R *.dfm}

{ TDataModuleHtml }

function TDataModuleHtml.GetTitle: string;
begin
  Result := 'WebBroker jQueryMobile Boilerplate';
end;

function TDataModuleHtml.GetBody: string;
begin
  Result :=

 '<div data-role="page">'

+'	<div data-role="header">'
+'		<h1>Page Title</h1>'
+'	</div><!-- /header -->'

+'	<div data-role="content">'
+'		<p>Page content goes here.</p>'
+'	</div><!-- /content -->'

+'	<div data-role="footer">'
+'		<h4>Page Footer</h4>'
+'	</div><!-- /footer -->'

+'</div><!-- /page -->'

end;

end.
