Require Import QArith.

Open Scope Q_scope.

Fixpoint H (n:nat) :=
  match n with
    | O => 0 # 1
    | S x => H x + (1 # (P_of_succ_nat x))
  end.

Eval compute in (H 3). (* 11 # 6 *)


