unit uformOrdemServicoCreateEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uformBase, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, OrdemServico;

type
  TformOrdemServicoCreateEdit = class(TformBase)
    acl_Consulta: TActionList;
    act_cancelar: TAction;
    act_confirmar: TAction;
    pnl_principal: TPanel;
    bvl_1: TBevel;
    pnl_pessoa_header: TPanel;
    pnl_pessoa_footer: TPanel;
    btn_confirmar: TButton;
    btn_cancelar: TButton;
    pnl_pessoa_body: TPanel;
    bvl_2: TBevel;
    Label5: TLabel;
    mm_observacao: TMemo;
    lbe_user: TLabeledEdit;
    lbe_pessoa: TLabeledEdit;
    lbe_referencia: TLabeledEdit;
    dtp_Solicitado: TDateTimePicker;
    Label1: TLabel;
    dtp_competencia: TDateTimePicker;
    Label2: TLabel;
    cbx_situacao: TComboBox;
    Label3: TLabel;
    procedure lbe_userKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure act_cancelarExecute(Sender: TObject);
    procedure act_confirmarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbe_pessoaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    OrdemServico: TOrdemServico;
    procedure ObjToEdt;
    procedure EdtToObj;
    procedure save();
    procedure setRequired(Obj: TObject);
    procedure onEnter(Sender: TObject);
    procedure findPessoa;
    procedure findUser;
    function validaCamposObrigatorios: Boolean;
  public
    { Public declarations }
  end;

var
  formOrdemServicoCreateEdit: TformOrdemServicoCreateEdit;

implementation

uses
  System.SysUtils, uformUserList, AuthService, uformPessoaList, Helper;

{$R *.dfm}

{ TformOrdemServicoCreateEdit }

procedure TformOrdemServicoCreateEdit.act_cancelarExecute(Sender: TObject);
begin
  inherited;
  TAuthService.OrdemServicoId:= EmptyStr;
  Close;
end;

procedure TformOrdemServicoCreateEdit.act_confirmarExecute(Sender: TObject);
begin
  inherited;
  save();
end;

procedure TformOrdemServicoCreateEdit.EdtToObj;
begin
  OrdemServico.Referencia:= StrToIntDef(lbe_referencia.Text, 0);
  OrdemServico.Solicitado:= dtp_Solicitado.Date;
  OrdemServico.Competencia:= dtp_competencia.Date;
  OrdemServico.Observacao:= mm_observacao.Text;
  case cbx_situacao.ItemIndex of
    0: OrdemServico.Situacao:= '1';
    1: OrdemServico.Situacao:= '2';
    2: OrdemServico.Situacao:= '3';
    3: OrdemServico.Situacao:= '4';
  end;
end;

procedure TformOrdemServicoCreateEdit.findPessoa;
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
    OrdemServico.PessoaId:= TAuthService.PessoaId;
    lbe_pessoa.Text:= OrdemServico.Pessoa.Nome;
    lbe_pessoa.Color:= clWindow;
  end;
end;

procedure TformOrdemServicoCreateEdit.findUser;
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
    OrdemServico.UserId:= TAuthService.UserId;
    lbe_user.Text:= OrdemServico.User.Nome;
  end;
end;

procedure TformOrdemServicoCreateEdit.FormCreate(Sender: TObject);
begin
  inherited;
  if TAuthService.OrdemServicoId = EmptyStr then
    OrdemServico:= TOrdemServico.Create
  else
    OrdemServico:= TOrdemServico.find(TAuthService.OrdemServicoId);
  ObjToEdt;
end;

procedure TformOrdemServicoCreateEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(OrdemServico);
end;

procedure TformOrdemServicoCreateEdit.lbe_pessoaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    13: lbe_user.SetFocus;
    112: findPessoa;
  end;
end;

procedure TformOrdemServicoCreateEdit.lbe_userKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   case Key of
    112: findUser;
  end;
end;

procedure TformOrdemServicoCreateEdit.ObjToEdt;
begin
  if (OrdemServico.Id = EmptyStr) then
  begin
    pnl_pessoa_header.Caption:= 'NOVA ORDEM SERVIÇO';
    lbe_referencia.Text:= OrdemServico.nextReferencia().ToString();
    cbx_Situacao.ItemIndex:= 0;
    dtp_competencia.Date:= Now + 5;
    dtp_Solicitado.Date:= Now;
    Exit();
  end;

  pnl_pessoa_header.Caption:= 'EDITAR ORDEM SERVIÇO';
  case StrToIntDef(OrdemServico.Situacao, 1) of
    1: cbx_situacao.ItemIndex:= 0;
    2: cbx_situacao.ItemIndex:= 1;
    3: cbx_situacao.ItemIndex:= 2;
    4: cbx_situacao.ItemIndex:= 3;
  end;

  lbe_referencia.text:= OrdemServico.Referencia.ToString;
  lbe_pessoa.Text:= OrdemServico.Pessoa.Nome;
  lbe_user.Text:= OrdemServico.User.Nome;
  dtp_Solicitado.Date:= OrdemServico.Solicitado;
  dtp_competencia.Date:= OrdemServico.Competencia;
  mm_observacao.Text:= OrdemServico.Observacao;
end;

procedure TformOrdemServicoCreateEdit.onEnter(Sender: TObject);
begin
  if (Sender is TLabeledEdit) then
  begin
    TLabeledEdit(Sender).Color:= clWhite;
    TLabeledEdit(Sender).OnEnter:= nil;
  end
  else if (Sender is TMaskEdit) then
  begin
    TMaskEdit(Sender).Color:= clWhite;
    TMaskEdit(Sender).OnEnter:= nil;
  end
  else if (Sender is TComboBox) then
  begin
    TComboBox(Sender).Color:= clWhite;
    TComboBox(Sender).OnEnter:= nil;
  end;
end;

procedure TformOrdemServicoCreateEdit.save;
begin
  EdtToObj;
  try
    if validaCamposObrigatorios then
    begin
      if OrdemServico.validate() then
      begin
        if OrdemServico.save then
        begin
          TAuthService.OrdemServicoId:= OrdemServico.Id;
          Close;
        end;
      end;
    end;
  except on e: Exception do
    THelper.Mensagem(e.Message);
  end;
end;

procedure TformOrdemServicoCreateEdit.setRequired(Obj: TObject);
begin
  if (Obj is TLabeledEdit) then
  begin
    TLabeledEdit(Obj).Color:= $00AAAAFF;
    TLabeledEdit(Obj).OnEnter:= onEnter;
  end
  else if (Obj is TMaskEdit) then
  begin
    TMaskEdit(Obj).Color:= $00AAAAFF;
    TMaskEdit(Obj).OnEnter:= onEnter;
  end
  else if (Obj is TComboBox) then
  begin
    TComboBox(Obj).Color:= $00AAAAFF;
    TComboBox(Obj).OnEnter:= onEnter;
  end;
end;

function TformOrdemServicoCreateEdit.validaCamposObrigatorios: Boolean;
var
  v_required: Integer;
begin
  Result:= True;
  if (Trim(lbe_pessoa.Text) = '') then
  begin
    setRequired(lbe_pessoa);
    Inc(v_required);
  end;

  if (Trim(lbe_user.Text) = '') then
  begin
    setRequired(lbe_user);
    Inc(v_required);
  end;

  if (Trim(mm_observacao.Text) = '') then
  begin
    setRequired(mm_observacao);
    Inc(v_required);
  end;

  Result:= (v_required = 0);
  if (not Result) then  THelper.Mensagem('Preencha os dados obrigatórios da pessoa.');
end;

end.
