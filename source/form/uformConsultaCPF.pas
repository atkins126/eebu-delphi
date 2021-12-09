unit uformConsultaCPF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uformBase, Vcl.ExtCtrls, Vcl.StdCtrls,
  ACBrBase, ACBrSocket, ACBrConsultaCPF, Vcl.Mask, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList;

type
  TformConsultaCPF = class(TformBase)
    pnl_principal: TPanel;
    pnl_pessoa_header: TPanel;
    bvl_1: TBevel;
    Label1: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    EditCaptcha: TEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    Timer1: TTimer;
    CPF: TACBrConsultaCPF;
    EditCPF: TMaskEdit;
    EditDtNasc: TDateTimePicker;
    acl_Consulta: TActionList;
    act_cancelar: TAction;
    act_confirmar: TAction;
    pnl_pessoa_footer: TPanel;
    btn_confirmar: TButton;
    btn_cancelar: TButton;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure act_confirmarExecute(Sender: TObject);
    procedure act_cancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaCPF: TformConsultaCPF;

implementation

{$R *.dfm}

uses udmRepository, Helper;

procedure TformConsultaCPF.act_cancelarExecute(Sender: TObject);
begin
  Close;
end;

procedure TformConsultaCPF.act_confirmarExecute(Sender: TObject);
begin
  inherited;
   if EditCaptcha.Text <> '' then
  begin
    if CPF.Consulta(EditCPF.Text, DateToStr(EditDtNasc.date), EditCaptcha.Text) then
    begin
      self.Tag:= 1;
      close;
    end;
  end
  else
  begin
    THelper.Mensagem('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TformConsultaCPF.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := True;
  EditCPF.SetFocus;
  EditCPF.Text:= Self.Hint;
end;

procedure TformConsultaCPF.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    CPF.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );

    EditCaptcha.Clear;
    EditCPF.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TformConsultaCPF.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
end;

end.
