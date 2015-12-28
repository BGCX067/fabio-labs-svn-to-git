unit UDMData;

interface

uses
  System.SysUtils, System.Classes;

type
  TDMData = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function f_status():String;
    function f_facilityList():String;
    function f_userList():String;
    function f_orgs(FacilityID, UserID : String):String;
  end;

var
  DMData: TDMData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDMData.f_facilityList: String;
var
  Content : TStringList;
begin
  try
    Content := TStringList.Create;
    Content.Add('<FacilityList xmlns="http://www.agfa.com/xsd/orbis-mobile/2013/02/" xmlns:ns2="http://www.w3.org/1999/xlink">');
    Content.Add('<Facility>');
    Content.Add(' <id>176623</id>');
    Content.Add(' <shortname>I. AGFA</shortname>');
    Content.Add(' <name>I. AGFA Krankenhaus (Standardmodell)</name>');
    Content.Add('</Facility>');
    Content.Add('<Facility>');
    Content.Add(' <id>1</id>');
    Content.Add(' <shortname>II. AGFA</shortname>');
    Content.Add(' <name>II. AGFA Krankenhaus (Standardmodell)</name>');
    Content.Add('</Facility>');
    Content.Add('<Facility>');
    Content.Add(' <id>369931</id>');
    Content.Add(' <shortname>MVZ-AGFA</shortname>');
    Content.Add(' <name>AGFA Medizinisches Versorgungszentrum</name>');
    Content.Add('</Facility>');
    Content.Add('<Facility>');
    Content.Add(' <id>370267</id>');
    Content.Add(' <shortname>SJN</shortname>');
    Content.Add(' <name>IBIL Langlieger</name>');
    Content.Add('</Facility>');
    Content.Add('</FacilityList>');
    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

function TDMData.f_orgs(FacilityID, UserID : String): String;
var
  Content : TStringList;
begin
  {TODO: Use UserID
    Maybe the field UserID don't have the use the name suggest. There are some
    possibilities:
      1 - It will be use with the WPDHOSP user PK, in this case if the size is
          less than, showd be use a trim function.
      2 - It will be disregarded.
      3 - It will be use to pass other value
  }
  try
    Content := TStringList.Create;
    Content.Add('<UserOrgs xmlns="http://www.agfa.com/xsd/orbis-mobile/2013/02/" xmlns:ns2="http://www.w3.org/1999/xlink">');
    Content.Add('	<Departments>');
    Content.Add('		<OU>');
    Content.Add('			<ID>10747</ID>');
    Content.Add('			<ShortName>ACH</ShortName>');
    Content.Add('			<LongName>Allgemeinchirurgie</LongName>');
    Content.Add('			<Primary>N</Primary>');
    Content.Add('			<Wards>...</Wards>');
    Content.Add('		</OU>');
    Content.Add('		<OU>');
    Content.Add('			<ID>10724</ID>');
    Content.Add('			<ShortName>ANA</ShortName>');
    Content.Add('			<LongName>Anästhesie</LongName>');
    Content.Add('			<Primary>N</Primary>');
    Content.Add('			<Wards>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10732</ID>');
    Content.Add('					<ShortName>STITSOP</ShortName>');
    Content.Add('					<LongName>Operative Intensivmedizin</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="no" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10724/10732/Default"/>');
    Content.Add('				</OU>');
    Content.Add('			</Wards>');
    Content.Add('		</OU>');
    Content.Add('		<OU>');
    Content.Add('			<ID>10725</ID>');
    Content.Add('			<ShortName>AUG</ShortName>');
    Content.Add('			<LongName>Augenklinik</LongName>');
    Content.Add('			<Primary>N</Primary>');
    Content.Add('			<Wards>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10733</ID>');
    Content.Add('					<ShortName>ST04</ShortName>');
    Content.Add('					<LongName>Station 04</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="yes" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10725/10733/Default"/>');
    Content.Add('				</OU>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10734</ID>');
    Content.Add('					<ShortName>ST11</ShortName>');
    Content.Add('					<LongName>Station 11</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="no" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10725/10734/Default"/>');
    Content.Add('				</OU>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10735</ID>');
    Content.Add('					<ShortName>ST18</ShortName>');
    Content.Add('					<LongName>Station 18</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="yes" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10725/10735/Default"/>');
    Content.Add('				</OU>');
    Content.Add('			</Wards>');
    Content.Add('		</OU>');
    Content.Add('		<OU>');
    Content.Add('			<ID>10727</ID>');
    Content.Add('			<ShortName>DER</ShortName>');
    Content.Add('			<LongName>Hautklinik</LongName>');
    Content.Add('			<Primary>N</Primary>');
    Content.Add('			<Wards>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10737</ID>');
    Content.Add('					<ShortName>ST23</ShortName>');
    Content.Add('					<LongName>Station 23</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="no" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10727/10737/Default"/>');
    Content.Add('				</OU>');
    Content.Add('				<OU>');
    Content.Add('					<ID>10736</ID>');
    Content.Add('					<ShortName>ST24</ShortName>');
    Content.Add('					<LongName>Station 24</LongName>');
    Content.Add('					<Primary>N</Primary>');
    Content.Add('					<CaseListLink cache="no" ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/CaseList/10727/10736/Default"/>');
    Content.Add('				</OU>');
    Content.Add('			</Wards>');
    Content.Add('		</OU>');
    Content.Add('	</Departments');
    Content.Add('</UserOrgs>');
    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

function TDMData.f_status: String;
var
  Content : TStringList;
begin
  try
    Content := TStringList.Create;
    Content.Add('<Status xmlns="http://www.agfa.com/xsd/orbis-mobile/2013/02/" xmlns:ns2="http://www.w3.org/1999/xlink">');
    Content.Add('<Text>OK</Text>');
    Content.Add('</Status>');
    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

function TDMData.f_userList: String;
var
  Content : TStringList;
begin
  try
    Content := TStringList.Create;
    Content.Add('<UserList xmlns="http://www.agfa.com/xsd/orbis-mobile/2013/02/" xmlns:ns2="http://www.w3.org/1999/xlink">');
    Content.Add('  <User>');
    Content.Add('    <ID>17695</ID>');
    Content.Add('    <UserName>ORBIS</UserName>');
    Content.Add('    <LoginUser>I. AGFA/ORBIS</LoginUser>');
    Content.Add('    <OutlineLink ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/176623/Users/17695/Outline/Default"/>');
    Content.Add('    <SettingsLink ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/176623/Users/17695/Settings"/>');
    Content.Add('    <CatalogsLink ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/176623/Users/17695/Catalogs"/>');
    Content.Add('    <FormsLink ns2:href="https://trrswv056.agfahealthcare.com:1443/orbis-mobile/176623/Users/17695/Forms"/>');
    Content.Add('    <FirstName>Fabio</FirstName>');
    Content.Add('    <LastName>Silva</LastName>');
    Content.Add('    <Sex>M</Sex>');
    Content.Add('  </User>');
    Content.Add('</UserList>');
    Result := Content.Text;
  finally
    Content.Free;
  end;
end;

end.
