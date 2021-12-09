unit uformOrdemServicoList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uformBase, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, Pessoa, User, System.DateUtils, ACBrBase, ACBrDFe, ACBrNFe,
  Vcl.Imaging.pngimage;

type
  TformOrdemServicoList = class(TformBase)
    act_os: TActionList;
    act_rollback: TAction;
    act_store: TAction;
    act_update: TAction;
    act_destroy: TAction;
    act_imprimir: TAction;
    fdmt_os: TFDMemTable;
    fdmt_osID: TStringField;
    fdmt_osREFERENCIA: TIntegerField;
    fdmt_osCOMPETENCIA: TDateField;
    fdmt_osPESSOA: TStringField;
    fdmt_osVENDEDOR: TStringField;
    ds_os: TDataSource;
    ppm_os: TPopupMenu;
    REIMPRIMIR: TMenuItem;
    IDENTIFICARPESSOA: TMenuItem;
    GERARNFCe: TMenuItem;
    GERARNFe: TMenuItem;
    GERARNOTAFISCAL: TMenuItem;
    IMPRIMIR: TMenuItem;
    tmr_focus: TTimer;
    pnl_principal: TPanel;
    bvl_1: TBevel;
    bvl_2: TBevel;
    pnl_head: TPanel;
    pnl_body: TPanel;
    bvl_4: TBevel;
    dbg_vendas: TDBGrid;
    pnl_search: TPanel;
    lb_start: TLabel;
    lb_end: TLabel;
    lb_user: TLabel;
    lb_pessoa: TLabel;
    lbe_search: TLabeledEdit;
    dtp_end: TDateTimePicker;
    dtp_start: TDateTimePicker;
    edb_pessoa: TButtonedEdit;
    edb_user: TButtonedEdit;
    pnl_footer: TPanel;
    btn_venda_store: TButton;
    btn_rollback: TButton;
    btn_venda_cancelar: TButton;
    btn_venda_itens: TButton;
    btn_venda_update: TButton;
    fdmt_osSOLICITADO: TDateField;
    fdmt_osOBSERVACAO: TStringField;
    img_StatusAndamento: TImage;
    img_StatusConcluido: TImage;
    img_StatusServicoPendente: TImage;
    img_StatusCancelado: TImage;
    fdmt_osSITUACAO: TStringField;
    fdmt_osSTATUS: TStringField;
    cbx_situacao: TComboBox;
    lb_situacao: TLabel;
    procedure tmr_focusTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbg_vendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edb_userLeftButtonClick(Sender: TObject);
    procedure edb_userChange(Sender: TObject);
    procedure edb_pessoaLeftButtonClick(Sender: TObject);
    procedure edb_pessoaRightButtonClick(Sender: TObject);
    procedure edb_userRightButtonClick(Sender: TObject);
    procedure lbe_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure act_osUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure act_rollbackExecute(Sender: TObject);
    procedure act_storeExecute(Sender: TObject);
    procedure act_updateExecute(Sender: TObject);
    procedure act_destroyExecute(Sender: TObject);
    procedure act_imprimirExecute(Sender: TObject);
    procedure ds_osDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    Pessoa: TPessoa;
    User: TUser;
    procedure list(pDtInicial,
                   pDtFinal: TDate;
                   pSituacao,
                   pPessoaId,
                   pUserId,
                   pSearch: string);

    procedure listRefresh;
  public
    { Public declarations }
  end;

var
  formOrdemServicoList: TformOrdemServicoList;

implementation

{$R *.dfm}

uses OrdemServico, uformUserList, AuthService, uformPessoaList, Helper,
  uformOrdemServicoCreateEdit;

procedure TformOrdemServicoList.act_destroyExecute(Sender: TObject);
begin
  if (TOrdemServico.remove(fdmt_osID.AsString)) then
    fdmt_os.Delete;
end;

procedure TformOrdemServicoList.act_imprimirExecute(Sender: TObject);
begin
  if not (fdmt_os.RecordCount >= 1) then Exit();
  if not THelper.Mensagem('Deseja imprimir Ordem de Serviço?', 1) then Exit();
  try
    TOrdemServico.imprimir(fdmt_osID.AsString, TAuthService.getAuthenticatedConfig.PrintMode);
  except on e: Exception do
    THelper.Mensagem(e.Message);
  end;
end;

procedure TformOrdemServicoList.act_osUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  act_update.Enabled:= (fdmt_os.RecordCount >= 1);
  act_destroy.Enabled:= (fdmt_os.RecordCount >= 1);
  act_imprimir.Enabled:= (fdmt_os.RecordCount >= 1);
  tmr_focus.Enabled:= (not lbe_search.Focused);
end;

procedure TformOrdemServicoList.act_rollbackExecute(Sender: TObject);
begin
  inherited;
  TAuthService.OrdemServicoId:= EmptyStr;
  Close;
end;

procedure TformOrdemServicoList.act_storeExecute(Sender: TObject);
var
  v_form: TformOrdemServicoCreateEdit;
begin
  TAuthService.OrdemServicoId:= EmptyStr;
  try
    v_form:= TformOrdemServicoCreateEdit.Create(nil);
    v_form.ShowModal;
  finally
    FreeAndNil(v_form);
  end;
  if (TAuthService.OrdemServicoId <> EmptyStr) then
    listRefresh;
end;

procedure TformOrdemServicoList.act_updateExecute(Sender: TObject);
var
  v_form: TformOrdemServicoCreateEdit;
begin
  TAuthService.OrdemServicoId:= fdmt_osID.AsString;
  try
    v_form:= TformOrdemServicoCreateEdit.Create(nil);
    v_form.ShowModal;
  finally
    FreeAndNil(v_form);
  end;
  if (TAuthService.OrdemServicoId <> EmptyStr) then
    listRefresh;
end;

procedure TformOrdemServicoList.dbg_vendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TDBGrid(Sender).Canvas.Brush.Color:= clWhite;
  TDBGrid(Sender).Canvas.Font.Style:= [];
  TDBGrid(Sender).Canvas.Font.Color:= clBlack;

  if (gdSelected in State) then
  begin
    TDBGrid(Sender).Canvas.Font.Style:= [fsBold];
    TDBGrid(Sender).Canvas.Brush.Color:= $00FFCF9F;
  end;

  if not Odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
  begin
    if not (gdSelected in State) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color:= $00E2E2E2;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[datacol].Field, State);
end;

procedure TformOrdemServicoList.ds_osDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  img_StatusConcluido.Visible:= False;
  img_StatusAndamento.Visible:= False;
  img_StatusServicoPendente.Visible:= False;
  img_StatusCancelado.Visible:= False;

  case StrToIntDef(fdmt_osSITUACAO.AsString, 1) of
    1: img_StatusServicoPendente.Visible:= true;
    2: img_StatusAndamento.Visible:= True;
    3: img_StatusCancelado.Visible:= True;
    4: img_StatusConcluido.Visible:= True;
  end;
end;

procedure TformOrdemServicoList.edb_pessoaLeftButtonClick(Sender: TObject);
var
  v_form: TformPessoaList;
begin
  TAuthService.PessoaId:= EmptyStr;
  try
    v_form:= TformPessoaList.Create(nil);
    v_form.Tag:= 1;
    v_form.ShowModal;
  finally
    FreeAndNil(v_form);
  end;

  if (TAuthService.PessoaId <> EmptyStr) then
  begin
    Pessoa:= TPessoa.find(TAuthService.PessoaId);
    edb_pessoa.Text:= Pessoa.Nome;
  end;
end;

procedure TformOrdemServicoList.edb_pessoaRightButtonClick(Sender: TObject);
begin
  inherited;
  FreeAndNil(Pessoa);
  TButtonedEdit(Sender).Text:= '';
end;

procedure TformOrdemServicoList.edb_userChange(Sender: TObject);
begin
  inherited;
  TButtonedEdit(Sender).LeftButton.Visible:= (Trim(TButtonedEdit(Sender).Text) = '');
  TButtonedEdit(Sender).RightButton.Visible:= (Trim(TButtonedEdit(Sender).Text) <> '');
end;

procedure TformOrdemServicoList.edb_userLeftButtonClick(Sender: TObject);
var
  v_form: TformUserList;
begin
  TAuthService.UserId:= EmptyStr;
  try
    v_form:= TformUserList.Create(nil);
    v_form.Tag:= 1;
    v_form.ShowModal;
  finally
    FreeAndNil(v_form);
  end;

  if (TAuthService.UserId <> EmptyStr) then
  begin
    User:= TUser.find(TAuthService.UserId);
    edb_user.Text:= User.Nome;
  end;
end;

procedure TformOrdemServicoList.edb_userRightButtonClick(Sender: TObject);
begin
  inherited;
  FreeAndNil(User);
  TButtonedEdit(Sender).Text:= '';
end;

procedure TformOrdemServicoList.FormCreate(Sender: TObject);
begin
  inherited;
  Pessoa:= nil;
  User:= nil;
  dtp_start.Date:= StartOfTheMonth(Now);
  dtp_end.Date:= Now;
  listRefresh;
end;

procedure TformOrdemServicoList.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(User);
end;

procedure TformOrdemServicoList.lbe_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   case Key of
    13: listRefresh;
    38: begin
      fdmt_os.Prior;
      Key:= 35;
    end;
    40: begin
      fdmt_os.Next;
      Key:= 35;
    end;
  end;
end;

procedure TformOrdemServicoList.list(pDtInicial, pDtFinal: TDate; pSituacao, pPessoaId,
  pUserId, pSearch: string);
begin
  TOrdemServico.list(
              pDtInicial,
              pDtFinal,
              pSituacao,
              pPessoaId,
              pUserId,
              pSearch,
              fdmt_os);
end;

procedure TformOrdemServicoList.listRefresh;
var
  situacao, userId, pessoaId: String;
begin
   if Assigned(User) then
    userId:= User.Id
  else
    userId:= '';
  if Assigned(Pessoa) then
    pessoaId:= Pessoa.Id
  else
    pessoaId:= '';

  case cbx_situacao.ItemIndex of
    0: situacao:= '1';
    1: situacao:= '2';
    2: situacao:= '3';
    3: situacao:= '4';
  end;

  list(dtp_start.Date, dtp_end.Date, situacao, pessoaId,userId,Trim(lbe_search.Text));
end;

procedure TformOrdemServicoList.tmr_focusTimer(Sender: TObject);
begin
  inherited;
  try
    if not lbe_search.Focused and
    not dtp_start.Focused and
    not dtp_end.Focused then lbe_search.SetFocus;
  except
    TTimer(Sender).Enabled:= True;
  end;
end;

end.
