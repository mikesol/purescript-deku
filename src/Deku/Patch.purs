module Deku.Patch where

import Prelude hiding (Ordering(..))

import Data.Maybe (maybe)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple.Nested (type (/\))
import Data.Typelevel.Bool (False, True)
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, unsafeUnDOM, unsafeDOM)
import Deku.Graph.DOM (TSubgraph, TTumult, unAsSubGraph, unsafeUnSubgraph)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Interpret (class DOMInterpret, connectXToY, destroyUnit, disconnectXFromY, makeElement, makeSubgraph, makeText, makeTumult)
import Deku.Tumult (Tumultuous, safeUntumult)
import Deku.Util (class TypeEqualTF)
import Foreign.Object (Object, lookup)
import Foreign.Object as Object
import Prim.Ordering (Ordering, LT, GT, EQ)
import Prim.Row as Row
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Prim.Symbol as Sym
import Record (get)
import Type.Proxy (Proxy(..))

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
  DoCreate ptr (CTOR.TSubgraph terminus env) (MakeSubgraph ptr)

instance doCreateMakeTumult ::
  DoCreate ptr (CTOR.TTumult terminus) (MakeTumult ptr)

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
  , Row.Cons id
      (CTOR.Subgraph index terminus env push)
      r'
      subgraphs
  , GetSubgraphsRL rest subgraphs
  ) =>
  GetSubgraphsRL (RL.Cons id (TSubgraph terminus env /\ whatever) rest)
    subgraphs where
  getSubgraphsRL _ t = Object.insert id
    ( AE
        ( let
            { subgraphMaker } = unsafeUnSubgraph (get (Proxy :: _ id) t)
          in
            makeSubgraph
              { id
              , terminus: reflectSymbol (Proxy :: _ terminus)
              , scenes: unAsSubGraph subgraphMaker
              , envs: []
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
  , Row.Cons id (Tumultuous terminus) r' tumults
  , GetTumultsRL rest tumults
  ) =>
  GetTumultsRL (RL.Cons id (TTumult terminus /\ whatever) rest) tumults where
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

-- codegen 5
data MakeA_ (ptr :: Symbol) = MakeA_ (Proxy ptr)
instance doCreateMakeA_ :: DoCreate ptr CTOR.TA_ (MakeA_ ptr)
instance toGraphEffectsMakeA_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeA_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "a"
data MakeAbbr_ (ptr :: Symbol) = MakeAbbr_ (Proxy ptr)
instance doCreateMakeAbbr_ :: DoCreate ptr CTOR.TAbbr_ (MakeAbbr_ ptr)
instance toGraphEffectsMakeAbbr_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAbbr_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "abbr"
data MakeAcronym_ (ptr :: Symbol) = MakeAcronym_ (Proxy ptr)
instance doCreateMakeAcronym_ :: DoCreate ptr CTOR.TAcronym_ (MakeAcronym_ ptr)
instance toGraphEffectsMakeAcronym_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAcronym_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "acronym"
data MakeAddress_ (ptr :: Symbol) = MakeAddress_ (Proxy ptr)
instance doCreateMakeAddress_ :: DoCreate ptr CTOR.TAddress_ (MakeAddress_ ptr)
instance toGraphEffectsMakeAddress_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAddress_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "address"
data MakeApplet_ (ptr :: Symbol) = MakeApplet_ (Proxy ptr)
instance doCreateMakeApplet_ :: DoCreate ptr CTOR.TApplet_ (MakeApplet_ ptr)
instance toGraphEffectsMakeApplet_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeApplet_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "applet"
data MakeArea_ (ptr :: Symbol) = MakeArea_ (Proxy ptr)
instance doCreateMakeArea_ :: DoCreate ptr CTOR.TArea_ (MakeArea_ ptr)
instance toGraphEffectsMakeArea_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeArea_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "area"
data MakeArticle_ (ptr :: Symbol) = MakeArticle_ (Proxy ptr)
instance doCreateMakeArticle_ :: DoCreate ptr CTOR.TArticle_ (MakeArticle_ ptr)
instance toGraphEffectsMakeArticle_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeArticle_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "article"
data MakeAside_ (ptr :: Symbol) = MakeAside_ (Proxy ptr)
instance doCreateMakeAside_ :: DoCreate ptr CTOR.TAside_ (MakeAside_ ptr)
instance toGraphEffectsMakeAside_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAside_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "aside"
data MakeAudio_ (ptr :: Symbol) = MakeAudio_ (Proxy ptr)
instance doCreateMakeAudio_ :: DoCreate ptr CTOR.TAudio_ (MakeAudio_ ptr)
instance toGraphEffectsMakeAudio_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeAudio_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "audio"
data MakeB_ (ptr :: Symbol) = MakeB_ (Proxy ptr)
instance doCreateMakeB_ :: DoCreate ptr CTOR.TB_ (MakeB_ ptr)
instance toGraphEffectsMakeB_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeB_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "b"
data MakeBase_ (ptr :: Symbol) = MakeBase_ (Proxy ptr)
instance doCreateMakeBase_ :: DoCreate ptr CTOR.TBase_ (MakeBase_ ptr)
instance toGraphEffectsMakeBase_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBase_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "base"
data MakeBasefont_ (ptr :: Symbol) = MakeBasefont_ (Proxy ptr)
instance doCreateMakeBasefont_ :: DoCreate ptr CTOR.TBasefont_ (MakeBasefont_ ptr)
instance toGraphEffectsMakeBasefont_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBasefont_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "basefont"
data MakeBdi_ (ptr :: Symbol) = MakeBdi_ (Proxy ptr)
instance doCreateMakeBdi_ :: DoCreate ptr CTOR.TBdi_ (MakeBdi_ ptr)
instance toGraphEffectsMakeBdi_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBdi_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "bdi"
data MakeBdo_ (ptr :: Symbol) = MakeBdo_ (Proxy ptr)
instance doCreateMakeBdo_ :: DoCreate ptr CTOR.TBdo_ (MakeBdo_ ptr)
instance toGraphEffectsMakeBdo_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBdo_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "bdo"
data MakeBig_ (ptr :: Symbol) = MakeBig_ (Proxy ptr)
instance doCreateMakeBig_ :: DoCreate ptr CTOR.TBig_ (MakeBig_ ptr)
instance toGraphEffectsMakeBig_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBig_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "big"
data MakeBlockquote_ (ptr :: Symbol) = MakeBlockquote_ (Proxy ptr)
instance doCreateMakeBlockquote_ :: DoCreate ptr CTOR.TBlockquote_ (MakeBlockquote_ ptr)
instance toGraphEffectsMakeBlockquote_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBlockquote_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "blockquote"
data MakeBody_ (ptr :: Symbol) = MakeBody_ (Proxy ptr)
instance doCreateMakeBody_ :: DoCreate ptr CTOR.TBody_ (MakeBody_ ptr)
instance toGraphEffectsMakeBody_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBody_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "body"
data MakeBr_ (ptr :: Symbol) = MakeBr_ (Proxy ptr)
instance doCreateMakeBr_ :: DoCreate ptr CTOR.TBr_ (MakeBr_ ptr)
instance toGraphEffectsMakeBr_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeBr_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "br"
data MakeButton_ (ptr :: Symbol) = MakeButton_ (Proxy ptr)
instance doCreateMakeButton_ :: DoCreate ptr CTOR.TButton_ (MakeButton_ ptr)
instance toGraphEffectsMakeButton_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeButton_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "button"
data MakeCanvas_ (ptr :: Symbol) = MakeCanvas_ (Proxy ptr)
instance doCreateMakeCanvas_ :: DoCreate ptr CTOR.TCanvas_ (MakeCanvas_ ptr)
instance toGraphEffectsMakeCanvas_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCanvas_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "canvas"
data MakeCaption_ (ptr :: Symbol) = MakeCaption_ (Proxy ptr)
instance doCreateMakeCaption_ :: DoCreate ptr CTOR.TCaption_ (MakeCaption_ ptr)
instance toGraphEffectsMakeCaption_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCaption_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "caption"
data MakeCenter_ (ptr :: Symbol) = MakeCenter_ (Proxy ptr)
instance doCreateMakeCenter_ :: DoCreate ptr CTOR.TCenter_ (MakeCenter_ ptr)
instance toGraphEffectsMakeCenter_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCenter_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "center"
data MakeCite_ (ptr :: Symbol) = MakeCite_ (Proxy ptr)
instance doCreateMakeCite_ :: DoCreate ptr CTOR.TCite_ (MakeCite_ ptr)
instance toGraphEffectsMakeCite_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCite_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "cite"
data MakeCode_ (ptr :: Symbol) = MakeCode_ (Proxy ptr)
instance doCreateMakeCode_ :: DoCreate ptr CTOR.TCode_ (MakeCode_ ptr)
instance toGraphEffectsMakeCode_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCode_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "code"
data MakeCol_ (ptr :: Symbol) = MakeCol_ (Proxy ptr)
instance doCreateMakeCol_ :: DoCreate ptr CTOR.TCol_ (MakeCol_ ptr)
instance toGraphEffectsMakeCol_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeCol_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "col"
data MakeColgroup_ (ptr :: Symbol) = MakeColgroup_ (Proxy ptr)
instance doCreateMakeColgroup_ :: DoCreate ptr CTOR.TColgroup_ (MakeColgroup_ ptr)
instance toGraphEffectsMakeColgroup_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeColgroup_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "colgroup"
data MakeXdata_ (ptr :: Symbol) = MakeXdata_ (Proxy ptr)
instance doCreateMakeXdata_ :: DoCreate ptr CTOR.TXdata_ (MakeXdata_ ptr)
instance toGraphEffectsMakeXdata_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeXdata_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "data"
data MakeDatalist_ (ptr :: Symbol) = MakeDatalist_ (Proxy ptr)
instance doCreateMakeDatalist_ :: DoCreate ptr CTOR.TDatalist_ (MakeDatalist_ ptr)
instance toGraphEffectsMakeDatalist_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDatalist_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "datalist"
data MakeDd_ (ptr :: Symbol) = MakeDd_ (Proxy ptr)
instance doCreateMakeDd_ :: DoCreate ptr CTOR.TDd_ (MakeDd_ ptr)
instance toGraphEffectsMakeDd_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDd_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dd"
data MakeDel_ (ptr :: Symbol) = MakeDel_ (Proxy ptr)
instance doCreateMakeDel_ :: DoCreate ptr CTOR.TDel_ (MakeDel_ ptr)
instance toGraphEffectsMakeDel_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDel_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "del"
data MakeDetails_ (ptr :: Symbol) = MakeDetails_ (Proxy ptr)
instance doCreateMakeDetails_ :: DoCreate ptr CTOR.TDetails_ (MakeDetails_ ptr)
instance toGraphEffectsMakeDetails_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDetails_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "details"
data MakeDfn_ (ptr :: Symbol) = MakeDfn_ (Proxy ptr)
instance doCreateMakeDfn_ :: DoCreate ptr CTOR.TDfn_ (MakeDfn_ ptr)
instance toGraphEffectsMakeDfn_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDfn_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dfn"
data MakeDialog_ (ptr :: Symbol) = MakeDialog_ (Proxy ptr)
instance doCreateMakeDialog_ :: DoCreate ptr CTOR.TDialog_ (MakeDialog_ ptr)
instance toGraphEffectsMakeDialog_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDialog_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dialog"
data MakeDir_ (ptr :: Symbol) = MakeDir_ (Proxy ptr)
instance doCreateMakeDir_ :: DoCreate ptr CTOR.TDir_ (MakeDir_ ptr)
instance toGraphEffectsMakeDir_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDir_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dir"
data MakeDiv_ (ptr :: Symbol) = MakeDiv_ (Proxy ptr)
instance doCreateMakeDiv_ :: DoCreate ptr CTOR.TDiv_ (MakeDiv_ ptr)
instance toGraphEffectsMakeDiv_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDiv_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "div"
data MakeDl_ (ptr :: Symbol) = MakeDl_ (Proxy ptr)
instance doCreateMakeDl_ :: DoCreate ptr CTOR.TDl_ (MakeDl_ ptr)
instance toGraphEffectsMakeDl_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDl_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dl"
data MakeDt_ (ptr :: Symbol) = MakeDt_ (Proxy ptr)
instance doCreateMakeDt_ :: DoCreate ptr CTOR.TDt_ (MakeDt_ ptr)
instance toGraphEffectsMakeDt_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeDt_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "dt"
data MakeEm_ (ptr :: Symbol) = MakeEm_ (Proxy ptr)
instance doCreateMakeEm_ :: DoCreate ptr CTOR.TEm_ (MakeEm_ ptr)
instance toGraphEffectsMakeEm_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeEm_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "em"
data MakeEmbed_ (ptr :: Symbol) = MakeEmbed_ (Proxy ptr)
instance doCreateMakeEmbed_ :: DoCreate ptr CTOR.TEmbed_ (MakeEmbed_ ptr)
instance toGraphEffectsMakeEmbed_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeEmbed_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "embed"
data MakeFieldset_ (ptr :: Symbol) = MakeFieldset_ (Proxy ptr)
instance doCreateMakeFieldset_ :: DoCreate ptr CTOR.TFieldset_ (MakeFieldset_ ptr)
instance toGraphEffectsMakeFieldset_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFieldset_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "fieldset"
data MakeFigcaption_ (ptr :: Symbol) = MakeFigcaption_ (Proxy ptr)
instance doCreateMakeFigcaption_ :: DoCreate ptr CTOR.TFigcaption_ (MakeFigcaption_ ptr)
instance toGraphEffectsMakeFigcaption_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFigcaption_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "figcaption"
data MakeFigure_ (ptr :: Symbol) = MakeFigure_ (Proxy ptr)
instance doCreateMakeFigure_ :: DoCreate ptr CTOR.TFigure_ (MakeFigure_ ptr)
instance toGraphEffectsMakeFigure_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFigure_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "figure"
data MakeFont_ (ptr :: Symbol) = MakeFont_ (Proxy ptr)
instance doCreateMakeFont_ :: DoCreate ptr CTOR.TFont_ (MakeFont_ ptr)
instance toGraphEffectsMakeFont_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFont_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "font"
data MakeFooter_ (ptr :: Symbol) = MakeFooter_ (Proxy ptr)
instance doCreateMakeFooter_ :: DoCreate ptr CTOR.TFooter_ (MakeFooter_ ptr)
instance toGraphEffectsMakeFooter_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFooter_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "footer"
data MakeForm_ (ptr :: Symbol) = MakeForm_ (Proxy ptr)
instance doCreateMakeForm_ :: DoCreate ptr CTOR.TForm_ (MakeForm_ ptr)
instance toGraphEffectsMakeForm_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeForm_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "form"
data MakeFrame_ (ptr :: Symbol) = MakeFrame_ (Proxy ptr)
instance doCreateMakeFrame_ :: DoCreate ptr CTOR.TFrame_ (MakeFrame_ ptr)
instance toGraphEffectsMakeFrame_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFrame_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "frame"
data MakeFrameset_ (ptr :: Symbol) = MakeFrameset_ (Proxy ptr)
instance doCreateMakeFrameset_ :: DoCreate ptr CTOR.TFrameset_ (MakeFrameset_ ptr)
instance toGraphEffectsMakeFrameset_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeFrameset_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "frameset"
data MakeH1_ (ptr :: Symbol) = MakeH1_ (Proxy ptr)
instance doCreateMakeH1_ :: DoCreate ptr CTOR.TH1_ (MakeH1_ ptr)
instance toGraphEffectsMakeH1_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH1_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h1"
data MakeH2_ (ptr :: Symbol) = MakeH2_ (Proxy ptr)
instance doCreateMakeH2_ :: DoCreate ptr CTOR.TH2_ (MakeH2_ ptr)
instance toGraphEffectsMakeH2_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH2_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h2"
data MakeH3_ (ptr :: Symbol) = MakeH3_ (Proxy ptr)
instance doCreateMakeH3_ :: DoCreate ptr CTOR.TH3_ (MakeH3_ ptr)
instance toGraphEffectsMakeH3_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH3_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h3"
data MakeH4_ (ptr :: Symbol) = MakeH4_ (Proxy ptr)
instance doCreateMakeH4_ :: DoCreate ptr CTOR.TH4_ (MakeH4_ ptr)
instance toGraphEffectsMakeH4_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH4_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h4"
data MakeH5_ (ptr :: Symbol) = MakeH5_ (Proxy ptr)
instance doCreateMakeH5_ :: DoCreate ptr CTOR.TH5_ (MakeH5_ ptr)
instance toGraphEffectsMakeH5_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH5_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h5"
data MakeH6_ (ptr :: Symbol) = MakeH6_ (Proxy ptr)
instance doCreateMakeH6_ :: DoCreate ptr CTOR.TH6_ (MakeH6_ ptr)
instance toGraphEffectsMakeH6_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeH6_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "h6"
data MakeHead_ (ptr :: Symbol) = MakeHead_ (Proxy ptr)
instance doCreateMakeHead_ :: DoCreate ptr CTOR.THead_ (MakeHead_ ptr)
instance toGraphEffectsMakeHead_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHead_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "head"
data MakeHeader_ (ptr :: Symbol) = MakeHeader_ (Proxy ptr)
instance doCreateMakeHeader_ :: DoCreate ptr CTOR.THeader_ (MakeHeader_ ptr)
instance toGraphEffectsMakeHeader_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHeader_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "header"
data MakeHr_ (ptr :: Symbol) = MakeHr_ (Proxy ptr)
instance doCreateMakeHr_ :: DoCreate ptr CTOR.THr_ (MakeHr_ ptr)
instance toGraphEffectsMakeHr_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHr_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "hr"
data MakeHtml_ (ptr :: Symbol) = MakeHtml_ (Proxy ptr)
instance doCreateMakeHtml_ :: DoCreate ptr CTOR.THtml_ (MakeHtml_ ptr)
instance toGraphEffectsMakeHtml_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeHtml_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "html"
data MakeI_ (ptr :: Symbol) = MakeI_ (Proxy ptr)
instance doCreateMakeI_ :: DoCreate ptr CTOR.TI_ (MakeI_ ptr)
instance toGraphEffectsMakeI_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeI_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "i"
data MakeIframe_ (ptr :: Symbol) = MakeIframe_ (Proxy ptr)
instance doCreateMakeIframe_ :: DoCreate ptr CTOR.TIframe_ (MakeIframe_ ptr)
instance toGraphEffectsMakeIframe_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeIframe_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "iframe"
data MakeImg_ (ptr :: Symbol) = MakeImg_ (Proxy ptr)
instance doCreateMakeImg_ :: DoCreate ptr CTOR.TImg_ (MakeImg_ ptr)
instance toGraphEffectsMakeImg_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeImg_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "img"
data MakeInput_ (ptr :: Symbol) = MakeInput_ (Proxy ptr)
instance doCreateMakeInput_ :: DoCreate ptr CTOR.TInput_ (MakeInput_ ptr)
instance toGraphEffectsMakeInput_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeInput_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "input"
data MakeIns_ (ptr :: Symbol) = MakeIns_ (Proxy ptr)
instance doCreateMakeIns_ :: DoCreate ptr CTOR.TIns_ (MakeIns_ ptr)
instance toGraphEffectsMakeIns_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeIns_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ins"
data MakeKbd_ (ptr :: Symbol) = MakeKbd_ (Proxy ptr)
instance doCreateMakeKbd_ :: DoCreate ptr CTOR.TKbd_ (MakeKbd_ ptr)
instance toGraphEffectsMakeKbd_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeKbd_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "kbd"
data MakeLabel_ (ptr :: Symbol) = MakeLabel_ (Proxy ptr)
instance doCreateMakeLabel_ :: DoCreate ptr CTOR.TLabel_ (MakeLabel_ ptr)
instance toGraphEffectsMakeLabel_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLabel_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "label"
data MakeLegend_ (ptr :: Symbol) = MakeLegend_ (Proxy ptr)
instance doCreateMakeLegend_ :: DoCreate ptr CTOR.TLegend_ (MakeLegend_ ptr)
instance toGraphEffectsMakeLegend_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLegend_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "legend"
data MakeLi_ (ptr :: Symbol) = MakeLi_ (Proxy ptr)
instance doCreateMakeLi_ :: DoCreate ptr CTOR.TLi_ (MakeLi_ ptr)
instance toGraphEffectsMakeLi_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLi_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "li"
data MakeLink_ (ptr :: Symbol) = MakeLink_ (Proxy ptr)
instance doCreateMakeLink_ :: DoCreate ptr CTOR.TLink_ (MakeLink_ ptr)
instance toGraphEffectsMakeLink_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeLink_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "link"
data MakeMain_ (ptr :: Symbol) = MakeMain_ (Proxy ptr)
instance doCreateMakeMain_ :: DoCreate ptr CTOR.TMain_ (MakeMain_ ptr)
instance toGraphEffectsMakeMain_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMain_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "main"
data MakeMap_ (ptr :: Symbol) = MakeMap_ (Proxy ptr)
instance doCreateMakeMap_ :: DoCreate ptr CTOR.TMap_ (MakeMap_ ptr)
instance toGraphEffectsMakeMap_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMap_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "map"
data MakeMark_ (ptr :: Symbol) = MakeMark_ (Proxy ptr)
instance doCreateMakeMark_ :: DoCreate ptr CTOR.TMark_ (MakeMark_ ptr)
instance toGraphEffectsMakeMark_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMark_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "mark"
data MakeMeta_ (ptr :: Symbol) = MakeMeta_ (Proxy ptr)
instance doCreateMakeMeta_ :: DoCreate ptr CTOR.TMeta_ (MakeMeta_ ptr)
instance toGraphEffectsMakeMeta_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMeta_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "meta"
data MakeMeter_ (ptr :: Symbol) = MakeMeter_ (Proxy ptr)
instance doCreateMakeMeter_ :: DoCreate ptr CTOR.TMeter_ (MakeMeter_ ptr)
instance toGraphEffectsMakeMeter_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeMeter_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "meter"
data MakeNav_ (ptr :: Symbol) = MakeNav_ (Proxy ptr)
instance doCreateMakeNav_ :: DoCreate ptr CTOR.TNav_ (MakeNav_ ptr)
instance toGraphEffectsMakeNav_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNav_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "nav"
data MakeNoframes_ (ptr :: Symbol) = MakeNoframes_ (Proxy ptr)
instance doCreateMakeNoframes_ :: DoCreate ptr CTOR.TNoframes_ (MakeNoframes_ ptr)
instance toGraphEffectsMakeNoframes_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNoframes_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "noframes"
data MakeNoscript_ (ptr :: Symbol) = MakeNoscript_ (Proxy ptr)
instance doCreateMakeNoscript_ :: DoCreate ptr CTOR.TNoscript_ (MakeNoscript_ ptr)
instance toGraphEffectsMakeNoscript_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeNoscript_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "noscript"
data MakeObject_ (ptr :: Symbol) = MakeObject_ (Proxy ptr)
instance doCreateMakeObject_ :: DoCreate ptr CTOR.TObject_ (MakeObject_ ptr)
instance toGraphEffectsMakeObject_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeObject_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "object"
data MakeOl_ (ptr :: Symbol) = MakeOl_ (Proxy ptr)
instance doCreateMakeOl_ :: DoCreate ptr CTOR.TOl_ (MakeOl_ ptr)
instance toGraphEffectsMakeOl_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOl_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ol"
data MakeOptgroup_ (ptr :: Symbol) = MakeOptgroup_ (Proxy ptr)
instance doCreateMakeOptgroup_ :: DoCreate ptr CTOR.TOptgroup_ (MakeOptgroup_ ptr)
instance toGraphEffectsMakeOptgroup_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOptgroup_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "optgroup"
data MakeOption_ (ptr :: Symbol) = MakeOption_ (Proxy ptr)
instance doCreateMakeOption_ :: DoCreate ptr CTOR.TOption_ (MakeOption_ ptr)
instance toGraphEffectsMakeOption_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOption_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "option"
data MakeOutput_ (ptr :: Symbol) = MakeOutput_ (Proxy ptr)
instance doCreateMakeOutput_ :: DoCreate ptr CTOR.TOutput_ (MakeOutput_ ptr)
instance toGraphEffectsMakeOutput_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeOutput_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "output"
data MakeP_ (ptr :: Symbol) = MakeP_ (Proxy ptr)
instance doCreateMakeP_ :: DoCreate ptr CTOR.TP_ (MakeP_ ptr)
instance toGraphEffectsMakeP_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeP_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "p"
data MakeParam_ (ptr :: Symbol) = MakeParam_ (Proxy ptr)
instance doCreateMakeParam_ :: DoCreate ptr CTOR.TParam_ (MakeParam_ ptr)
instance toGraphEffectsMakeParam_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeParam_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "param"
data MakePicture_ (ptr :: Symbol) = MakePicture_ (Proxy ptr)
instance doCreateMakePicture_ :: DoCreate ptr CTOR.TPicture_ (MakePicture_ ptr)
instance toGraphEffectsMakePicture_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakePicture_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "picture"
data MakePre_ (ptr :: Symbol) = MakePre_ (Proxy ptr)
instance doCreateMakePre_ :: DoCreate ptr CTOR.TPre_ (MakePre_ ptr)
instance toGraphEffectsMakePre_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakePre_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "pre"
data MakeProgress_ (ptr :: Symbol) = MakeProgress_ (Proxy ptr)
instance doCreateMakeProgress_ :: DoCreate ptr CTOR.TProgress_ (MakeProgress_ ptr)
instance toGraphEffectsMakeProgress_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeProgress_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "progress"
data MakeQ_ (ptr :: Symbol) = MakeQ_ (Proxy ptr)
instance doCreateMakeQ_ :: DoCreate ptr CTOR.TQ_ (MakeQ_ ptr)
instance toGraphEffectsMakeQ_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeQ_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "q"
data MakeRp_ (ptr :: Symbol) = MakeRp_ (Proxy ptr)
instance doCreateMakeRp_ :: DoCreate ptr CTOR.TRp_ (MakeRp_ ptr)
instance toGraphEffectsMakeRp_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRp_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "rp"
data MakeRt_ (ptr :: Symbol) = MakeRt_ (Proxy ptr)
instance doCreateMakeRt_ :: DoCreate ptr CTOR.TRt_ (MakeRt_ ptr)
instance toGraphEffectsMakeRt_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRt_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "rt"
data MakeRuby_ (ptr :: Symbol) = MakeRuby_ (Proxy ptr)
instance doCreateMakeRuby_ :: DoCreate ptr CTOR.TRuby_ (MakeRuby_ ptr)
instance toGraphEffectsMakeRuby_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeRuby_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ruby"
data MakeS_ (ptr :: Symbol) = MakeS_ (Proxy ptr)
instance doCreateMakeS_ :: DoCreate ptr CTOR.TS_ (MakeS_ ptr)
instance toGraphEffectsMakeS_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeS_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "s"
data MakeSamp_ (ptr :: Symbol) = MakeSamp_ (Proxy ptr)
instance doCreateMakeSamp_ :: DoCreate ptr CTOR.TSamp_ (MakeSamp_ ptr)
instance toGraphEffectsMakeSamp_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSamp_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "samp"
data MakeScript_ (ptr :: Symbol) = MakeScript_ (Proxy ptr)
instance doCreateMakeScript_ :: DoCreate ptr CTOR.TScript_ (MakeScript_ ptr)
instance toGraphEffectsMakeScript_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeScript_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "script"
data MakeSection_ (ptr :: Symbol) = MakeSection_ (Proxy ptr)
instance doCreateMakeSection_ :: DoCreate ptr CTOR.TSection_ (MakeSection_ ptr)
instance toGraphEffectsMakeSection_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSection_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "section"
data MakeSelect_ (ptr :: Symbol) = MakeSelect_ (Proxy ptr)
instance doCreateMakeSelect_ :: DoCreate ptr CTOR.TSelect_ (MakeSelect_ ptr)
instance toGraphEffectsMakeSelect_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSelect_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "select"
data MakeSmall_ (ptr :: Symbol) = MakeSmall_ (Proxy ptr)
instance doCreateMakeSmall_ :: DoCreate ptr CTOR.TSmall_ (MakeSmall_ ptr)
instance toGraphEffectsMakeSmall_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSmall_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "small"
data MakeSource_ (ptr :: Symbol) = MakeSource_ (Proxy ptr)
instance doCreateMakeSource_ :: DoCreate ptr CTOR.TSource_ (MakeSource_ ptr)
instance toGraphEffectsMakeSource_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSource_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "source"
data MakeSpan_ (ptr :: Symbol) = MakeSpan_ (Proxy ptr)
instance doCreateMakeSpan_ :: DoCreate ptr CTOR.TSpan_ (MakeSpan_ ptr)
instance toGraphEffectsMakeSpan_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSpan_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "span"
data MakeStrike_ (ptr :: Symbol) = MakeStrike_ (Proxy ptr)
instance doCreateMakeStrike_ :: DoCreate ptr CTOR.TStrike_ (MakeStrike_ ptr)
instance toGraphEffectsMakeStrike_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStrike_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "strike"
data MakeStrong_ (ptr :: Symbol) = MakeStrong_ (Proxy ptr)
instance doCreateMakeStrong_ :: DoCreate ptr CTOR.TStrong_ (MakeStrong_ ptr)
instance toGraphEffectsMakeStrong_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStrong_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "strong"
data MakeStyle_ (ptr :: Symbol) = MakeStyle_ (Proxy ptr)
instance doCreateMakeStyle_ :: DoCreate ptr CTOR.TStyle_ (MakeStyle_ ptr)
instance toGraphEffectsMakeStyle_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeStyle_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "style"
data MakeSub_ (ptr :: Symbol) = MakeSub_ (Proxy ptr)
instance doCreateMakeSub_ :: DoCreate ptr CTOR.TSub_ (MakeSub_ ptr)
instance toGraphEffectsMakeSub_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSub_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "sub"
data MakeSummary_ (ptr :: Symbol) = MakeSummary_ (Proxy ptr)
instance doCreateMakeSummary_ :: DoCreate ptr CTOR.TSummary_ (MakeSummary_ ptr)
instance toGraphEffectsMakeSummary_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSummary_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "summary"
data MakeSup_ (ptr :: Symbol) = MakeSup_ (Proxy ptr)
instance doCreateMakeSup_ :: DoCreate ptr CTOR.TSup_ (MakeSup_ ptr)
instance toGraphEffectsMakeSup_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSup_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "sup"
data MakeSvg_ (ptr :: Symbol) = MakeSvg_ (Proxy ptr)
instance doCreateMakeSvg_ :: DoCreate ptr CTOR.TSvg_ (MakeSvg_ ptr)
instance toGraphEffectsMakeSvg_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeSvg_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "svg"
data MakeTable_ (ptr :: Symbol) = MakeTable_ (Proxy ptr)
instance doCreateMakeTable_ :: DoCreate ptr CTOR.TTable_ (MakeTable_ ptr)
instance toGraphEffectsMakeTable_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTable_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "table"
data MakeTbody_ (ptr :: Symbol) = MakeTbody_ (Proxy ptr)
instance doCreateMakeTbody_ :: DoCreate ptr CTOR.TTbody_ (MakeTbody_ ptr)
instance toGraphEffectsMakeTbody_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTbody_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tbody"
data MakeTd_ (ptr :: Symbol) = MakeTd_ (Proxy ptr)
instance doCreateMakeTd_ :: DoCreate ptr CTOR.TTd_ (MakeTd_ ptr)
instance toGraphEffectsMakeTd_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTd_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "td"
data MakeTemplate_ (ptr :: Symbol) = MakeTemplate_ (Proxy ptr)
instance doCreateMakeTemplate_ :: DoCreate ptr CTOR.TTemplate_ (MakeTemplate_ ptr)
instance toGraphEffectsMakeTemplate_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTemplate_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "template"
data MakeTextarea_ (ptr :: Symbol) = MakeTextarea_ (Proxy ptr)
instance doCreateMakeTextarea_ :: DoCreate ptr CTOR.TTextarea_ (MakeTextarea_ ptr)
instance toGraphEffectsMakeTextarea_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTextarea_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "textarea"
data MakeTfoot_ (ptr :: Symbol) = MakeTfoot_ (Proxy ptr)
instance doCreateMakeTfoot_ :: DoCreate ptr CTOR.TTfoot_ (MakeTfoot_ ptr)
instance toGraphEffectsMakeTfoot_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTfoot_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tfoot"
data MakeTh_ (ptr :: Symbol) = MakeTh_ (Proxy ptr)
instance doCreateMakeTh_ :: DoCreate ptr CTOR.TTh_ (MakeTh_ ptr)
instance toGraphEffectsMakeTh_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTh_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "th"
data MakeThead_ (ptr :: Symbol) = MakeThead_ (Proxy ptr)
instance doCreateMakeThead_ :: DoCreate ptr CTOR.TThead_ (MakeThead_ ptr)
instance toGraphEffectsMakeThead_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeThead_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "thead"
data MakeTime_ (ptr :: Symbol) = MakeTime_ (Proxy ptr)
instance doCreateMakeTime_ :: DoCreate ptr CTOR.TTime_ (MakeTime_ ptr)
instance toGraphEffectsMakeTime_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTime_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "time"
data MakeTitle_ (ptr :: Symbol) = MakeTitle_ (Proxy ptr)
instance doCreateMakeTitle_ :: DoCreate ptr CTOR.TTitle_ (MakeTitle_ ptr)
instance toGraphEffectsMakeTitle_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTitle_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "title"
data MakeTr_ (ptr :: Symbol) = MakeTr_ (Proxy ptr)
instance doCreateMakeTr_ :: DoCreate ptr CTOR.TTr_ (MakeTr_ ptr)
instance toGraphEffectsMakeTr_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTr_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tr"
data MakeTrack_ (ptr :: Symbol) = MakeTrack_ (Proxy ptr)
instance doCreateMakeTrack_ :: DoCreate ptr CTOR.TTrack_ (MakeTrack_ ptr)
instance toGraphEffectsMakeTrack_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTrack_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "track"
data MakeTt_ (ptr :: Symbol) = MakeTt_ (Proxy ptr)
instance doCreateMakeTt_ :: DoCreate ptr CTOR.TTt_ (MakeTt_ ptr)
instance toGraphEffectsMakeTt_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeTt_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "tt"
data MakeU_ (ptr :: Symbol) = MakeU_ (Proxy ptr)
instance doCreateMakeU_ :: DoCreate ptr CTOR.TU_ (MakeU_ ptr)
instance toGraphEffectsMakeU_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeU_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "u"
data MakeUl_ (ptr :: Symbol) = MakeUl_ (Proxy ptr)
instance doCreateMakeUl_ :: DoCreate ptr CTOR.TUl_ (MakeUl_ ptr)
instance toGraphEffectsMakeUl_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeUl_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "ul"
data MakeVar_ (ptr :: Symbol) = MakeVar_ (Proxy ptr)
instance doCreateMakeVar_ :: DoCreate ptr CTOR.TVar_ (MakeVar_ ptr)
instance toGraphEffectsMakeVar_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeVar_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "var"
data MakeVideo_ (ptr :: Symbol) = MakeVideo_ (Proxy ptr)
instance doCreateMakeVideo_ :: DoCreate ptr CTOR.TVideo_ (MakeVideo_ ptr)
instance toGraphEffectsMakeVideo_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeVideo_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "video"
data MakeWbr_ (ptr :: Symbol) = MakeWbr_ (Proxy ptr)
instance doCreateMakeWbr_ :: DoCreate ptr CTOR.TWbr_ (MakeWbr_ ptr)
instance toGraphEffectsMakeWbr_ ::
  ( IsSymbol ptr
  , ToGraphEffects rest
  ) =>
  ToGraphEffects (MakeWbr_ ptr /\ rest) where
  toGraphEffects _ cache i = unsafeToGraphEffects (Proxy :: _ ptr)
    (Proxy :: _ rest)
    cache
    i
    "wbr"
-- codegen 5