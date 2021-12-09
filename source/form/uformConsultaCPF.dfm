inherited formConsultaCPF: TformConsultaCPF
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formConsultaCPF'
  ClientHeight = 525
  ClientWidth = 730
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 730
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 28
    Top = 73
    Width = 673
    Height = 379
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
      Width = 78
      Height = 16
      Caption = 'Digite o CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 373
      Top = 230
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
    object Label2: TLabel
      Left = 373
      Top = 166
      Width = 170
      Height = 16
      Caption = 'Digite a Data de Nascimento:'
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
      Caption = 'CONSULTAR CPF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bombardier'
      Font.Style = []
      Padding.Top = 15
      Padding.Bottom = 15
      ParentColor = True
      ParentFont = False
      TabOrder = 3
      ExplicitWidth = 976
    end
    object EditCaptcha: TEdit
      Left = 373
      Top = 249
      Width = 264
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
    object EditCPF: TMaskEdit
      Tag = 1
      Left = 373
      Top = 120
      Width = 264
      Height = 41
      Color = clInfoBk
      EditMask = '###.###.###-##;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object EditDtNasc: TDateTimePicker
      Left = 373
      Top = 183
      Width = 264
      Height = 41
      Date = 43084.000000000000000000
      Time = 0.383408159723330800
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pnl_pessoa_footer: TPanel
      Left = 21
      Top = 298
      Width = 631
      Height = 80
      Align = alBottom
      BevelOuter = bvNone
      Padding.Top = 10
      Padding.Bottom = 10
      ParentColor = True
      TabOrder = 5
      ExplicitTop = 150
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
        ExplicitLeft = 321
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 440
    Top = 40
  end
  object CPF: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 342
    Top = 26
  end
  object acl_Consulta: TActionList
    Images = dmRepository.iml_32
    Left = 278
    Top = 129
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
end
