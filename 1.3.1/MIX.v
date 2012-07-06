Section MIX.
  (* XXX this definition of a byte is too specific. *)
  Open Scope type_scope.
  Definition byte := bool * bool * bool * bool * bool * bool.
  Definition word : Set := bool * byte * byte * byte * byte * byte.
  Definition Ireg_content : Set := bool * byte * byte.

  Inductive Ireg_id : Set :=
  | I1 | I2 | I3 | I4 | I5.

  Record register : Set := mkRegister {
    rA : word;
    rX : word;
    rI : Ireg_id -> Ireg_content;
    rJ : byte * byte
  }.

  Record field_spec : Set := mkFieldSpec {
    L: nat;
    R: nat;
    valid_field_spec:
      0 <= L /\ L <= R /\ R <= 5
  }.

  Open Scope nat_scope.
  
  Definition nat_of_field_spec (f: field_spec): nat :=
    8 * (L f) + R f.

  (* definition nat_pair_of_nat *)
  (* some lemmas about correspondence between field_specs and nats *)

  Record memory_location : Set := mkMemoryLocation {
    M: nat;
    valid_memory_location : 0 <= M /\ M < 4000}.

  Inductive instruction : Set :=
  | LDA: instruction
  | LDX: instruction
  | LDi: Ireg_id -> instruction
  | LDAN
  | LDXN
  | LDiN: Ireg_id -> instruction
  | STA
  | STX
  | STi: Ireg_id -> instruction
  | STJ
  | STZ
  | ADD
  | SUB
  | MUL
  | DIV
  | ENTA
  | ENTX
  | ENTi: Ireg_id -> instruction
  | INCA
  | INCX
  | INCi: Ireg_id -> instruction
  | DECA
  | DECX
  | DECi: Ireg_id -> instruction
  | CMPA
  | CMPX
  | CMPi: Ireg_id -> instruction
  | JMP
  | JSJ
  | JOV
  | JNOV
  | JL | JE | JG | JGE | JNE | JLE
  | JAN | JAZ | JAP | JANN | JAnZ | JANP
  | JXN | JXZ | JXP | JXNN | JXNZ | JXNP
  | JiN : Ireg_id -> instruction
  | JiZ
  | JiP
  | JiNN : Ireg_id -> instruction
  | JiNZ : Ireg_id -> instruction
  | JiNP : Ireg_id -> instruction
  | SLA | SRA | SLAX | SRAX | SLC | SRC
  | MOVE
  | IN
  | OUT
  | IOC
  | JRED
  | JBUS
  | NUM
  | CHAR
    .

  Parameter exec_time: instruction -> nat.

End MIX.

