unit Reaproveitamento.Hospitalar.Fachada;

interface

uses
  Generics.Collections,
  Reaproveitamento.Hospitalar.Negocio,
  Reaproveitamento.Hospitalar.Repositorio, Reaproveitamento.Hospitalar.Controle;

type
  TFachada = class
  public
    class function obterMedicos():TList<TProfissional>;
    class function obterMedicamentos():TList<TMedicamento>;
    class function obterPrescricoes():TList<TObject>;
  end;


implementation

{ TFachada }

class function TFachada.obterMedicamentos: TList<TMedicamento>;
var
  Repositorio : TRepositorioMedicamento;
begin
  Repositorio := TRepositorioMedicamento.Create;
  try
    Result := Repositorio.obterLista();
  finally
    Repositorio.Free;
  end;
end;

class function TFachada.obterMedicos: TList<TProfissional>;
var
  Repositorio : TRepositorioProfissional;
begin
  Repositorio := TRepositorioProfissional.Create;
  try
    Result := Repositorio.obterLista();
  finally
    Repositorio.Free;
  end;
end;

class function TFachada.obterPrescricoes: TList<TObject>;
begin
  Result := TControlePrescricao.obterPrescricoes();
end;

end.
