unit DataModuleHtmlUnit;

interface

uses
  SysUtils, Classes, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr;

type
  TDataModuleHtml = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsCustomers: TClientDataSet;
    cdsCustomersADDRESS_LINE1: TStringField;
    cdsCustomersADDRESS_LINE2: TStringField;
    cdsCustomersCITY: TStringField;
    cdsCustomersCONTACT_FIRST: TStringField;
    cdsCustomersCONTACT_LAST: TStringField;
    cdsCustomersCOUNTRY: TStringField;
    cdsCustomersCUST_NO: TIntegerField;
    cdsCustomersDESC: TStringField;
    cdsCustomersON_HOLD: TStringField;
    cdsCustomersPHONE_NO: TStringField;
    cdsCustomersPOSTAL_CODE: TStringField;
    cdsCustomersSTATE_PROVINCE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    PageClients : TStringList;
    function getCostumers() : string;
    function getCostumersPages() : string;
    function addCustomerPage(CustNO, Name, Phone, Address : string) : string;
  public
    function GetTitle: string;
    function GetBody: string;
  end;

//var
//  DataModuleHtml: TDataModuleHtml;

implementation

{$R *.dfm}

{ TDataModuleHtml }

function TDataModuleHtml.getCostumers: string;
var
  ch : char;
  s,page : string;
begin
 try
   cdsCustomers.Open;
   while not(cdsCustomers.Eof) do
   begin
     s := cdsCustomersDESC.AsString;
     if ch <> s[1] then
     begin
       ch := s[1];
       Result := Result +
       '<li data-role="list-divider">' + ch + '</li>';
     end;
     Result := Result +
     '		  <li><a href="#'+cdsCustomersCUST_NO.AsString+'">'+ cdsCustomersDESC.AsString + '</a></li>';
     page := addCustomerPage(cdsCustomersCUST_NO.AsString,
                             cdsCustomersDESC.AsString,
                             cdsCustomersPHONE_NO.AsString,
                             cdsCustomersADDRESS_LINE1.AsString);
     PageClients.Add(page);

     cdsCustomers.Next;
   end;
 finally
   cdsCustomers.Close;
 end;

 getCostumersPages();
end;

function TDataModuleHtml.getCostumersPages: string;
begin
 Result := '';
end;

function TDataModuleHtml.GetTitle: string;
begin
  Result := 'WebBroker jQueryMobile Boilerplate';
end;

function TDataModuleHtml.addCustomerPage(CustNO, Name, Phone, Address: string): string;
begin
     Result :=
      '<div data-role="page" id="'+ CustNO +'">'
     +'	<div data-role="header">'
     +'		<h1>Customer: '+CustNO+'</h1>'
     +'	</div><!-- /header -->'
     +'	<div data-role="content">'
     +'		<p>Customer Information</p>'
     +'		<ul data-role="listview">'
     +'		  <li>Name:'+Name+'</li>'
     +'		  <li>Phone:'+Phone+'</li>'
     +'		  <li>Address:'+Address+'</li>'
     +'		</ul>'
     +'	</div><!-- /content -->'
     +'	<div data-role="footer">'
     +'		<h4>Delphi is cool!</h4>'
     +'	</div><!-- /footer -->'
    +'</div><!-- /page -->';

end;

procedure TDataModuleHtml.DataModuleCreate(Sender: TObject);
begin
  PageClients := TStringList.Create;
end;

function TDataModuleHtml.GetBody: string;
begin
  Result :=

 '<div data-role="page" id="main" data-theme="a">'

+'	<div data-role="header">'
+'		<h1>My Labs - Delphi in the Cloud</h1>'
+'	</div><!-- /header -->'

+'	<div data-role="content">'
+'		<h1>Welcome to Fábio´s labs! </h1>'
+'		<p>Press on the button below to find informations about customers of a fictional company. </p>'

+'		<ul data-role="listview" data-inset="true" data-theme="c">'
+'		  <li><a href="#costumers">Costumers</a></li>'
+'		  <li><a href="#about">About</a></li>'
+'		</ul>'


+'	</div><!-- /content -->'

+'	<div data-role="footer">'
+'		<h4>Delphi is cool!</h4>'
+'	</div><!-- /footer -->'

+'</div><!-- /page -->'

// Another page - about
+'<div data-role="page" id="about">'

+'	<div data-role="header">'
+'		<h1>My Labs - Delphi in the Cloud</h1>'
+'	</div><!-- /header -->'

+'	<div data-role="content">'
+'		<p>This is about test pag</p>'

+'		<ul data-role="listview">'
+'		  <li><a href="#about">About</a></li>'
+'		</ul>'


+'	</div><!-- /content -->'

+'	<div data-role="footer">'
+'		<h4>Delphi is cool!</h4>'
+'	</div><!-- /footer -->'

+'</div><!-- /page -->'
// Another page - Costumers
+'<div data-role="page" id="costumers" data-theme="b">'

+'	<div data-role="header">'
+'		<h1>Costumers</h1>'
+'	</div><!-- /header -->'

+'	<div data-role="content">'
+'		<p>This is a list of customers coming from a DataSnap Server</p>'

+'		<ul data-role="listview" data-inset="true" data-theme="d">'
+ getCostumers()
+'		</ul>'


+'	</div><!-- /content -->'

+'	<div data-role="footer">'
+'		<h4>Delphi is cool!</h4>'
+'	</div><!-- /footer -->'

+'</div><!-- /page -->'
+ PageClients.Text;

end;

end.
