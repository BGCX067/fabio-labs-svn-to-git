unit ControlPicture;

interface

uses
  AClassRef,
  Generics.Collections,
  ADPLFacade,
  JPEG,
  SecretePicture;
type
  TControlPicture = class
  public
    class function getPicture():TList<TAClassRef>; overload;
    class function getPicture(Id :integer):TAClassRef; overload;
    class function setPicture(APicture :TAClassRef):boolean;
  end;

const
  connectionString = 'D:\AGFA\fabio-labs\SecretPicture\data\FBDATA.FDB;SYSDBA;masterkey;localhost;firebird';

implementation

uses
  ADPLHelper, SysUtils;

{ TControlPicture }

class function TControlPicture.getPicture: TList<TAClassRef>;
var
  Helper : THelper;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(connectionString, 'firebird');
  try
    Result := TADPLFacade.NewInstance.Select(TSecretePicture.create, Helper);
    Helper.CloseFactoryConnectionOle;
  finally
    Helper.Free;
  end;
end;

class function TControlPicture.getPicture(Id: integer): TAClassRef;
var
  Helper : THelper;
  Filter : TStringBuilder;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(connectionString, 'firebird');
  Filter := TStringBuilder.Create;
  try
    Filter.Append('ID = ').Append(Id);
    Result := TADPLFacade.NewInstance.SelectOne(TSecretePicture.create, Filter.ToString(), Helper);
    Helper.CloseFactoryConnectionOle;
  finally
    Filter.Free;
    Helper.Free;
  end;
end;

class function TControlPicture.setPicture(APicture: TAClassRef): boolean;
var
  Helper : THelper;
begin
  Helper := TADPLFacade.NewInstance.OpenConnect(connectionString, 'firebird');
  try
    Result := TADPLFacade.NewInstance.Insert(APicture, False, Helper) = 0;
    Helper.CloseFactoryConnectionOle;
  finally
    Helper.Free;
  end;
end;

end.
