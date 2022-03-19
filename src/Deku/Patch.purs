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

unsafeToGraphEffects
  :: forall sym proxy ge dom engine
   . IsSymbol sym
  => ToGraphEffects ge
  => DOMInterpret dom engine
  => proxy sym
  -> Proxy ge
  -> { subgraphs :: Object AE
     , tumults :: Object AE
     }
  -> { instructions :: Array (dom -> engine)
     }
  -> String
  -> { instructions :: Array (dom -> engine)
     }
unsafeToGraphEffects ptr rest cache i tag =
  toGraphEffects rest cache
    ( i
        { instructions = i.instructions <>
            [ makeElement { id, tag, attributes: [] } ]
        }
    )
  where
  id = reflectSymbol ptr

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
              [ makeText { id, text: "" } ]
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

-- codegen

data MakeA (ptr :: Symbol) = MakeA (Proxy ptr)
instance doCreateMakeA :: DoCreate ptr CTOR.TA (MakeA ptr)
instance toGraphEffectsMakeA ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeA ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "a"
data MakeAbbr (ptr :: Symbol) = MakeAbbr (Proxy ptr)
instance doCreateMakeAbbr :: DoCreate ptr CTOR.TAbbr (MakeAbbr ptr)
instance toGraphEffectsMakeAbbr ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAbbr ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "abbr"
data MakeAcronym (ptr :: Symbol) = MakeAcronym (Proxy ptr)
instance doCreateMakeAcronym :: DoCreate ptr CTOR.TAcronym (MakeAcronym ptr)
instance toGraphEffectsMakeAcronym ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAcronym ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "acronym"
data MakeAddress (ptr :: Symbol) = MakeAddress (Proxy ptr)
instance doCreateMakeAddress :: DoCreate ptr CTOR.TAddress (MakeAddress ptr)
instance toGraphEffectsMakeAddress ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAddress ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "address"
data MakeApplet (ptr :: Symbol) = MakeApplet (Proxy ptr)
instance doCreateMakeApplet :: DoCreate ptr CTOR.TApplet (MakeApplet ptr)
instance toGraphEffectsMakeApplet ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeApplet ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "applet"
data MakeArea (ptr :: Symbol) = MakeArea (Proxy ptr)
instance doCreateMakeArea :: DoCreate ptr CTOR.TArea (MakeArea ptr)
instance toGraphEffectsMakeArea ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeArea ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "area"
data MakeArticle (ptr :: Symbol) = MakeArticle (Proxy ptr)
instance doCreateMakeArticle :: DoCreate ptr CTOR.TArticle (MakeArticle ptr)
instance toGraphEffectsMakeArticle ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeArticle ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "article"
data MakeAside (ptr :: Symbol) = MakeAside (Proxy ptr)
instance doCreateMakeAside :: DoCreate ptr CTOR.TAside (MakeAside ptr)
instance toGraphEffectsMakeAside ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAside ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "aside"
data MakeAudio (ptr :: Symbol) = MakeAudio (Proxy ptr)
instance doCreateMakeAudio :: DoCreate ptr CTOR.TAudio (MakeAudio ptr)
instance toGraphEffectsMakeAudio ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAudio ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "audio"
data MakeB (ptr :: Symbol) = MakeB (Proxy ptr)
instance doCreateMakeB :: DoCreate ptr CTOR.TB (MakeB ptr)
instance toGraphEffectsMakeB ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeB ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "b"
data MakeBase (ptr :: Symbol) = MakeBase (Proxy ptr)
instance doCreateMakeBase :: DoCreate ptr CTOR.TBase (MakeBase ptr)
instance toGraphEffectsMakeBase ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBase ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "base"
data MakeBasefont (ptr :: Symbol) = MakeBasefont (Proxy ptr)
instance doCreateMakeBasefont :: DoCreate ptr CTOR.TBasefont (MakeBasefont ptr)
instance toGraphEffectsMakeBasefont ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBasefont ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "basefont"
data MakeBdi (ptr :: Symbol) = MakeBdi (Proxy ptr)
instance doCreateMakeBdi :: DoCreate ptr CTOR.TBdi (MakeBdi ptr)
instance toGraphEffectsMakeBdi ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBdi ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "bdi"
data MakeBdo (ptr :: Symbol) = MakeBdo (Proxy ptr)
instance doCreateMakeBdo :: DoCreate ptr CTOR.TBdo (MakeBdo ptr)
instance toGraphEffectsMakeBdo ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBdo ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "bdo"
data MakeBig (ptr :: Symbol) = MakeBig (Proxy ptr)
instance doCreateMakeBig :: DoCreate ptr CTOR.TBig (MakeBig ptr)
instance toGraphEffectsMakeBig ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBig ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "big"
data MakeBlockquote (ptr :: Symbol) = MakeBlockquote (Proxy ptr)
instance doCreateMakeBlockquote :: DoCreate ptr CTOR.TBlockquote (MakeBlockquote ptr)
instance toGraphEffectsMakeBlockquote ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBlockquote ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "blockquote"
data MakeBody (ptr :: Symbol) = MakeBody (Proxy ptr)
instance doCreateMakeBody :: DoCreate ptr CTOR.TBody (MakeBody ptr)
instance toGraphEffectsMakeBody ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBody ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "body"
data MakeBr (ptr :: Symbol) = MakeBr (Proxy ptr)
instance doCreateMakeBr :: DoCreate ptr CTOR.TBr (MakeBr ptr)
instance toGraphEffectsMakeBr ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBr ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "br"
data MakeButton (ptr :: Symbol) = MakeButton (Proxy ptr)
instance doCreateMakeButton :: DoCreate ptr CTOR.TButton (MakeButton ptr)
instance toGraphEffectsMakeButton ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeButton ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "button"
data MakeCanvas (ptr :: Symbol) = MakeCanvas (Proxy ptr)
instance doCreateMakeCanvas :: DoCreate ptr CTOR.TCanvas (MakeCanvas ptr)
instance toGraphEffectsMakeCanvas ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCanvas ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "canvas"
data MakeCaption (ptr :: Symbol) = MakeCaption (Proxy ptr)
instance doCreateMakeCaption :: DoCreate ptr CTOR.TCaption (MakeCaption ptr)
instance toGraphEffectsMakeCaption ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCaption ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "caption"
data MakeCenter (ptr :: Symbol) = MakeCenter (Proxy ptr)
instance doCreateMakeCenter :: DoCreate ptr CTOR.TCenter (MakeCenter ptr)
instance toGraphEffectsMakeCenter ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCenter ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "center"
data MakeCite (ptr :: Symbol) = MakeCite (Proxy ptr)
instance doCreateMakeCite :: DoCreate ptr CTOR.TCite (MakeCite ptr)
instance toGraphEffectsMakeCite ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCite ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "cite"
data MakeCode (ptr :: Symbol) = MakeCode (Proxy ptr)
instance doCreateMakeCode :: DoCreate ptr CTOR.TCode (MakeCode ptr)
instance toGraphEffectsMakeCode ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCode ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "code"
data MakeCol (ptr :: Symbol) = MakeCol (Proxy ptr)
instance doCreateMakeCol :: DoCreate ptr CTOR.TCol (MakeCol ptr)
instance toGraphEffectsMakeCol ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCol ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "col"
data MakeColgroup (ptr :: Symbol) = MakeColgroup (Proxy ptr)
instance doCreateMakeColgroup :: DoCreate ptr CTOR.TColgroup (MakeColgroup ptr)
instance toGraphEffectsMakeColgroup ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeColgroup ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "colgroup"
data MakeData (ptr :: Symbol) = MakeData (Proxy ptr)
instance doCreateMakeData :: DoCreate ptr CTOR.TData (MakeData ptr)
instance toGraphEffectsMakeData ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeData ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "data"
data MakeDatalist (ptr :: Symbol) = MakeDatalist (Proxy ptr)
instance doCreateMakeDatalist :: DoCreate ptr CTOR.TDatalist (MakeDatalist ptr)
instance toGraphEffectsMakeDatalist ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDatalist ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "datalist"
data MakeDd (ptr :: Symbol) = MakeDd (Proxy ptr)
instance doCreateMakeDd :: DoCreate ptr CTOR.TDd (MakeDd ptr)
instance toGraphEffectsMakeDd ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDd ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dd"
data MakeDel (ptr :: Symbol) = MakeDel (Proxy ptr)
instance doCreateMakeDel :: DoCreate ptr CTOR.TDel (MakeDel ptr)
instance toGraphEffectsMakeDel ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDel ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "del"
data MakeDetails (ptr :: Symbol) = MakeDetails (Proxy ptr)
instance doCreateMakeDetails :: DoCreate ptr CTOR.TDetails (MakeDetails ptr)
instance toGraphEffectsMakeDetails ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDetails ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "details"
data MakeDfn (ptr :: Symbol) = MakeDfn (Proxy ptr)
instance doCreateMakeDfn :: DoCreate ptr CTOR.TDfn (MakeDfn ptr)
instance toGraphEffectsMakeDfn ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDfn ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dfn"
data MakeDialog (ptr :: Symbol) = MakeDialog (Proxy ptr)
instance doCreateMakeDialog :: DoCreate ptr CTOR.TDialog (MakeDialog ptr)
instance toGraphEffectsMakeDialog ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDialog ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dialog"
data MakeDir (ptr :: Symbol) = MakeDir (Proxy ptr)
instance doCreateMakeDir :: DoCreate ptr CTOR.TDir (MakeDir ptr)
instance toGraphEffectsMakeDir ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDir ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dir"
data MakeDiv (ptr :: Symbol) = MakeDiv (Proxy ptr)
instance doCreateMakeDiv :: DoCreate ptr CTOR.TDiv (MakeDiv ptr)
instance toGraphEffectsMakeDiv ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDiv ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "div"
data MakeDl (ptr :: Symbol) = MakeDl (Proxy ptr)
instance doCreateMakeDl :: DoCreate ptr CTOR.TDl (MakeDl ptr)
instance toGraphEffectsMakeDl ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDl ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dl"
data MakeDt (ptr :: Symbol) = MakeDt (Proxy ptr)
instance doCreateMakeDt :: DoCreate ptr CTOR.TDt (MakeDt ptr)
instance toGraphEffectsMakeDt ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDt ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dt"
data MakeEm (ptr :: Symbol) = MakeEm (Proxy ptr)
instance doCreateMakeEm :: DoCreate ptr CTOR.TEm (MakeEm ptr)
instance toGraphEffectsMakeEm ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeEm ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "em"
data MakeEmbed (ptr :: Symbol) = MakeEmbed (Proxy ptr)
instance doCreateMakeEmbed :: DoCreate ptr CTOR.TEmbed (MakeEmbed ptr)
instance toGraphEffectsMakeEmbed ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeEmbed ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "embed"
data MakeFieldset (ptr :: Symbol) = MakeFieldset (Proxy ptr)
instance doCreateMakeFieldset :: DoCreate ptr CTOR.TFieldset (MakeFieldset ptr)
instance toGraphEffectsMakeFieldset ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFieldset ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "fieldset"
data MakeFigcaption (ptr :: Symbol) = MakeFigcaption (Proxy ptr)
instance doCreateMakeFigcaption :: DoCreate ptr CTOR.TFigcaption (MakeFigcaption ptr)
instance toGraphEffectsMakeFigcaption ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFigcaption ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "figcaption"
data MakeFigure (ptr :: Symbol) = MakeFigure (Proxy ptr)
instance doCreateMakeFigure :: DoCreate ptr CTOR.TFigure (MakeFigure ptr)
instance toGraphEffectsMakeFigure ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFigure ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "figure"
data MakeFont (ptr :: Symbol) = MakeFont (Proxy ptr)
instance doCreateMakeFont :: DoCreate ptr CTOR.TFont (MakeFont ptr)
instance toGraphEffectsMakeFont ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFont ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "font"
data MakeFooter (ptr :: Symbol) = MakeFooter (Proxy ptr)
instance doCreateMakeFooter :: DoCreate ptr CTOR.TFooter (MakeFooter ptr)
instance toGraphEffectsMakeFooter ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFooter ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "footer"
data MakeForm (ptr :: Symbol) = MakeForm (Proxy ptr)
instance doCreateMakeForm :: DoCreate ptr CTOR.TForm (MakeForm ptr)
instance toGraphEffectsMakeForm ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeForm ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "form"
data MakeFrame (ptr :: Symbol) = MakeFrame (Proxy ptr)
instance doCreateMakeFrame :: DoCreate ptr CTOR.TFrame (MakeFrame ptr)
instance toGraphEffectsMakeFrame ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFrame ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "frame"
data MakeFrameset (ptr :: Symbol) = MakeFrameset (Proxy ptr)
instance doCreateMakeFrameset :: DoCreate ptr CTOR.TFrameset (MakeFrameset ptr)
instance toGraphEffectsMakeFrameset ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFrameset ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "frameset"
data MakeH1 (ptr :: Symbol) = MakeH1 (Proxy ptr)
instance doCreateMakeH1 :: DoCreate ptr CTOR.TH1 (MakeH1 ptr)
instance toGraphEffectsMakeH1 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH1 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h1"
data MakeH2 (ptr :: Symbol) = MakeH2 (Proxy ptr)
instance doCreateMakeH2 :: DoCreate ptr CTOR.TH2 (MakeH2 ptr)
instance toGraphEffectsMakeH2 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH2 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h2"
data MakeH3 (ptr :: Symbol) = MakeH3 (Proxy ptr)
instance doCreateMakeH3 :: DoCreate ptr CTOR.TH3 (MakeH3 ptr)
instance toGraphEffectsMakeH3 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH3 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h3"
data MakeH4 (ptr :: Symbol) = MakeH4 (Proxy ptr)
instance doCreateMakeH4 :: DoCreate ptr CTOR.TH4 (MakeH4 ptr)
instance toGraphEffectsMakeH4 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH4 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h4"
data MakeH5 (ptr :: Symbol) = MakeH5 (Proxy ptr)
instance doCreateMakeH5 :: DoCreate ptr CTOR.TH5 (MakeH5 ptr)
instance toGraphEffectsMakeH5 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH5 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h5"
data MakeH6 (ptr :: Symbol) = MakeH6 (Proxy ptr)
instance doCreateMakeH6 :: DoCreate ptr CTOR.TH6 (MakeH6 ptr)
instance toGraphEffectsMakeH6 ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH6 ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h6"
data MakeHead (ptr :: Symbol) = MakeHead (Proxy ptr)
instance doCreateMakeHead :: DoCreate ptr CTOR.THead (MakeHead ptr)
instance toGraphEffectsMakeHead ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHead ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "head"
data MakeHeader (ptr :: Symbol) = MakeHeader (Proxy ptr)
instance doCreateMakeHeader :: DoCreate ptr CTOR.THeader (MakeHeader ptr)
instance toGraphEffectsMakeHeader ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHeader ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "header"
data MakeHr (ptr :: Symbol) = MakeHr (Proxy ptr)
instance doCreateMakeHr :: DoCreate ptr CTOR.THr (MakeHr ptr)
instance toGraphEffectsMakeHr ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHr ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "hr"
data MakeHtml (ptr :: Symbol) = MakeHtml (Proxy ptr)
instance doCreateMakeHtml :: DoCreate ptr CTOR.THtml (MakeHtml ptr)
instance toGraphEffectsMakeHtml ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHtml ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "html"
data MakeI (ptr :: Symbol) = MakeI (Proxy ptr)
instance doCreateMakeI :: DoCreate ptr CTOR.TI (MakeI ptr)
instance toGraphEffectsMakeI ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeI ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "i"
data MakeIframe (ptr :: Symbol) = MakeIframe (Proxy ptr)
instance doCreateMakeIframe :: DoCreate ptr CTOR.TIframe (MakeIframe ptr)
instance toGraphEffectsMakeIframe ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeIframe ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "iframe"
data MakeImg (ptr :: Symbol) = MakeImg (Proxy ptr)
instance doCreateMakeImg :: DoCreate ptr CTOR.TImg (MakeImg ptr)
instance toGraphEffectsMakeImg ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeImg ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "img"
data MakeInput (ptr :: Symbol) = MakeInput (Proxy ptr)
instance doCreateMakeInput :: DoCreate ptr CTOR.TInput (MakeInput ptr)
instance toGraphEffectsMakeInput ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeInput ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "input"
data MakeIns (ptr :: Symbol) = MakeIns (Proxy ptr)
instance doCreateMakeIns :: DoCreate ptr CTOR.TIns (MakeIns ptr)
instance toGraphEffectsMakeIns ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeIns ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ins"
data MakeKbd (ptr :: Symbol) = MakeKbd (Proxy ptr)
instance doCreateMakeKbd :: DoCreate ptr CTOR.TKbd (MakeKbd ptr)
instance toGraphEffectsMakeKbd ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeKbd ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "kbd"
data MakeLabel (ptr :: Symbol) = MakeLabel (Proxy ptr)
instance doCreateMakeLabel :: DoCreate ptr CTOR.TLabel (MakeLabel ptr)
instance toGraphEffectsMakeLabel ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLabel ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "label"
data MakeLegend (ptr :: Symbol) = MakeLegend (Proxy ptr)
instance doCreateMakeLegend :: DoCreate ptr CTOR.TLegend (MakeLegend ptr)
instance toGraphEffectsMakeLegend ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLegend ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "legend"
data MakeLi (ptr :: Symbol) = MakeLi (Proxy ptr)
instance doCreateMakeLi :: DoCreate ptr CTOR.TLi (MakeLi ptr)
instance toGraphEffectsMakeLi ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLi ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "li"
data MakeLink (ptr :: Symbol) = MakeLink (Proxy ptr)
instance doCreateMakeLink :: DoCreate ptr CTOR.TLink (MakeLink ptr)
instance toGraphEffectsMakeLink ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLink ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "link"
data MakeMain (ptr :: Symbol) = MakeMain (Proxy ptr)
instance doCreateMakeMain :: DoCreate ptr CTOR.TMain (MakeMain ptr)
instance toGraphEffectsMakeMain ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMain ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "main"
data MakeMap (ptr :: Symbol) = MakeMap (Proxy ptr)
instance doCreateMakeMap :: DoCreate ptr CTOR.TMap (MakeMap ptr)
instance toGraphEffectsMakeMap ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMap ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "map"
data MakeMark (ptr :: Symbol) = MakeMark (Proxy ptr)
instance doCreateMakeMark :: DoCreate ptr CTOR.TMark (MakeMark ptr)
instance toGraphEffectsMakeMark ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMark ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "mark"
data MakeMeta (ptr :: Symbol) = MakeMeta (Proxy ptr)
instance doCreateMakeMeta :: DoCreate ptr CTOR.TMeta (MakeMeta ptr)
instance toGraphEffectsMakeMeta ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMeta ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "meta"
data MakeMeter (ptr :: Symbol) = MakeMeter (Proxy ptr)
instance doCreateMakeMeter :: DoCreate ptr CTOR.TMeter (MakeMeter ptr)
instance toGraphEffectsMakeMeter ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMeter ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "meter"
data MakeNav (ptr :: Symbol) = MakeNav (Proxy ptr)
instance doCreateMakeNav :: DoCreate ptr CTOR.TNav (MakeNav ptr)
instance toGraphEffectsMakeNav ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNav ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "nav"
data MakeNoframes (ptr :: Symbol) = MakeNoframes (Proxy ptr)
instance doCreateMakeNoframes :: DoCreate ptr CTOR.TNoframes (MakeNoframes ptr)
instance toGraphEffectsMakeNoframes ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNoframes ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "noframes"
data MakeNoscript (ptr :: Symbol) = MakeNoscript (Proxy ptr)
instance doCreateMakeNoscript :: DoCreate ptr CTOR.TNoscript (MakeNoscript ptr)
instance toGraphEffectsMakeNoscript ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNoscript ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "noscript"
data MakeObject (ptr :: Symbol) = MakeObject (Proxy ptr)
instance doCreateMakeObject :: DoCreate ptr CTOR.TObject (MakeObject ptr)
instance toGraphEffectsMakeObject ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeObject ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "object"
data MakeOl (ptr :: Symbol) = MakeOl (Proxy ptr)
instance doCreateMakeOl :: DoCreate ptr CTOR.TOl (MakeOl ptr)
instance toGraphEffectsMakeOl ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOl ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ol"
data MakeOptgroup (ptr :: Symbol) = MakeOptgroup (Proxy ptr)
instance doCreateMakeOptgroup :: DoCreate ptr CTOR.TOptgroup (MakeOptgroup ptr)
instance toGraphEffectsMakeOptgroup ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOptgroup ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "optgroup"
data MakeOption (ptr :: Symbol) = MakeOption (Proxy ptr)
instance doCreateMakeOption :: DoCreate ptr CTOR.TOption (MakeOption ptr)
instance toGraphEffectsMakeOption ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOption ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "option"
data MakeOutput (ptr :: Symbol) = MakeOutput (Proxy ptr)
instance doCreateMakeOutput :: DoCreate ptr CTOR.TOutput (MakeOutput ptr)
instance toGraphEffectsMakeOutput ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOutput ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "output"
data MakeP (ptr :: Symbol) = MakeP (Proxy ptr)
instance doCreateMakeP :: DoCreate ptr CTOR.TP (MakeP ptr)
instance toGraphEffectsMakeP ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeP ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "p"
data MakeParam (ptr :: Symbol) = MakeParam (Proxy ptr)
instance doCreateMakeParam :: DoCreate ptr CTOR.TParam (MakeParam ptr)
instance toGraphEffectsMakeParam ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeParam ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "param"
data MakePicture (ptr :: Symbol) = MakePicture (Proxy ptr)
instance doCreateMakePicture :: DoCreate ptr CTOR.TPicture (MakePicture ptr)
instance toGraphEffectsMakePicture ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakePicture ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "picture"
data MakePre (ptr :: Symbol) = MakePre (Proxy ptr)
instance doCreateMakePre :: DoCreate ptr CTOR.TPre (MakePre ptr)
instance toGraphEffectsMakePre ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakePre ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "pre"
data MakeProgress (ptr :: Symbol) = MakeProgress (Proxy ptr)
instance doCreateMakeProgress :: DoCreate ptr CTOR.TProgress (MakeProgress ptr)
instance toGraphEffectsMakeProgress ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeProgress ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "progress"
data MakeQ (ptr :: Symbol) = MakeQ (Proxy ptr)
instance doCreateMakeQ :: DoCreate ptr CTOR.TQ (MakeQ ptr)
instance toGraphEffectsMakeQ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeQ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "q"
data MakeRp (ptr :: Symbol) = MakeRp (Proxy ptr)
instance doCreateMakeRp :: DoCreate ptr CTOR.TRp (MakeRp ptr)
instance toGraphEffectsMakeRp ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRp ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "rp"
data MakeRt (ptr :: Symbol) = MakeRt (Proxy ptr)
instance doCreateMakeRt :: DoCreate ptr CTOR.TRt (MakeRt ptr)
instance toGraphEffectsMakeRt ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRt ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "rt"
data MakeRuby (ptr :: Symbol) = MakeRuby (Proxy ptr)
instance doCreateMakeRuby :: DoCreate ptr CTOR.TRuby (MakeRuby ptr)
instance toGraphEffectsMakeRuby ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRuby ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ruby"
data MakeS (ptr :: Symbol) = MakeS (Proxy ptr)
instance doCreateMakeS :: DoCreate ptr CTOR.TS (MakeS ptr)
instance toGraphEffectsMakeS ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeS ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "s"
data MakeSamp (ptr :: Symbol) = MakeSamp (Proxy ptr)
instance doCreateMakeSamp :: DoCreate ptr CTOR.TSamp (MakeSamp ptr)
instance toGraphEffectsMakeSamp ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSamp ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "samp"
data MakeScript (ptr :: Symbol) = MakeScript (Proxy ptr)
instance doCreateMakeScript :: DoCreate ptr CTOR.TScript (MakeScript ptr)
instance toGraphEffectsMakeScript ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeScript ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "script"
data MakeSection (ptr :: Symbol) = MakeSection (Proxy ptr)
instance doCreateMakeSection :: DoCreate ptr CTOR.TSection (MakeSection ptr)
instance toGraphEffectsMakeSection ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSection ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "section"
data MakeSelect (ptr :: Symbol) = MakeSelect (Proxy ptr)
instance doCreateMakeSelect :: DoCreate ptr CTOR.TSelect (MakeSelect ptr)
instance toGraphEffectsMakeSelect ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSelect ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "select"
data MakeSmall (ptr :: Symbol) = MakeSmall (Proxy ptr)
instance doCreateMakeSmall :: DoCreate ptr CTOR.TSmall (MakeSmall ptr)
instance toGraphEffectsMakeSmall ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSmall ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "small"
data MakeSource (ptr :: Symbol) = MakeSource (Proxy ptr)
instance doCreateMakeSource :: DoCreate ptr CTOR.TSource (MakeSource ptr)
instance toGraphEffectsMakeSource ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSource ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "source"
data MakeSpan (ptr :: Symbol) = MakeSpan (Proxy ptr)
instance doCreateMakeSpan :: DoCreate ptr CTOR.TSpan (MakeSpan ptr)
instance toGraphEffectsMakeSpan ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSpan ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "span"
data MakeStrike (ptr :: Symbol) = MakeStrike (Proxy ptr)
instance doCreateMakeStrike :: DoCreate ptr CTOR.TStrike (MakeStrike ptr)
instance toGraphEffectsMakeStrike ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStrike ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "strike"
data MakeStrong (ptr :: Symbol) = MakeStrong (Proxy ptr)
instance doCreateMakeStrong :: DoCreate ptr CTOR.TStrong (MakeStrong ptr)
instance toGraphEffectsMakeStrong ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStrong ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "strong"
data MakeStyle (ptr :: Symbol) = MakeStyle (Proxy ptr)
instance doCreateMakeStyle :: DoCreate ptr CTOR.TStyle (MakeStyle ptr)
instance toGraphEffectsMakeStyle ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStyle ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "style"
data MakeSub (ptr :: Symbol) = MakeSub (Proxy ptr)
instance doCreateMakeSub :: DoCreate ptr CTOR.TSub (MakeSub ptr)
instance toGraphEffectsMakeSub ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSub ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "sub"
data MakeSummary (ptr :: Symbol) = MakeSummary (Proxy ptr)
instance doCreateMakeSummary :: DoCreate ptr CTOR.TSummary (MakeSummary ptr)
instance toGraphEffectsMakeSummary ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSummary ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "summary"
data MakeSup (ptr :: Symbol) = MakeSup (Proxy ptr)
instance doCreateMakeSup :: DoCreate ptr CTOR.TSup (MakeSup ptr)
instance toGraphEffectsMakeSup ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSup ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "sup"
data MakeSvg (ptr :: Symbol) = MakeSvg (Proxy ptr)
instance doCreateMakeSvg :: DoCreate ptr CTOR.TSvg (MakeSvg ptr)
instance toGraphEffectsMakeSvg ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSvg ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "svg"
data MakeTable (ptr :: Symbol) = MakeTable (Proxy ptr)
instance doCreateMakeTable :: DoCreate ptr CTOR.TTable (MakeTable ptr)
instance toGraphEffectsMakeTable ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTable ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "table"
data MakeTbody (ptr :: Symbol) = MakeTbody (Proxy ptr)
instance doCreateMakeTbody :: DoCreate ptr CTOR.TTbody (MakeTbody ptr)
instance toGraphEffectsMakeTbody ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTbody ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tbody"
data MakeTd (ptr :: Symbol) = MakeTd (Proxy ptr)
instance doCreateMakeTd :: DoCreate ptr CTOR.TTd (MakeTd ptr)
instance toGraphEffectsMakeTd ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTd ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "td"
data MakeTemplate (ptr :: Symbol) = MakeTemplate (Proxy ptr)
instance doCreateMakeTemplate :: DoCreate ptr CTOR.TTemplate (MakeTemplate ptr)
instance toGraphEffectsMakeTemplate ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTemplate ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "template"
data MakeTextarea (ptr :: Symbol) = MakeTextarea (Proxy ptr)
instance doCreateMakeTextarea :: DoCreate ptr CTOR.TTextarea (MakeTextarea ptr)
instance toGraphEffectsMakeTextarea ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTextarea ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "textarea"
data MakeTfoot (ptr :: Symbol) = MakeTfoot (Proxy ptr)
instance doCreateMakeTfoot :: DoCreate ptr CTOR.TTfoot (MakeTfoot ptr)
instance toGraphEffectsMakeTfoot ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTfoot ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tfoot"
data MakeTh (ptr :: Symbol) = MakeTh (Proxy ptr)
instance doCreateMakeTh :: DoCreate ptr CTOR.TTh (MakeTh ptr)
instance toGraphEffectsMakeTh ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTh ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "th"
data MakeThead (ptr :: Symbol) = MakeThead (Proxy ptr)
instance doCreateMakeThead :: DoCreate ptr CTOR.TThead (MakeThead ptr)
instance toGraphEffectsMakeThead ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeThead ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "thead"
data MakeTime (ptr :: Symbol) = MakeTime (Proxy ptr)
instance doCreateMakeTime :: DoCreate ptr CTOR.TTime (MakeTime ptr)
instance toGraphEffectsMakeTime ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTime ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "time"
data MakeTitle (ptr :: Symbol) = MakeTitle (Proxy ptr)
instance doCreateMakeTitle :: DoCreate ptr CTOR.TTitle (MakeTitle ptr)
instance toGraphEffectsMakeTitle ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTitle ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "title"
data MakeTr (ptr :: Symbol) = MakeTr (Proxy ptr)
instance doCreateMakeTr :: DoCreate ptr CTOR.TTr (MakeTr ptr)
instance toGraphEffectsMakeTr ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTr ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tr"
data MakeTrack (ptr :: Symbol) = MakeTrack (Proxy ptr)
instance doCreateMakeTrack :: DoCreate ptr CTOR.TTrack (MakeTrack ptr)
instance toGraphEffectsMakeTrack ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTrack ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "track"
data MakeTt (ptr :: Symbol) = MakeTt (Proxy ptr)
instance doCreateMakeTt :: DoCreate ptr CTOR.TTt (MakeTt ptr)
instance toGraphEffectsMakeTt ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTt ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tt"
data MakeU (ptr :: Symbol) = MakeU (Proxy ptr)
instance doCreateMakeU :: DoCreate ptr CTOR.TU (MakeU ptr)
instance toGraphEffectsMakeU ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeU ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "u"
data MakeUl (ptr :: Symbol) = MakeUl (Proxy ptr)
instance doCreateMakeUl :: DoCreate ptr CTOR.TUl (MakeUl ptr)
instance toGraphEffectsMakeUl ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeUl ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ul"
data MakeVar (ptr :: Symbol) = MakeVar (Proxy ptr)
instance doCreateMakeVar :: DoCreate ptr CTOR.TVar (MakeVar ptr)
instance toGraphEffectsMakeVar ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeVar ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "var"
data MakeVideo (ptr :: Symbol) = MakeVideo (Proxy ptr)
instance doCreateMakeVideo :: DoCreate ptr CTOR.TVideo (MakeVideo ptr)
instance toGraphEffectsMakeVideo ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeVideo ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "video"
data MakeWbr (ptr :: Symbol) = MakeWbr (Proxy ptr)
instance doCreateMakeWbr :: DoCreate ptr CTOR.TWbr (MakeWbr ptr)
instance toGraphEffectsMakeWbr ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeWbr ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "wbr"
