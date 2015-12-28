unit uControlador.Base;

interface

uses
  uRepositorio.Base;

type
  TControladorBase = class
  private
    FRepositorioTransacao: TRepositorioBase;
    procedure SetRepositorioTransacao(const Value: TRepositorioBase);
  public
    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;
    property RepositorioTransacao: TRepositorioBase read FRepositorioTransacao write SetRepositorioTransacao;
  end;

implementation

{ TControladorBase }

procedure TControladorBase.ConfirmarTransacao;
begin
  FRepositorioTransacao.ConfirmarTransacao;
end;

procedure TControladorBase.DesfazerTransacao;
begin
  FRepositorioTransacao.DesfazerTransacao;
end;

procedure TControladorBase.IniciarTransacao;
begin
  FRepositorioTransacao.IniciarTransacao;
end;

procedure TControladorBase.SetRepositorioTransacao(
  const Value: TRepositorioBase);
begin
  FRepositorioTransacao := Value;
end;

end.