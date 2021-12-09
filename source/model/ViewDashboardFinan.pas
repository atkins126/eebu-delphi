unit ViewDashboardFinan;

interface

uses
  Model, Classes, Generics.Collections, SysUtils, FireDAC.Comp.Client, Data.DB,
  System.StrUtils;

type
  TViewDashboardFinan = Class(TModel)

  private
    FEMPRESA_ID: String;
    FRECEBIMENTO_HOJE: Extended;
    FRECEBIMENTO_RESTANTE: Extended;
    FPAGAMENTO_HOJE: Extended;
    FPAGAMENTO_RESTANTE: Extended;
    FRECEBIMENTO_ATRASO_HOJE: Extended;
    FPAGAMENTO_ATRASO_HOJE: Extended;
  public
    destructor Destroy; override;
    constructor Create();
    class function find(id: string): TViewDashboardFinan;

    property EmpresaId: String  read FEMPRESA_ID write FEMPRESA_ID;
    property RecebimentoHoje: Extended  read FRECEBIMENTO_HOJE write FRECEBIMENTO_HOJE;
    property RecebimentoRestante: Extended  read FRECEBIMENTO_RESTANTE write FRECEBIMENTO_RESTANTE;
    property PagamentoHoje: Extended  read FPAGAMENTO_HOJE write FPAGAMENTO_HOJE;
    property PagamentoRestante: Extended  read FPAGAMENTO_RESTANTE write FPAGAMENTO_RESTANTE;
    property RecebimentoAtrasoHoje: Extended  read FRECEBIMENTO_ATRASO_HOJE write FRECEBIMENTO_ATRASO_HOJE;
    property PagamentoAtrasoHoje: Extended  read FPAGAMENTO_ATRASO_HOJE write FPAGAMENTO_ATRASO_HOJE;
  End;

implementation

{ TViewDashboardFinan }

constructor TViewDashboardFinan.Create;
begin
  Self.Table:= 'VIEW_DASHBOARD_FINAN';
end;

destructor TViewDashboardFinan.Destroy;
begin

  inherited;
end;

class function TViewDashboardFinan.find(id: string): TViewDashboardFinan;
const
  FSql: string = 'SELECT * FROM VIEW_DASHBOARD_FINAN WHERE (EMPRESA_ID = :ID)';
var
  FDQuery: TFDQuery;
begin
  try
    FDQuery:= Self.createQuery;
    try
      FDQuery.SQL.Add(FSql);
      FDQuery.Params.ParamByName('ID').DataType:= ftFixedWideChar;
      FDQuery.Prepare;
      FDQuery.Params.ParamByName('ID').AsString:= id;
      FDQuery.Open();
      if FDQuery.RecordCount = 0 then Result:= nil
      else
      begin
        Result:= TViewDashboardFinan.Create;
        Result.EmpresaId:= FDQuery.FieldByName('EMPRESA_ID').AsString;
        Result.RecebimentoHoje:= FDQuery.FieldByName('RECEBIMENTO_HOJE').AsExtended;
        Result.RecebimentoRestante:= FDQuery.FieldByName('RECEBIMENTO_RESTANTE').AsExtended;
        Result.PagamentoHoje:= FDQuery.FieldByName('PAGAMENTO_HOJE').AsExtended;
        Result.PagamentoRestante:= FDQuery.FieldByName('PAGAMENTO_RESTANTE').AsExtended;
        Result.RecebimentoAtrasoHoje:= FDQuery.FieldByName('RECEBIMENTO_ATRASO_HOJE').AsExtended;
        Result.PagamentoAtrasoHoje:= FDQuery.FieldByName('PAGAMENTO_ATRASO_HOJE').AsExtended;
      end;
    except
      Result:= nil;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

end.
