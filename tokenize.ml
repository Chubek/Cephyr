type token = | Integer of int
             | Real of float
             | String of string
             | Character of char
             | Identifier of string
             | Suffix of string
             | Prefix of string
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
             | StartStream | EndStream



let add_token token stream = stream @ [token]

let rec tokenize s idx tokens =
  if idx >= String.length s then
    List.rev (StartStream :: tokens :: EndStream)
  else
    match s.[idx] with
    | c when c >= '0' && c <= '9' ->
      let (num, new_idx) = consume_integer s idx in
      tokenize s new_idx (add_token (Integer (int_of_string num)) tokens)
    | c when c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c == '_' ->
      let (id, new_idx) = consume_identifier s idx in
      tokenize s new_idx (add_token (Identifier id) tokens)
    | _ -> tokenize s (idx + 1) tokens 

and consume_integer s idx =
  let rec aux idx acc =
    if idx < String.length s && s.[idx] >= '0' && s.[idx] <= '9' then
      aux (idx + 1) (acc ^ String.make 1 s.[idx])
    else (acc, idx)
  in
  consume_digits idx ""

and consume_identifier s idx =
  let rec aux idx acc =
    if idx < String.length s && s.[idx] >= 'A' && s.[idx] <= 'Z' || s.[idx] >= 'a' && s.[idx] <= 'z' || s.[idx] >= '0' && s.[idx] <= '9' || s == '_' then
      aux (idx + 1) (acc ^ String.make 1 s.[idx])
    else  (acc, idx)
  in
  aux idx ""


