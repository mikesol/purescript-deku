module Deku.Patch where

import Prelude hiding (Ordering(..))

import Data.Maybe (maybe)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple.Nested (type (/\))
import Data.Typelevel.Bool (False, True)
import Data.Typelevel.Num (class Pos)
import Data.Vec (Vec)
import Foreign.Object (Object, lookup)
import Foreign.Object as Object
import Prim.Ordering (Ordering, LT, GT, EQ)
import Prim.Row as Row
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, unsafeUnDOM, unsafeDOM)
import Deku.Graph.DOM (TSubgraph, TTumult, unAsSubGraph, unsafeUnSubgraph)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Interpret (class DOMInterpret, connectXToY, destroyUnit, disconnectXFromY, makeElement, makeSubgraph, makeText, makeTumult)
import Deku.Tumult (Tumultuous, safeUntumult)
import Deku.Util (class TypeEqualTF)

data ConnectXToY (x :: Symbol) (y :: Symbol) = ConnectXToY (Proxy x) (Proxy y)

data DisconnectXFromY (x :: Symbol) (y :: Symbol) = DisconnectXFromY (Proxy x)
  (Proxy y)

data DestroyUnit (x :: Symbol) = DestroyUnit (Proxy x)

data MakeA (ptr :: Symbol) = MakeA (Proxy ptr)

--

data MakeText (ptr :: Symbol) = MakeText (Proxy ptr)

--

data MakeSubgraph (ptr :: Symbol) = MakeSubgraph (Proxy ptr)

data MakeTumult (ptr :: Symbol) = MakeTumult (Proxy ptr)

class CompInstr (a :: Type) (b :: Type) (o :: Ordering) | a b -> o

instance compInstrDcL :: CompInstr (DisconnectXFromY x y) z LT
else instance compInstrDcR :: CompInstr z (DisconnectXFromY x y) GT
else instance compInstrCoL :: CompInstr (ConnectXToY x y) z GT
else instance compInstrCoR :: CompInstr z (ConnectXToY x y) LT
else instance compInstrDsL :: CompInstr (DestroyUnit x) z LT
else instance compInstrDsR :: CompInstr z (DestroyUnit x) GT
else instance compInstrCreateSubgraphL :: CompInstr z (MakeSubgraph ptr) LT
else instance compInstrCreateSubgraphR :: CompInstr (MakeSubgraph ptr) z GT
else instance compInstrCreateTumultL :: CompInstr z (MakeTumult ptr) LT
else instance compInstrCreateTumultR :: CompInstr (MakeTumult ptr) z GT
else instance compEq :: CompInstr a b EQ

class GetLR (a :: Type) (b :: Type) (l :: Type) (r :: Type) | a b -> l r

instance getLRUnit :: GetLR a Unit Unit Unit

instance getLRCons ::
  ( CompInstr a b cmp
  , GetLRCmp cmp a b c l r
  ) =>
  GetLR a (b /\ c) l r

class
  GetLRCmp
    (cmp :: Ordering)
    (a :: Type)
    (b :: Type)
    (c :: Type)
    (l :: Type)
    (r :: Type)
  | cmp a b c -> l r

instance getLRCmpEQ :: GetLR a c l r => GetLRCmp EQ a b c (b /\ l) r

instance getLRCmpLT :: GetLR a c l r => GetLRCmp LT a b c l (b /\ r)

instance getLRCmpGT :: GetLR a c l r => GetLRCmp GT a b c (b /\ l) r

class SortInstructions (i :: Type) (o :: Type) | i -> o

instance sortInstructionsUnit :: SortInstructions Unit Unit

instance sortInstructionsLR ::
  ( GetLR a b l' r'
  , SortInstructions l' l
  , SortInstructions r' r
  , HListAppend l (a /\ r) o
  ) =>
  SortInstructions (a /\ b) o

class HListAppend (l :: Type) (r :: Type) (o :: Type) | l r -> o

instance hListAppendCons :: HListAppend b c o => HListAppend (a /\ b) c (a /\ o)

instance hListAppendUnit :: HListAppend Unit c c

class DoCreate (sym :: Symbol) (i :: Type) (o :: Type) | sym i -> o

instance doCreateMakeA :: DoCreate ptr CTOR.TA (MakeA ptr)

--
instance doCreateMakeText :: DoCreate ptr CTOR.TText (MakeText ptr)

--

instance doCreateMakeSubgraph ::
  DoCreate ptr (CTOR.TSubgraph arity terminus env) (MakeSubgraph ptr)

instance doCreateMakeTumult ::
  DoCreate ptr (CTOR.TTumult arity terminus) (MakeTumult ptr)

class
  DisconnectAll (to :: Symbol) (froms :: RL.RowList Type) (i :: Type)
  | to froms -> i

instance disconnectAllNil :: DisconnectAll to RL.Nil Unit

instance disconnectAllCons ::
  DisconnectAll to rest o =>
  DisconnectAll to (RL.Cons from ignore rest) (DisconnectXFromY from to /\ o)

class
  ConnectAll (to :: Symbol) (froms :: RL.RowList Type) (i :: Type)
  | to froms -> i

instance connectAllNil :: ConnectAll to RL.Nil Unit

instance connectAllCons ::
  ConnectAll to rest o =>
  ConnectAll to (RL.Cons from ignore rest) (ConnectXToY from to /\ o)

class
  OldToNew
    (symComp :: Ordering)
    (oldSymbol :: Symbol)
    (oldDef :: Type)
    (oldRest :: RL.RowList Type)
    (newSymbol :: Symbol)
    (newDef :: Type)
    (newRest :: RL.RowList Type)
    (instructions :: Type)
    (oldList :: RL.RowList Type)
    (newList :: RL.RowList Type)
  | symComp oldSymbol oldDef oldRest newSymbol newDef newRest -> instructions oldList newList

instance oldToNewLT ::
  ( RL.RowToList me meList
  , DisconnectAll destroy meList disconnectInstructions
  ) =>
  OldToNew LT
    destroy
    (u /\ { | me })
    thanks
    newSymbol
    newDef
    newRest
    (DestroyUnit destroy /\ disconnectInstructions)
    thanks
    (RL.Cons newSymbol newDef newRest)

instance oldToNewGT ::
  ( RL.RowToList me meList
  , ConnectAll create meList connectInstructions
  , DoCreate create u c
  ) =>
  OldToNew GT
    oldSymbol
    oldDef
    oldRest
    create
    (u /\ { | me })
    thanks
    (c /\ connectInstructions)
    (RL.Cons oldSymbol oldDef oldRest)
    thanks

instance oldToNewEQ ::
  ( TypeEqualTF oldDef newDef tf
  , OldToNewEq tf oldSymbol (oldDef /\ od) (newDef /\ nd) instructions
  ) =>
  OldToNew EQ
    oldSymbol
    (oldDef /\ od)
    oldRest
    newSymbol
    (newDef /\ nd)
    newRest
    instructions
    oldRest
    newRest

class
  ConnectAndDisconnect
    (symbol :: Symbol)
    (oldConnectionsList :: RL.RowList Type)
    (newConnectionsList :: RL.RowList Type)
    (instructions :: Type)
  | symbol oldConnectionsList newConnectionsList -> instructions

class
  ConnectAndDisconnect'
    (comp :: Ordering)
    (symbol :: Symbol)
    (old :: Symbol)
    (oldRest :: RL.RowList Type)
    (new :: Symbol)
    (newRest :: RL.RowList Type)
    (instructions :: Type)
    (oldCont :: RL.RowList Type)
    (newCont :: RL.RowList Type)
  | comp symbol old oldRest new newRest -> instructions oldCont newCont

instance connectAndDisconnectNilNil ::
  ConnectAndDisconnect symbol RL.Nil RL.Nil Unit

instance connectAndDisconnectConsNil ::
  ConnectAndDisconnect to rest RL.Nil o =>
  ConnectAndDisconnect to
    (RL.Cons from ignore rest)
    RL.Nil
    (DisconnectXFromY from to /\ o)

instance connectAndDisconnectNilCons ::
  ConnectAndDisconnect to RL.Nil rest o =>
  ConnectAndDisconnect to
    RL.Nil
    (RL.Cons from ignore rest)
    (ConnectXToY from to /\ o)

instance connectAndDisconnectConsCons ::
  ( Sym.Compare i0 i1 comp
  , ConnectAndDisconnect' comp to i0 rest0 i1 rest1 o oldNext newNext
  , ConnectAndDisconnect to oldNext newNext instr
  , HListAppend o instr oo
  ) =>
  ConnectAndDisconnect to
    (RL.Cons i0 ignore0 rest0)
    (RL.Cons i1 ignore1 rest1)
    oo

instance ltConnectAndDisconnect' ::
  ConnectAndDisconnect' LT
    to
    i0
    rest0
    i1
    rest1
    (DisconnectXFromY i0 to /\ Unit)
    rest0
    (RL.Cons i1 Unit rest1)

instance gtConnectAndDisconnect' ::
  ConnectAndDisconnect' GT
    to
    i0
    rest0
    i1
    rest1
    (ConnectXToY i1 to /\ Unit)
    (RL.Cons i0 Unit rest0)
    rest1

instance eqConnectAndDisconnect' ::
  ConnectAndDisconnect' EQ to i0 rest0 i1 rest1 Unit rest0 rest1

class
  OldToNewEq
    (tf :: Type)
    (symbol :: Symbol)
    (oldDef :: Type)
    (newDef :: Type)
    (instructions :: Type)
  | tf symbol oldDef newDef -> instructions

instance oldToNewEQFalse ::
  ( RL.RowToList toDisconnect toDisconnectList
  , DisconnectAll symbol toDisconnectList disconnectInstructions
  , RL.RowToList toConnect toConnectList
  , ConnectAll symbol toConnectList connectInstructions
  , DoCreate symbol create c
  , HListAppend disconnectInstructions connectInstructions o
  ) =>
  OldToNewEq False
    symbol
    (destroy /\ { | toDisconnect })
    (create /\ { | toConnect })
    (DestroyUnit symbol /\ c /\ o)

instance oldToNewEQTrue ::
  ( RL.RowToList oldConnections oldConnectionsList
  , RL.RowToList newConnections newConnectionsList
  , ConnectAndDisconnect symbol oldConnectionsList newConnectionsList
      instructions
  ) =>
  OldToNewEq True
    symbol
    (u0 /\ { | oldConnections })
    (u0 /\ { | newConnections })
    instructions

class
  PatchRL (old :: RL.RowList Type) (new :: RL.RowList Type) (i :: Type)
  | old new -> i

instance patchRLNilNil :: PatchRL RL.Nil RL.Nil Unit

instance patchRLConsNil ::
  ( RL.RowToList me meList
  , DisconnectAll destroy meList disconnectInstructions
  , PatchRL thanks RL.Nil rest
  , HListAppend disconnectInstructions rest o
  ) =>
  PatchRL (RL.Cons destroy (u /\ { | me }) thanks)
    RL.Nil
    (DestroyUnit destroy /\ o)

instance patchRLNilCons ::
  ( RL.RowToList me meList
  , ConnectAll create meList connectInstructions
  , PatchRL RL.Nil thanks rest
  , HListAppend connectInstructions rest o
  , DoCreate create u c
  ) =>
  PatchRL RL.Nil (RL.Cons create (u /\ { | me }) thanks) (c /\ o)

instance patchRLConsCons ::
  ( Sym.Compare oldSymbol newSymbol symComp
  , OldToNew symComp oldSymbol oldDef oldRest newSymbol newDef newRest
      instructions
      oldList
      newList
  , PatchRL oldList newList rest
  , HListAppend instructions rest o
  ) =>
  PatchRL (RL.Cons oldSymbol oldDef oldRest)
    (RL.Cons newSymbol newDef newRest)
    o

class ToGraphEffects (i :: Type) where
  toGraphEffects
    :: forall dom engine
     . DOMInterpret dom engine
    => Proxy i
    -> UntypedPatchInfo
    -> { instructions :: Array (dom -> engine)
       }
    -> { instructions :: Array (dom -> engine)
       }

instance toGraphEffectsUnit :: ToGraphEffects Unit where
  toGraphEffects _ _ = identity

instance toGraphEffectsConnectXToY ::
  ( IsSymbol from
  , IsSymbol to
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (ConnectXToY from to /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              [ connectXToY { fromId, fromUnit, toId, toUnit } ]
          }
      )
    where
    fromId = reflectSymbol (Proxy :: _ from)
    fromUnit = "PATCH"
    toId = reflectSymbol (Proxy :: _ to)
    toUnit = "PATCH"

instance toGraphEffectsDisconnectXFromY ::
  ( IsSymbol from
  , IsSymbol to
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (DisconnectXFromY from to /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              [ disconnectXFromY { fromId, fromUnit, toId, toUnit } ]
          }
      )
    where
    fromId = reflectSymbol (Proxy :: _ from)
    fromUnit = "PATCH"
    toId = reflectSymbol (Proxy :: _ to)
    toUnit = "PATCH"

instance toGraphEffectsDestroyUnit ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (DestroyUnit ptr /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <> [ destroyUnit { id, unit: u } ]
          }
      )
    where
    id = reflectSymbol (Proxy :: _ ptr)
    u = "PATCH"

instance toGraphEffectsMakeA ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeA ptr /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              [ makeElement { id, tag: "a", attributes:[] }]
          }
      )
    where
    id = reflectSymbol (Proxy :: _ ptr)

--
instance toGraphEffectsMakeText ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeText ptr /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              [ makeText { id, text: "" }]
          }
      )
    where
    id = reflectSymbol (Proxy :: _ ptr)
--

instance toGraphEffectsMakeSubgraph ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSubgraph ptr /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              ( maybe [] (\instr -> [ unAE instr ])
                  $ lookup id cache.subgraphs
              )
          }
      )
    where
    id = reflectSymbol (Proxy :: _ ptr)

instance toGraphEffectsMakeTumult ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTumult ptr /\ rest) where
  toGraphEffects _ cache i =
    toGraphEffects (Proxy :: _ rest) cache
      ( i
          { instructions = i.instructions <>
              ( maybe [] (\instr -> [ unAE instr ])
                  $ lookup id cache.tumults
              )

          }
      )
    where
    id = reflectSymbol (Proxy :: _ ptr)

type PatchInfo subgraphs tumults =
  { subgraphs :: { | subgraphs }
  , tumults :: { | tumults }
  }

newtype AE = AE
  (forall dom engine. DOMInterpret dom engine => dom -> engine)

unAE
  :: AE -> forall dom engine. DOMInterpret dom engine => dom -> engine
unAE (AE ae) = ae

type UntypedPatchInfo =
  { subgraphs :: Object AE
  , tumults :: Object AE
  }

ipatch
  :: forall dom engine proof res subgraphs tumults g0 g1
   . Patch subgraphs tumults g0 g1
  => DOMInterpret dom engine
  => GetSubgraphs g1 subgraphs
  => GetTumults g1 tumults
  => PatchInfo subgraphs tumults
  -> IxDOM dom engine proof res g0 g1 Unit
ipatch cache = IxDOM \i -> patch cache (i $> unit)

class GetSubgraphsRL (g :: RowList Type) subgraphs | g -> subgraphs where
  getSubgraphsRL
    :: forall proxy
     . proxy g
    -> { | subgraphs }
    -> Object AE

instance getSubgraphsRLNil :: GetSubgraphsRL RL.Nil subgraphs where
  getSubgraphsRL _ _ = Object.empty

instance getSubgraphsRLTumult ::
  ( IsSymbol id
  , IsSymbol terminus
  , Pos n
  , Row.Cons id
      (CTOR.Subgraph (CTOR.AsSubgraph terminus env push) (Vec n env))
      r'
      subgraphs
  , GetSubgraphsRL rest subgraphs
  ) =>
  GetSubgraphsRL (RL.Cons id (TSubgraph n terminus env /\ whatever) rest)
    subgraphs where
  getSubgraphsRL _ t = Object.insert id
    ( AE
        ( let
            { subgraphMaker, envs } = unsafeUnSubgraph (get (Proxy :: _ id) t)
          in
            makeSubgraph
              { id
              , terminus: reflectSymbol (Proxy :: _ terminus)
              , envs
              , scenes: unAsSubGraph subgraphMaker
              }
        )
    )
    (getSubgraphsRL (Proxy :: Proxy rest) t)
    where
    id = reflectSymbol (Proxy :: _ id)
else instance getSubgraphsRLOther ::
  GetSubgraphsRL rest subgraphs =>
  GetSubgraphsRL (RL.Cons soCares soWhat rest) subgraphs where
  getSubgraphsRL _ = getSubgraphsRL (Proxy :: Proxy rest)

class GetSubgraphs (g :: Graph) subgraphs | g -> subgraphs where
  getSubgraphs
    :: forall proxy
     . proxy g
    -> { | subgraphs }
    -> Object AE

instance getSubgraphsAll ::
  ( RowToList g rl
  , GetSubgraphsRL rl subgraphs
  ) =>
  GetSubgraphs g subgraphs where
  getSubgraphs _ = getSubgraphsRL (Proxy :: Proxy rl)

class GetTumultsRL (rl :: RowList Type) tumults | rl -> tumults where
  getTumultsRL
    :: forall proxyRL
     . proxyRL rl
    -> { | tumults }
    -> Object AE

instance getTumultsRLNil :: GetTumultsRL RL.Nil tumults where
  getTumultsRL _ _ = Object.empty

instance getTumultsRLTumult ::
  ( IsSymbol id
  , IsSymbol terminus
  , Row.Cons id (Tumultuous n terminus) r' tumults
  , GetTumultsRL rest tumults
  ) =>
  GetTumultsRL (RL.Cons id (TTumult n terminus /\ whatever) rest) tumults where
  getTumultsRL _ t = Object.insert id
    ( AE
        ( makeTumult
            { id
            , terminus: reflectSymbol (Proxy :: _ terminus)
            , instructions: safeUntumult (get (Proxy :: _ id) t)
            }
        )
    )
    (getTumultsRL (Proxy :: Proxy rest) t)
    where
    id = reflectSymbol (Proxy :: _ id)
else instance getTumultsRLOther ::
  GetTumultsRL rest tumults =>
  GetTumultsRL (RL.Cons soCares soWhat rest) tumults where
  getTumultsRL _ = getTumultsRL (Proxy :: Proxy rest)

class GetTumults (g :: Graph) tumults | g -> tumults where
  getTumults
    :: forall proxy
     . proxy g
    -> { | tumults }
    -> Object AE

instance getTumultsAll ::
  ( RowToList g rl
  , GetTumultsRL rl tumults
  ) =>
  GetTumults g tumults where
  getTumults _ = getTumultsRL (Proxy :: Proxy rl)

type PatchSig subgraphs tumults g0 g1 =
  forall dom engine proof res a
   . DOMInterpret dom engine
  => GetSubgraphs g1 subgraphs
  => GetTumults g1 tumults
  => PatchInfo subgraphs tumults
  -> DOM dom engine proof res g0 a
  -> DOM dom engine proof res g1 a

type PatchSigRes subgraphs tumults g0 g1 res =
  forall dom engine proof a
   . DOMInterpret dom engine
  => GetSubgraphs g1 subgraphs
  => GetTumults g1 tumults
  => Monoid res
  => PatchInfo subgraphs tumults
  -> DOM dom engine proof res g0 a
  -> DOM dom engine proof res g1 a

class
  ( GetSubgraphs g1 subgraphs
  , GetTumults g1 tumults
  ) <=
  Patch subgraphs tumults g0 g1
  | g1 -> subgraphs
  , g1 -> tumults where
  -- | Take any frame from `g0` to `g1`. The compiler automatically determines the necessary operations to perform the transformation.
  patch
    :: forall dom engine proof res a
     . DOMInterpret dom engine
    => PatchInfo subgraphs tumults
    -> DOM dom engine proof res g0 a
    -> DOM dom engine proof res g1 a

instance patchAll ::
  ( RowToList old oldList
  , RowToList new newList
  , PatchRL oldList newList instructions'
  , GetSubgraphs new subgraphs
  , GetTumults new tumults
  , SortInstructions instructions' instructions
  , ToGraphEffects instructions
  ) =>
  Patch subgraphs tumults old new where
  patch cache w =
    unsafeDOM
      { context:
          i
            { instructions = n.instructions
            }
      , value
      }
    where
    { context: i@{ instructions }, value } = unsafeUnDOM w
    newCache = cache
      { subgraphs = getSubgraphs (Proxy :: Proxy new) cache.subgraphs
      , tumults = getTumults (Proxy :: Proxy new) cache.tumults
      }

    n = toGraphEffects (Proxy :: _ (instructions)) newCache { instructions }
