module Deku.Tumult.Reconciliation where

import Prelude

import Data.List (List(..), (:))
import Data.List as List
import Data.Newtype (unwrap)
import Data.Set (Set)
import Data.Set as Set
import Data.Variant (Variant, match, on)
import Type.Proxy (Proxy(..))
import Deku.Rendered (Instruction(..))
import Deku.Rendered as R

du
  :: forall r
   . String
  -> { id :: String | r }
  -> Set Instruction
  -> Set Instruction
du u = Set.insert <<< R.iDestroyUnit <<< { unit: u, id: _ } <<< _.id

derogative :: Instruction -> Set Instruction -> Set Instruction
derogative = unwrap >>> match
  { disconnectXFromY: const identity
  , destroyUnit: const identity
  , makeElement: \i -> du i.tag i
  -- todo: is this correct??
  , makeRoot: const identity
  -- todo: is this correct??
  , massiveCreate: const identity
  , makeSubgraph: du "Subgraph"
  , makeTumult: du "Tumult"
  , makeText: du "Text"
  , connectXToY: Set.insert <<< R.iDisconnectXFromY
  , setAttribute: const identity
  -- todo: is this correct??
  , massiveChange: const identity
  , setSubgraph: const identity
  , setTumult: const identity
  , setText: const identity
  }

reconcileTumult :: Set Instruction -> Set Instruction -> Set Instruction
reconcileTumult new old = result
  where
  result = go primus secondus Set.empty
  primus = List.fromFoldable new
  secondus = List.fromFoldable old

  usingDefault
    :: forall v
     . List Instruction
    -> Instruction
    -> List Instruction
    -> List Instruction
    -> Instruction
    -> List Instruction
    -> Set Instruction
    -> Variant v
    -> Set Instruction
  usingDefault l0 h0 t0 l1 h1 t1 set _ =
    case compare h0 h1 of
      LT -> go t0 l1 $ Set.insert h0 set
      GT -> go l0 t1 $ derogative h1 set
      EQ -> go t0 t1 set

  comparable
    :: forall r0 r1
     . { id :: String
       | r0
       }
    -> { id :: String
       | r1
       }
    -> List Instruction
    -> Instruction
    -> List Instruction
    -> List Instruction
    -> Instruction
    -> List Instruction
    -> Set Instruction
    -> (Set Instruction -> Set Instruction)
    -> Set Instruction
  comparable a b l0 h0 t0 l1 h1 t1 set setf
    | a.id < b.id = go t0 l1 $ Set.insert h0 set
    | b.id < a.id = go l0 t1 $ derogative h1 set
    | otherwise = go t0 t1 (setf set)

  go
    :: List Instruction
    -> List Instruction
    -> Set Instruction
    -> Set Instruction
  go Nil Nil set = set
  go (h0 : t0) Nil set = go t0 Nil (Set.insert h0 set)
  go Nil (h1 : t1) set = go Nil t1 (derogative h1 set)
  go l0@(h0@(Instruction i0) : t0) l1@(h1@(Instruction i1) : t1) set =
    let
      udef :: forall v. Variant v -> Set Instruction
      udef = usingDefault l0 h0 t0 l1 h1 t1 set
    in
      i0 # match
        { connectXToY: \a -> i1 #
            ( udef
                # on (Proxy :: _ "connectXToY") \b ->
                  let
                    o
                      | a.fromId < b.fromId = go t0 l1 $ Set.insert
                          (R.iConnectXToY a)
                          set
                      | a.fromId > b.fromId = go l0 t1 $ Set.insert
                          (R.iDisconnectXFromY b)
                          set
                      | a.toId < b.toId = go t0 l1 $ Set.insert
                          (R.iConnectXToY a)
                          set
                      | a.toId > b.toId = go l0 t1 $ Set.insert
                          (R.iDisconnectXFromY b)
                          set
                      | a.fromUnit /= b.fromUnit = go l0 t1
                          $ Set.insert (R.iDisconnectXFromY b)
                          $ Set.insert (R.iConnectXToY a) set
                      | a.toUnit /= b.toUnit = go l0 t1
                          $ Set.insert (R.iDisconnectXFromY b)
                          $ Set.insert (R.iConnectXToY a) set
                      | otherwise = go t0 t1 set
                  in
                    o
            )
        , makeElement: \a -> i1 #
            ( udef
                # on (Proxy :: _ "makeElement") \b ->
                  comparable a b l0 h0 t0 l1 h1 t1 set
                    ( Set.union
                        ( Set.fromFoldable $ map
                            ( \{ key, value } -> R.iSetAttribute
                                { id: a.id, key, value }
                            )
                            a.attributes
                        )
                    )
            )
        , makeText: \a -> i1 #
            ( udef
                # on (Proxy :: _ "makeText") \b ->
                  comparable a b l0 h0 t0 l1 h1 t1 set
                    ( Set.insert
                        (R.iSetText { id: a.id, text: a.text })
                    )
            )
        , disconnectXFromY: \_ -> i1 # udef
        , destroyUnit: \_ -> i1 # udef
        , makeSubgraph: \a -> i1 #
            ( udef
                # on (Proxy :: _ "makeSubgraph") \b ->
                  comparable a b l0 h0 t0 l1 h1 t1 set identity
            )
        , makeTumult: \a -> i1 #
            ( udef
                # on (Proxy :: _ "makeTumult") \b ->
                  comparable a b l0 h0 t0 l1 h1 t1 set identity
            )
        , setAttribute: \_ -> i1 # udef
        , setSubgraph: \_ -> i1 # udef
        , setTumult: \_ -> i1 # udef
        , setText: \_ -> i1 # udef
        -- todo: is this correct??
        , makeRoot: \_ -> i1 # udef
        , massiveChange: \_ -> i1 # udef
        , massiveCreate: \_ -> i1 # udef
        }
