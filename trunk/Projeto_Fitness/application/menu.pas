unit menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TFMenu = class(TForm)
    sbUsuario: TSpeedButton;
    sbEmpresa: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure sbUsuarioClick(Sender: TObject);
    procedure sbEmpresaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.dfm}

uses CadastroUsuario, CadastroEmpresa, CadastroAluno;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFMenu.sbUsuarioClick(Sender: TObject);
begin
  Application.CreateForm(TFCadastroUsuario, FCadastroUsuario);
  FCadastroUsuario.ShowModal;
  FCadastroUsuario.Free;
end;

procedure TFMenu.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFCadastroAluno, FCadastroAluno);
  FCadastroAluno.ShowModal;
  FCadastroAluno.Free;
end;

procedure TFMenu.sbEmpresaClick(Sender: TObject);
begin
  Application.CreateForm(TFCadastroEmpresa, FCadastroEmpresa);
  FCadastroEmpresa.ShowModal;
  FCadastroEmpresa.Free;
end;

end.
