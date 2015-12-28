unit Reaproveitamento.Hospitalar.Controle;

interface

uses
  Generics.Collections,
  Reaproveitamento.Hospitalar.Negocio,
  Reaproveitamento.Hospitalar.Repositorio;

type
  // Utilizando classe Helper para modificar a classe TMedicamento adicionando o método adicionarItem
  TPrescricao = class Helper for TMedicamento
  public
    // Atribui ao filho o código do pai
    procedure adicionarItem(AItem :TMedicamento);
  end;

  TControlePrescricao = class
  public
    class function obterPrescricoes():TList<TObject>;
  end;

implementation

{ TControle }

class function TControlePrescricao.obterPrescricoes: TList<TObject>;
var
  Prescricao1, Prescricao2, Prescricao3, Prescricao4: TMedicamento;
  RepositorioMedicamento  : TRepositorioMedicamento;
  RepositorioProfissional : TRepositorioProfissional;
begin
  // Prescrições
  Result := TList<TObject>.Create();
  RepositorioMedicamento  := TRepositorioMedicamento.Create;
  RepositorioProfissional := TRepositorioProfissional.Create;
  try
    //'DIPIRONA AMP 1 G/2 ML';
    Prescricao1 := RepositorioMedicamento.obterLista[5];
    Prescricao1.adicionarItem( RepositorioMedicamento.obterLista[3] );
    Prescricao1.adicionarItem( RepositorioMedicamento.obterLista[0] );
    Prescricao1.Horarios := '08:00';

    Prescricao2 := RepositorioMedicamento.obterLista[4];
    Prescricao2.Medico := RepositorioProfissional.obterLista[0];
    Prescricao2.Horarios := '12:00';

    Prescricao3 := RepositorioMedicamento.obterLista[3];
    Prescricao3.Medico := RepositorioProfissional.obterLista[0];
    Prescricao3.Horarios := '00:00';
    Prescricao3.adicionarItem( RepositorioMedicamento.obterLista[3] );
    Prescricao3.adicionarItem( RepositorioMedicamento.obterLista[2] );
    Prescricao3.adicionarItem( RepositorioMedicamento.obterLista[0] );
    Prescricao3.adicionarItem( RepositorioMedicamento.obterLista[1] );

    Result.Add(Prescricao1);
    Result.Add(Prescricao2);
    Result.Add(Prescricao3);
  finally
    RepositorioMedicamento.Free;
    RepositorioProfissional.Free;
  end;
end;

{ TPrescricao }

procedure TPrescricao.adicionarItem(AItem: TMedicamento);
begin
  AItem.Id := Self.Id;
  Self.Itens.Add( AItem );
end;

end.
