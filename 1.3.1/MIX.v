Section MIX.
  (* XXX this definition of a byte is too specific. *)
  Open Scope type_scope.
  Definition byte := bool * bool * bool * bool * bool * bool.
  Definition word : Set := bool * byte * byte * byte * byte * byte.
  Definition Ireg_content : Set := bool * byte * byte.

  Record register : Set := mkRegister {
    rA : word;
    rX : word;
    rI1 : Ireg_content;
    rI2 : Ireg_content;
    rI3 : Ireg_content;
    rI4 : Ireg_content;
    rI5 : Ireg_content;
    rI6 : Ireg_content;
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

  Definition instruction : Set := address * index_spec * modification * op_code.


End MIX.