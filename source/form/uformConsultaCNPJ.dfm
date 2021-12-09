inherited formConsultaCNPJ: TformConsultaCNPJ
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formConsultaCNPJ'
  ClientHeight = 551
  ClientWidth = 852
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitTop = -60
  ExplicitWidth = 852
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 89
    Top = 102
    Width = 673
    Height = 347
    Align = alCustom
    Anchors = []
    Color = clWhite
    Padding.Left = 20
    Padding.Right = 20
    ParentBackground = False
    TabOrder = 0
    object bvl_1: TBevel
      Left = 21
      Top = 81
      Width = 631
      Height = 2
      Align = alTop
      ExplicitLeft = 0
      ExplicitTop = 88
      ExplicitWidth = 976
    end
    object Label1: TLabel
      Left = 373
      Top = 100
      Width = 85
      Height = 16
      Caption = 'Digite o CNPJ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 373
      Top = 166
      Width = 96
      Height = 16
      Caption = 'Digite o Captcha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pnl_pessoa_header: TPanel
      Left = 21
      Top = 1
      Width = 631
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'CONSULTAR CNPJ'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bombardier'
      Font.Style = []
      Padding.Top = 15
      Padding.Bottom = 15
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 37
      ExplicitTop = 81
    end
    object pnl_pessoa_footer: TPanel
      Left = 21
      Top = 266
      Width = 631
      Height = 80
      Align = alBottom
      BevelOuter = bvNone
      Padding.Top = 10
      Padding.Bottom = 10
      ParentColor = True
      TabOrder = 1
      ExplicitTop = 298
      object btn_confirmar: TButton
        AlignWithMargins = True
        Left = 476
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_confirmar
        Align = alRight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 0
        TabStop = False
        WordWrap = True
      end
      object btn_cancelar: TButton
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_cancelar
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 1
        TabStop = False
        WordWrap = True
      end
    end
    object EditCaptcha: TEdit
      Left = 373
      Top = 185
      Width = 261
      Height = 41
      CharCase = ecUpperCase
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = EditCaptchaKeyPress
    end
    object EditCNPJ: TMaskEdit
      Left = 373
      Top = 119
      Width = 259
      Height = 41
      Color = clInfoBk
      EditMask = '00.000.000/0000-00;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 3
      Text = ''
    end
    object Panel3: TPanel
      Left = 21
      Top = 99
      Width = 346
      Height = 127
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 344
        Height = 106
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
      end
      object LabAtualizarCaptcha: TLabel
        Left = 1
        Top = 107
        Width = 344
        Height = 19
        Cursor = crHandPoint
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = 'Atualizar Captcha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        OnClick = LabAtualizarCaptchaClick
      end
    end
  end
  object acl_Consulta: TActionList
    Images = dmRepository.iml_32
    Left = 766
    Top = 41
    object act_cancelar: TAction
      Caption = 'CANCELAR'
      ImageIndex = 0
      OnExecute = act_cancelarExecute
    end
    object act_confirmar: TAction
      Caption = 'CONFIRMAR'
      ImageIndex = 6
      OnExecute = act_confirmarExecute
    end
  end
  object CNPJ: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 752
    Top = 106
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 760
    Top = 176
  end
end
