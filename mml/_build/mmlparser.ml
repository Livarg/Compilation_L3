
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | STAR
    | PLUS
    | IDENT of (
# 10 "mmlparser.mly"
       (string)
# 17 "mmlparser.ml"
  )
    | EOF
    | CST of (
# 9 "mmlparser.mly"
       (int)
# 23 "mmlparser.ml"
  )
  
end

include MenhirBasics

# 1 "mmlparser.mly"
  

  open Lexing
  open Mml


# 37 "mmlparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState05 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 05.
        Stack shape : expression.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_expression, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : expression.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Mml.expr)

and _menhir_box_program = 
  | MenhirBox_program of (Mml.prog) [@@unboxed]

let _menhir_action_1 =
  fun e ->
    (
# 30 "mmlparser.mly"
                      ( e )
# 67 "mmlparser.ml"
     : (Mml.expr))

let _menhir_action_2 =
  fun e1 e2 ->
    let op = 
# 35 "mmlparser.mly"
       ( Add )
# 75 "mmlparser.ml"
     in
    (
# 31 "mmlparser.mly"
                                       ( Bop(op, e1, e2) )
# 80 "mmlparser.ml"
     : (Mml.expr))

let _menhir_action_3 =
  fun e1 e2 ->
    let op = 
# 36 "mmlparser.mly"
       ( Mul )
# 88 "mmlparser.ml"
     in
    (
# 31 "mmlparser.mly"
                                       ( Bop(op, e1, e2) )
# 93 "mmlparser.ml"
     : (Mml.expr))

let _menhir_action_4 =
  fun code ->
    (
# 22 "mmlparser.mly"
                                          ( {types=[]; code} )
# 101 "mmlparser.ml"
     : (Mml.prog))

let _menhir_action_5 =
  fun n ->
    (
# 26 "mmlparser.mly"
        ( Int(n) )
# 109 "mmlparser.ml"
     : (Mml.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | CST _ ->
        "CST"
    | EOF ->
        "EOF"
    | IDENT _ ->
        "IDENT"
    | PLUS ->
        "PLUS"
    | STAR ->
        "STAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CST _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_1 =
                let n = _v_0 in
                _menhir_action_5 n
              in
              let e = _v_1 in
              let _v = _menhir_action_1 e in
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
          | _ ->
              _eRR ())
      | EOF ->
          let code = _v in
          let _v = _menhir_action_4 code in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | CST _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let n = _v in
            _menhir_action_5 n
          in
          let e = _v in
          let _v = _menhir_action_1 e in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_3 e1 e2 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | PLUS ->
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_2 e1 e2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | CST _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let n = _v in
            _menhir_action_5 n
          in
          let e = _v in
          let _v = _menhir_action_1 e in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
