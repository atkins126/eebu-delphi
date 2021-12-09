unit OrdemServico;

interface

uses
  Model, Classes, Generics.Collections, SysUtils, FireDAC.Comp.Client, Data.DB,
  Pessoa, User, System.StrUtils;

type
  TOrdemServico = Class(TModel)

  private
    FEMPRESA_ID: String;
    FPESSOA_ID: String;
    FUSER_ID: String;
    FREFERENCIA: Integer;
    FCOMPETENCIA: TDateTime;
    FSOLICITADO: TDateTime;
    FSITUACAO: String;
    FOBSERVACAO: String;
    FPESSOA: TPessoa;
    FUSER: TUser;

    function getPessoa: TPessoa;
    function getUser: TUser;
  protected
    function store(): Boolean; override;
    function update(): Boolean; override;
  public
    constructor Create();
    function save(): Boolean;
    function delete(): Boolean;
    function validate(vtype: integer = 0): Boolean;
    class function getNameSituacao(situacao: string): string;
    class function find(id: string): TOrdemServico;
    class function list(pSituacao: Integer;
                        pDtInicial,
                        pDtFinal: TDate;
                        pPessoaId,
                        pUserId,
                        pSearch: string): TObjectList<TOrdemServico>; overload;
    class procedure list(pSituacao: Integer;
                         pDtInicial,
                         pDtFinal: TDate;
                         pPessoaId,
                         pUserId,
                         pSearch: string; pDt: TFDMemTable); overload;
    class procedure imprimir(Id: string; Modo: Integer = 0); overload;
    class function remove(id: string): Boolean;

    property EmpresaId: String  read FEMPRESA_ID write FEMPRESA_ID;
    property PessoaId: String  read FPESSOA_ID write FPESSOA_ID;
    property UserId: String  read FUSER_ID write FUSER_ID;
    property Referencia: Integer  read FREFERENCIA write FREFERENCIA;
    property Competencia: TDateTime  read FCOMPETENCIA write FCOMPETENCIA;
    property Solicitado: TDateTime  read FSOLICITADO write FSOLICITADO;
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    property Situacao: String  read FSITUACAO write FSITUACAO;

    property Pessoa: TPessoa read getPessoa;
    property User: TUser read getUser;
  End;

implementation

{ TOrdemServico }

uses AuthService, Helper, Empresa, uformPrint, NfeConfiguracao;

constructor TOrdemServico.Create;
begin
  Self.Table:= 'ORDEM_SERVICO';
end;

function TOrdemServico.delete: Boolean;
const
  FSql: string =
  'UPDATE ORDEM_SERVICO             ' +
  'SET UPDATED_AT = :UPDATED_AT,    ' +
  '    DELETED_AT = :DELETED_AT,    ' +
  '    SYNCHRONIZED = :SYNCHRONIZED ' +
  'WHERE (ID = :ID)                 ';
var
  FDQuery: TFDQuery;
begin
  Result:= True;
  try
    FDQuery:= Self.createQuery;
    try
      FDQuery.SQL.Add(FSql);
      FDQuery.Params.ParamByName('ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('UPDATED_AT').DataType:= ftTimeStamp;
      FDQuery.Params.ParamByName('DELETED_AT').DataType:= ftTimeStamp;
      FDQuery.Params.ParamByName('SYNCHRONIZED').DataType:= ftFixedWideChar;
      FDQuery.Prepare;
      FDQuery.Params.ParamByName('ID').AsString:= Self.Id;
      FDQuery.Params.ParamByName('UPDATED_AT').Value:= Now;
      FDQuery.Params.ParamByName('DELETED_AT').Value:= Now;
      FDQuery.Params.ParamByName('SYNCHRONIZED').AsString:= 'N';
      FDQuery.ExecSQL;
    except on e: exception do
      begin
        Result:= False;
        raise Exception.Create('falha ao remover a Ordem de Serviço. erro: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

class function TOrdemServico.find(id: string): TOrdemServico;
const
  FSql: string = 'SELECT * FROM ORDEM_SERVICO WHERE (ID = :ID)';
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
        Result:= TOrdemServico.Create;
        Result.Id:= FDQuery.FieldByName('ID').AsString;
        Result.EmpresaId:= FDQuery.FieldByName('EMPRESA_ID').AsString;
        Result.PessoaId:= FDQuery.FieldByName('PESSOA_ID').AsString;
        Result.UserId:= FDQuery.FieldByName('USER_ID').AsString;
        Result.Referencia:= FDQuery.FieldByName('REFERENCIA').AsInteger;
        Result.Competencia:= FDQuery.FieldByName('COMPETENCIA').AsDateTime;
        Result.Solicitado:= FDQuery.FieldByName('SOLICITADO').AsDateTime;
        Result.Observacao:= FDQuery.FieldByName('OBSERVACAO').AsString;
        Result.CreatedAt:= FDQuery.FieldByName('CREATED_AT').AsDateTime;
        Result.UpdatedAt:= FDQuery.FieldByName('UPDATED_AT').AsDateTime;
        Result.Synchronized:= FDQuery.FieldByName('SYNCHRONIZED').AsString;
      end;
    except
      Result:= nil;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

class function TOrdemServico.getNameSituacao(situacao: string): string;
begin
  case StrToIntDef(situacao, 1) of
    1: Result:= 'AGUARDANDO ATENDIMENTO';
    2: Result:= 'EM ATENDIMENTO';
    3: Result:= 'CANCELADO';
    4: Result:= 'FINALIZADO';
  end;
end;

function TOrdemServico.getPessoa: TPessoa;
begin
  if not Assigned(Self.FPESSOA) then
    Self.FPESSOA:= TPessoa.find(Self.FPESSOA_ID)
  else if Self.FPESSOA.Id <> Self.FPESSOA_ID then
  begin
    FreeAndNil(FPESSOA);
    Self.FPESSOA:= TPessoa.find(Self.FPESSOA_ID);
  end;
  Result:= Self.FPESSOA;
end;

function TOrdemServico.getUser: TUser;
begin
   if not Assigned(Self.FUSER) then
    Self.FUSER:= TUser.find(Self.FUSER_ID)
  else if Self.FUSER.Id <> Self.FUSER_ID then
  begin
    FreeAndNil(FUSER);
    Self.FUSER:= TUser.find(Self.FUSER_ID)
  end;
  Result:= Self.FUSER;
end;

class procedure TOrdemServico.imprimir(Id: string; Modo: Integer);
const
  unNormal: string = #27 + '!' + #00;
  unCompactado: string = #27 + '!' + #01;
  unCompactadoNegrito: string = #27 + '!' + #09;
  unNegrito: string = #27 + '!' + #08;
  unDuplaLinhha: string = #27 + '!' + #16;
  unSublinhado: string = #27 + '!' + #128;
  unExpandido: string = #27 + '!' + #32;
  unFonte: string = #27#77 + '1';
  unNGT  : string = #27 + '!' + #08;
  unCorte: string = chr(27)+'m';
var
  vEmpresa: TEmpresa;
  vOs: TOrdemServico;
  Print: TStringList;
  formPrint: TformPrint;
  F: TextFile;
  I: Integer;
  NfeConfiguracao: TNfeConfiguracao;
begin
  try
    vEmpresa:= nil;
    vOs:= nil;
    try
      vEmpresa:= TEmpresa.find(TAuthService.getAuthenticatedEmpresaId);
      if not Assigned(vEmpresa) then
        raise Exception.Create('Falha ao consultar dados da empresa.');
      vOs:= TOrdemServico.find(id);
      if not Assigned(vOs) then
        raise Exception.Create('Falha ao consultar dados da OS.');
      Print:= TStringList.Create;
      case Modo of
        0: begin

        end;
        1: begin
          Print.Add('H|' +
                    THelper.StrEsquerda('ORDEM DE SERVIÇO',28) +
                    THelper.StrDireita(FormatDateTime('dd/mm/yyyy',Now),60));
          Print.Add('H|' + StringOfChar('-', 88));
          Print.Add('H|' + THelper.StrCentro(vEmpresa.Nome, 88));
          Print.Add('H|' + THelper.StrCentro(vEmpresa.Logradouro + ' ' +
                                             vEmpresa.Numero, 88));
          Print.Add('H|' + THelper.StrCentro(vEmpresa.Cep + ' - ' +
                                             vEmpresa.NomeMunicipio + ' - ' +
                                             vEmpresa.Uf, 88));
          Print.Add('H|' + THelper.StrCentro('CPF/CNPJ:' +
                                             IfThen(vEmpresa.Documento.Length = 14,
                                             THelper.CNPJMask(vEmpresa.Documento),
                                             THelper.CPFMask(vEmpresa.Documento)) +
                                             ' - ' + 'IE: ' + vEmpresa.Ie, 88));
          Print.Add('H|' + THelper.StrCentro('FONE: ' + THelper.FONEMask(vEmpresa.Fone), 88));
          Print.Add('H|' + StringOfChar('-', 88));
          Print.Add('H|' + THelper.StrEsquerda('PESSOA     : ' + vOs.Pessoa.Nome, 48) + ' ' +
                           THelper.StrDireita('CPF/CNPJ :' +
                           IfThen(vOs.Pessoa.Documento.Length = 14,
                           THelper.CNPJMask(vOs.Pessoa.Documento),
                           THelper.CPFMask(vOs.Pessoa.Documento)), 36));
          Print.Add('H|' + 'REFERENCIA : ' + IntToStr(vOs.Referencia));
          Print.Add('H|' + 'DATA       : ' + FormatDateTime('dd/mm/yyyy',vOs.Solicitado));
          Print.Add('H|' + StringOfChar('-', 88));
          Print.Add('H|' + 'ATENDENTE  : ' + vOs.User.Nome);
          Print.Add('H|' + StringOfChar('-', 88));
          Print.Add('H|' + THelper.StrEsquerda(THelper.StrEsquerda('|', 1) +
          THelper.StrCentro('DESCRIÇÃO DO CLIENTE', 42) + THelper.StrDireita('|', 1), 44) +
          THelper.StrDireita(THelper.StrCentro('ATENDIMENTO', 43) + THelper.StrDireita('|', 1), 44));
          Print.Add('H|' + THelper.StrEsquerda(THelper.StrEsquerda('|', 1) +
          THelper.StrCentro('', 42) + THelper.StrDireita('|', 1), 44) +
          THelper.StrDireita(THelper.StrCentro('', 43) + THelper.StrDireita('|', 1), 44));
          Print.Add('H|' + THelper.StrCentro(THelper.StrEsquerda('|', 1) +
          THelper.StrCentro(UpperCase(vOs.Observacao), 42) + THelper.StrDireita('|', 1), 44) +
           THelper.StrDireita(THelper.StrCentro('', 43) + THelper.StrDireita('|', 1), 44));
          Print.Add('H|' + THelper.StrEsquerda(THelper.StrEsquerda('|', 1) +
          THelper.StrCentro('', 42) + THelper.StrDireita('|', 1), 44) +
          THelper.StrDireita(THelper.StrCentro('', 43) + THelper.StrDireita('|', 1), 44));
          Print.Add('F|' + StringOfChar('-',88));
          Print.Add('F|' + THelper.StrDireita('WWW.EEBU.COM.BR', 88));
          Print.Add('F|' + THelper.StrDireita('COTRIGUAÇU - MT (66) 98430-7974 / 98466-0179', 88));
          for I:= 0 to 3 do
            Print.Add('F|' + '');
          Print.Add('F|' + THelper.StrCentro('----------------------------', 88));
          Print.Add('F|' + THelper.StrCentro('ASSINATURA', 88));
          try
            formPrint:= TformPrint.Create(nil);
            NfeConfiguracao:= TNfeConfiguracao.find(vEmpresa.NfeConfiguracao.id);
            formPrint.RLImage1.Picture.LoadFromFile(NfeConfiguracao.Logo);
            formPrint.Print(Print);
          finally
            FreeAndNil(formPrint);
            FreeAndNil(NfeConfiguracao);
          end;
        end;
      end;
    except on e: Exception do
      raise Exception.Create('Falha ao imprimir. Erro: ' + e.Message);
    end;
  finally
    if Assigned(vEmpresa) then FreeAndNil(vEmpresa);
    if Assigned(vOs) then FreeAndNil(vOs);
    if Assigned(Print) then FreeAndNil(Print);
  end;
end;

class procedure TOrdemServico.list(pSituacao: Integer; pDtInicial,
  pDtFinal: TDate; pPessoaId, pUserId, pSearch: string; pDt: TFDMemTable);
var
  vList: TObjectList<TOrdemServico>;
  I: Integer;
begin
  pDt.Open();
  pDt.DisableControls;
  pDt.EmptyDataSet;
  vList:= Self.list(pSituacao,
                    pDtInicial,
                    pDtFinal,
                    pPessoaId,
                    pUserId,
                    pSearch);
  if Assigned(vList) then
  begin
    for I := 0 to Pred(vList.Count) do
    begin
      pDt.Append;
      pDt.FieldByName('ID').AsString:= vList.Items[I].Id;
      pDt.FieldByName('REFERENCIA').AsInteger:= vList.Items[I].Referencia;
      pDt.FieldByName('COMPETENCIA').AsDateTime:= vList.Items[I].Competencia;
      pDt.FieldByName('SOLICITADO').AsDateTime:= vList.Items[I].Solicitado;
      pDt.FieldByName('OBSERVACAO').AsString:= vList.Items[I].Observacao;
      pDt.FieldByName('SITUACAO').AsString:= getNameSituacao(vList.Items[I].Situacao);
      pDt.FieldByName('PESSOA').AsString:= vList.Items[I].Pessoa.Nome;
      pDt.FieldByName('VENDEDOR').AsString:= vList.Items[I].User.Nome;
      pDt.Post;
    end;
    FreeAndNil(vList);
  end;
  pDt.First;
  pDt.EnableControls;
end;

class function TOrdemServico.list(pSituacao: Integer; pDtInicial,
  pDtFinal: TDate; pPessoaId, pUserId,
  pSearch: string): TObjectList<TOrdemServico>;
var
  FSql: string;
  FDQuery: TFDQuery;
  vReferencia: Integer;
begin
  try
    FDQuery:= Self.createQuery;
    try
      vReferencia:= StrToIntDef(pSearch, 0);
      FSql:= 'SELECT V.ID FROM ORDEM_SERVICO V ' +
      'WHERE (V.EMPRESA_ID = :EMPRESA_ID) AND (V.DELETED_AT IS NULL) ' +
      'AND (V.SOLICITADO BETWEEN :DTINICIAL AND :DTFINAL) ';
      //'AND (V.SITUACAO = :SITUACAO) ';
      if (pPessoaId <> '') then
        FSql:= FSql + 'AND (V.PESSOA_ID = :PESSOA_ID) ';
      if (pUserId <> '') then
        FSql:= FSql + 'AND (V.USER_ID = :USER_ID) ';
      if (vReferencia >= 1) then
        FSql:= FSql + 'AND (V.REFERENCIA = :REFERENCIA) ';
      FSql:= FSql + 'ORDER BY V.SOLICITADO DESC, V.REFERENCIA DESC';
      FDQuery.SQL.Add(FSql);
      FDQuery.Params.ParamByName('EMPRESA_ID').DataType:= ftString;
      FDQuery.Params.ParamByName('DTINICIAL').DataType:= ftDate;
      FDQuery.Params.ParamByName('DTFINAL').DataType:= ftDate;
      //FDQuery.Params.ParamByName('SITUACAO').DataType:= ftString;
      if (pPessoaId <> '') then
        FDQuery.Params.ParamByName('PESSOA_ID').DataType:= ftString;
      if (pUserId <> '') then
        FDQuery.Params.ParamByName('USER_ID').DataType:= ftString;
      if (vReferencia >= 1) then
        FDQuery.Params.ParamByName('REFERENCIA').DataType:= ftInteger;
      FDQuery.Prepare;
      FDQuery.Params.ParamByName('EMPRESA_ID').AsString:= TAuthService.getAuthenticatedEmpresaId;
      FDQuery.Params.ParamByName('DTINICIAL').AsDate:= pDtInicial;
      FDQuery.Params.ParamByName('DTFINAL').AsDate:= pDtFinal;
      //FDQuery.Params.ParamByName('SITUACAO').AsString:= pSituacao;
      if (pPessoaId <> '') then
        FDQuery.Params.ParamByName('PESSOA_ID').AsString:= pPessoaId;
      if (pUserId <> '') then
        FDQuery.Params.ParamByName('USER_ID').AsString:= pUserId;
      if (vReferencia >= 1) then
        FDQuery.Params.ParamByName('REFERENCIA').AsInteger:= vReferencia;
      FDQuery.Open();
      if FDQuery.RecordCount = 0 then Result:= nil
      else
      begin
        Result:= TObjectList<TOrdemServico>.Create;
        FDQuery.First;
        while not FDQuery.Eof do
        begin
          Result.Add(TOrdemServico.find(FDQuery.FieldByName('ID').AsString));
          FDQuery.Next;
        end;
      end;
    except
      Result:= nil;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

class function TOrdemServico.remove(id: string): Boolean;
var
  OrdemServico: TOrdemServico;
begin
  Result:= False;
  OrdemServico:= TOrdemServico.find(id);
  if not Assigned(OrdemServico) then
  begin
    THelper.Mensagem('Ordem não encontrada. A Ordem pode ter sido previamente excluída por outro usuário!');
    Exit();
  end;
  try
    if not THelper.Mensagem('Confirmar a exclusão desta Ordem de Serviço?', 1) then
      Exit();
    Result:= OrdemServico.delete();
  finally
    FreeAndNil(OrdemServico);
  end;
end;

function TOrdemServico.save: Boolean;
begin
  Result:= inherited;
end;

function TOrdemServico.store: Boolean;
const
  FSql: string =
  'INSERT INTO ORDEM_SERVICO (' +
  '  ID,               ' +
  '  EMPRESA_ID,       ' +
  '  PESSOA_ID,        ' +
  '  USER_ID,          ' +
  '  REFERENCIA,       ' +
  '  COMPETENCIA,      ' +
  '  SOLICITADO,       ' +
  '  OBSERVACAO,       ' +
  '  SITUACAO,         ' +
  '  CREATED_AT,       ' +
  '  UPDATED_AT)       ' +
  'VALUES (            ' +
  '  :ID,              ' +
  '  :EMPRESA_ID,      ' +
  '  :PESSOA_ID,       ' +
  '  :USER_ID,         ' +
  '  :REFERENCIA,      ' +
  '  :COMPETENCIA,     ' +
  '  :SOLICITADO,      ' +
  '  :OBSERVACAO,      ' +
  '  :SITUACAO,        ' +
  '  :CREATED_AT,      ' +
  '  :UPDATED_AT)      ';
var
  FDQuery: TFDQuery;
  I: Integer;
  vCtModalidade: Integer;
begin
  Result:= True;
  try
    Self.StartTransaction;
    FDQuery:= Self.createQuery;
    try
      FDQuery.SQL.Add(FSql);
      FDQuery.Params.ParamByName('ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('EMPRESA_ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('PESSOA_ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('USER_ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('REFERENCIA').DataType:= ftInteger;
      FDQuery.Params.ParamByName('COMPETENCIA').DataType:= ftDate;
      FDQuery.Params.ParamByName('SOLICITADO').DataType:= ftDate;
      FDQuery.Params.ParamByName('OBSERVACAO').DataType:= ftWideString;
      FDQuery.Params.ParamByName('SITUACAO').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('CREATED_AT').DataType:= ftTimeStamp;
      FDQuery.Params.ParamByName('UPDATED_AT').DataType:= ftTimeStamp;
      FDQuery.Prepare;
      Self.Id:= Self.generateId;
      Self.EmpresaId:= TAuthService.getAuthenticatedEmpresaId;
      Self.Referencia:= Self.nextReferencia(Self.Referencia);
      FDQuery.Params.ParamByName('ID').AsString:= Self.Id;
      FDQuery.Params.ParamByName('EMPRESA_ID').AsString:= Self.EmpresaId;
      if (Self.PessoaId <> EmptyStr) then
      FDQuery.Params.ParamByName('PESSOA_ID').AsString:= Self.PessoaId;
      FDQuery.Params.ParamByName('USER_ID').AsString:= Self.UserId;
      FDQuery.Params.ParamByName('REFERENCIA').AsInteger:= Self.Referencia;
      FDQuery.Params.ParamByName('COMPETENCIA').AsDate:= Self.Competencia;
      FDQuery.Params.ParamByName('SOLICITADO').AsDate:= Self.Solicitado;
      FDQuery.Params.ParamByName('OBSERVACAO').AsString:= Self.Observacao;
      FDQuery.Params.ParamByName('SITUACAO').AsString:= Self.Situacao;
      FDQuery.Params.ParamByName('CREATED_AT').Value:= Now;
      FDQuery.Params.ParamByName('UPDATED_AT').Value:= Now;
      FDQuery.ExecSQL;
      Self.Commit;
    except on e: exception do
    begin
      Self.Rollback;
      Result:= False;
      raise Exception.Create('Falha ao inserir a Ordem de Serviço. Erro: ' + e.Message);
    end;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

function TOrdemServico.update: Boolean;
const
  FSql: string =
  'UPDATE ORDEM_SERVICO             ' +
  'SET PESSOA_ID = :PESSOA_ID,      ' +
  '    USER_ID = :USER_ID,          ' +
  '    REFERENCIA = :REFERENCIA,    ' +
  '    COMPETENCIA = :COMPETENCIA,  ' +
  '    SOLICITADO = :SOLICITADO,    ' +
  '    OBSERVACAO = :OBSERVACAO,    ' +
  '    SITUACAO = :SITUACAO,        ' +
  '    UPDATED_AT = :UPDATED_AT,    ' +
  '    SYNCHRONIZED = :SYNCHRONIZED ' +
  'WHERE (ID = :ID)                 ';
var
  FDQuery: TFDQuery;
  I: Integer;
  vCtModalidade: Integer;
begin
  Result:= True;
  try
    Self.StartTransaction;
    FDQuery:= Self.createQuery;
    try
      FDQuery.SQL.Add(FSql);
      FDQuery.Params.ParamByName('ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('PESSOA_ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('USER_ID').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('REFERENCIA').DataType:= ftInteger;
      FDQuery.Params.ParamByName('COMPETENCIA').DataType:= ftDate;
      FDQuery.Params.ParamByName('SOLICITADO').DataType:= ftDate;
      FDQuery.Params.ParamByName('OBSERVACAO').DataType:= ftWideString;
      FDQuery.Params.ParamByName('SITUACAO').DataType:= ftFixedWideChar;
      FDQuery.Params.ParamByName('UPDATED_AT').DataType:= ftTimeStamp;
      FDQuery.Params.ParamByName('SYNCHRONIZED').DataType:= ftFixedWideChar;
      FDQuery.Prepare;
      FDQuery.Params.ParamByName('ID').AsString:= Self.Id;
      if (Self.PessoaId <> EmptyStr) then
      FDQuery.Params.ParamByName('PESSOA_ID').AsString:= Self.PessoaId;
      FDQuery.Params.ParamByName('USER_ID').AsString:= Self.UserId;
      FDQuery.Params.ParamByName('REFERENCIA').AsInteger:= Self.Referencia;
      FDQuery.Params.ParamByName('COMPETENCIA').AsDate:= Self.Competencia;
      FDQuery.Params.ParamByName('SOLICITADO').AsDate:= Self.Solicitado;
      FDQuery.Params.ParamByName('OBSERVACAO').AsString:= Self.Observacao;
      FDQuery.Params.ParamByName('SITUACAO').AsString:= Self.Situacao;
      FDQuery.Params.ParamByName('UPDATED_AT').Value:= Now;
      FDQuery.Params.ParamByName('SYNCHRONIZED').AsString:= 'N';
      FDQuery.ExecSQL;
      Self.Commit;
    except on e: exception do
    begin
      Self.Rollback;
      Result:= False;
      raise Exception.Create('Falha ao atualizar a Ordem de Serviço. Erro: ' + e.Message);
    end;
    end;
  finally
    FreeAndNil(FDQuery);
  end;
end;

function TOrdemServico.validate(vtype: integer): Boolean;
begin
  //
end;

end.
