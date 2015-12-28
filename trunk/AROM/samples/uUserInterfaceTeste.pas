unit uUserInterfaceTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uNegocio.Empresa,
  Data.DBXFirebird, Data.DB, Data.SqlExpr, uFachada.CENTROCUSTOCONTABIL, uFachada.CONTA_CONTABIL, uFachada.EMPRESA;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    edNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edSobreNome: TEdit;
    Label4: TLabel;
    edTelefone: TEdit;
    Button2: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    oEmployee: TEMPRESA;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  {
  oEmployee := TFachada_EMPLOYEE.ObterInstancia.getEntityObjectById(Edit1.Text);
  edNome.Text := oEmployee.FIRST_NAME;
  edSobreNome.Text := oEmployee.LAST_NAME;
  edTelefone.Text := oEmployee.PHONE_EXT;
  ComboBox1.GetTabOrderList(TFachada_EMPLOYEE.ObterInstancia.getEntityObjectFullList());
  }
  oEmployee := TFachada_EMPRESA.ObterInstancia.getEntityObjectById(Edit1.Text);
  edNome.Text := oEmployee.EMP_CODIGO;
  edSobreNome.Text := oEmployee.EMP_RAZAO;
  edTelefone.Text := oEmployee.EMP_FANTASIA;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  oEmployee.EMP_RAZAO := edSobreNome.Text;
  oEmployee.EMP_FANTASIA := edTelefone.Text;
  TFachada_EMPRESA.ObterInstancia.update(oEmployee);
end;

end.
