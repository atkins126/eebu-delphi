inherited formMensagem: TformMensagem
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formMensagem'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  StyleElements = []
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 740
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 3
    Top = 10
    Width = 1018
    Height = 720
    Align = alCustom
    Anchors = []
    BevelOuter = bvNone
    Padding.Left = 20
    Padding.Right = 20
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    StyleElements = []
    object lbl_sorriso: TLabel
      Left = 0
      Top = 0
      Width = 35
      Height = 58
      Caption = ':)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -48
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object lbl_mensagem: TLabel
      Left = 0
      Top = 160
      Width = 1018
      Height = 400
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      StyleElements = []
    end
    object btn_no: TBitBtn
      Left = 836
      Top = 640
      Width = 90
      Height = 80
      Cursor = crHandPoint
      Action = act_cancelar
      Caption = 'NO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
    end
    object btn_yes: TBitBtn
      Left = 928
      Top = 640
      Width = 90
      Height = 80
      Cursor = crHandPoint
      Action = act_confirmar
      Caption = 'YES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
  end
  object acl_mensagem: TActionList
    OnUpdate = acl_mensagemUpdate
    Left = 707
    Top = 34
    object act_cancelar: TAction
      Caption = 'NO'
      OnExecute = act_cancelarExecute
    end
    object act_confirmar: TAction
      Caption = 'YES'
      OnExecute = act_confirmarExecute
    end
  end
end
