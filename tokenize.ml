type token = | Integer of int * string
             | Real of float * string
             | String of string * string
             | Character of char * string
             | Identifier of string
             | LeftBrace | RightBrace
             | LeftParen | RightParen
             | LeftBrack | RightBrack
             | LeftAngle | RightAngle
             | Plus | Minus
             | Star | Pcnt
             | Equal | Caret
             | Ampersand | Bar
             | BangEqual
             | Solidus
             | EqualEqual
             | EqualLeftAngle
             | EqualRightAngle
             | DoubleLeftAngle
             | DoubleRightAngle
             | DoubleAmpersand
             | DoubleBar
             | PlusEqual
             | MinusEqual
             | StarEqual
             | PcntEqual
             | SolidusEqual
             | CaretEqual
             | AmpersandEqual
             | BarEqual
             | DoubleLAngleEqual
             | DoubleRAngleEqual
             | DoubleAmpersandEqual
             | DoubleBarEqual
             | Comma | Semicolon


