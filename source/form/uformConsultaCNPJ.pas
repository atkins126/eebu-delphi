unit uformConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uformBase, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, ACBrBase, ACBrSocket,
  ACBrConsultaCNPJ;

type
  TformConsultaCNPJ = class(TformBase)
    pnl_principal: TPanel;
    bvl_1: TBevel;
    pnl_pessoa_header: TPanel;
    pnl_pessoa_footer: TPanel;
    btn_confirmar: TButton;
    btn_cancelar: TButton;
    acl_Consulta: TActionList;
    act_cancelar: TAction;
    act_confirmar: TAction;
    CNPJ: TACBrConsultaCNPJ;
    Timer1: TTimer;
    Label1: TLabel;
    Label14: TLabel;
    EditCaptcha: TEdit;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    procedure act_cancelarExecute(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure act_confirmarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsultaCNPJ: TformConsultaCNPJ;

implementation

{$R *.dfm}

uses Helper, JPEG;

procedure TformConsultaCNPJ.act_cancelarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TformConsultaCNPJ.act_confirmarExecute(Sender: TObject);
var
  I: Integer;
begin
  if EditCaptcha.Text <> '' then
  begin
    if CNPJ.Consulta(
      EditCNPJ.Text,
      EditCaptcha.Text,
      false
    ) then
    begin
      Self.Tag:= 1;
      close;
    end;
  end
  else
  begin
    THelper.Mensagem('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TformConsultaCNPJ.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    act_confirmar.Execute;
end;

procedure TformConsultaCNPJ.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:= True;
  EditCNPJ.Text:= Self.Hint;
end;

procedure TformConsultaCNPJ.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  Stream:= TMemoryStream.Create;
  try
    CNPJ.Captcha(Stream);

   {$IFDEF DELPHI2009_UP}
   //Use esse código quando a imagem do site for do tipo JPG
    Jpg:= TJPEGImage.Create;
    try
      Jpg.LoadFromStream(Stream);
      Image1.Picture.Assign(Jpg);
    finally
      Jpg.Free;
    end;
   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TformConsultaCNPJ.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCNPJ.SetFocus;
end;

end.
