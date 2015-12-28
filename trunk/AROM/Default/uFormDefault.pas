unit uFormDefault;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs;

type
  TFormDefault = class(TForm)
    PnButtons: TPanel;
    btnNext: TButton;
    btnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDefault: TFormDefault;

implementation

{$R *.fmx}

end.
