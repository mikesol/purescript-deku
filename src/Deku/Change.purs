module Deku.Change where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Typelevel.Num (class Lt, class Nat, class Pos, toInt)
import Data.Vec as V
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.CreateT (class CreateT)
import Deku.Graph.Attribute (Attribute, AttributeValue, unsafeUnAttribute)
import Deku.Graph.DOM (unsafeUnSubgraph, unsafeUnText)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, massiveChange, setAttribute, setSingleSubgraph, setSubgraph, setText, setTumult)
import Deku.Rendered (ToChange(..))
import Deku.Tumult (Tumultuous, safeUntumult)
import Prim.Row (class Cons, class Lacks)
import Prim.Row as R
import Prim.RowList as RL
import Record (get)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

type Change'Type (ptr :: Symbol) (a :: Type) (graph :: Graph) =
  forall proxy dom engine proof res
   . DOMInterpret dom engine
  => proxy ptr
  -> DOM dom engine proof res graph a
  -> DOM dom engine proof res graph Unit

-- | Change an dom unit `node` in `igraph` with index `ptr`, outputting the changed node.
class Change' (ptr :: Symbol) (a :: Type) (graph :: Graph) where
  change' :: Change'Type ptr a graph

ichange'
  :: forall proxy ptr a dom engine proof res i
   . DOMInterpret dom engine
  => Change' ptr a i
  => proxy ptr
  -> a
  -> IxDOM dom engine proof res i i Unit
ichange' ptr a = IxDOM (change' ptr <<< (<$) a)

class Change (r :: Row Type) (graph :: Graph) where
  change
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

instance changeAll :: CreateT r () graph => Change r graph where
  change w = o
    where
    { context: i, value } = unsafeUnDOM w
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ massiveChange { toChange: ToChange $ unsafeCoerce value }
                  ]
              }
        , value: unit
        }

ichange
  :: forall r dom engine proof res inGraph
   . DOMInterpret dom engine
  => Change r inGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph inGraph Unit
ichange r = IxDOM (change <<< (<$) r)

--
class Change_ (r :: Row Type) (graph :: Graph) where
  change_
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

class ChangeRL_ (rl :: RL.RowList Type) (r :: Row Type) (graph :: Graph) where
  changeRL_
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => proxy rl
    -> DOM dom engine proof res graph { | r }
    -> DOM dom engine proof res graph Unit

instance changeRL_Cons :: (IsSymbol key, Cons key val r' r, Lacks key r', Change' key val graph, ChangeRL_ rest r graph) => ChangeRL_ (RL.Cons key val rest) r graph where
  changeRL_ _ w = changeRL_ (Proxy :: _ rest) ((change' (Proxy :: _ key) (w $> (get (Proxy :: _ key) value))) $> value)
    where
    { value } = unsafeUnDOM w

instance changeRL_Nil :: ChangeRL_ RL.Nil r graph where
  changeRL_ _ w = w $> unit


instance change_All :: (RL.RowToList r rl, ChangeRL_ rl r graph) => Change_ r graph where
  change_ = changeRL_ (Proxy :: _ rl)

ichange_
  :: forall r dom engine proof res inGraph
   . DOMInterpret dom engine
  => Change_ r inGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph inGraph Unit
ichange_ r = IxDOM (change_ <<< (<$) r)

instance changeText ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TText edges) ignore graph
  ) =>
  Change' ptr (CTOR.Text) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setText { id, text: (unsafeUnText value).text } ]
              }
        , value: unit
        }

instance changeTextString ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TText edges) ignore graph
  ) =>
  Change' ptr String graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setText { id, text: value } ]
              }
        , value: unit
        }
instance changeRoot ::
  ( R.Cons "root" (NodeC (CTOR.TRoot) edges) ignore graph
  ) =>
  Change' "root" CTOR.Root graph where
  change' _ w = w $> unit

instance changeSubgraph0 ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) edges) ignore graph
  , Pos n
  ) =>
  Change' ptr (CTOR.Subgraph notImportant (V.Vec n env)) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSubgraph
                      { id
                      , envs: (unsafeUnSubgraph value).envs
                      }
                  ]
              }
        , value: unit
        }

instance changeSubgraph1 ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) edges) ignore graph
  , Pos n
  , Nat i
  , Lt i n
  ) =>
  Change' ptr (CTOR.XSubgraph i env) graph where
  change' ptr w = o
    where
    { context: i, value: (CTOR.XSubgraph { index, env }) } = unsafeUnDOM w

    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setSingleSubgraph
                      { id
                      , index: toInt index
                      , env
                      }
                  ]
              }
        , value: unit
        }

instance changeTumult ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , Pos n
  , R.Cons ptr (NodeC (CTOR.TTumult n terminus) edges) ignore graph
  ) =>
  Change' ptr (Tumultuous n terminus) graph where
  change' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    id = reflectSymbol ptr
    tms = reflectSymbol (Proxy :: _ terminus)
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ setTumult
                      { id
                      , terminus: tms
                      , instructions: safeUntumult value
                      }
                  ]
              }
        , value: unit
        }

unsafeChange'
  :: forall ptr elt outGraph proxy dom engine proof res
   . DOMInterpret dom engine
  => IsSymbol ptr
  => proxy ptr
  -> DOMState' dom engine res
  -> Array (Attribute elt)
  -> DOM dom engine proof res outGraph Unit
unsafeChange' ptr i attributes = o
  where
  id = reflectSymbol ptr
  o =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                ( map
                    ( \( { key, value }
                           :: { key :: String
                           , value :: AttributeValue
                           }
                       ) ->
                        setAttribute { id, key, value }
                    )
                    (map unsafeUnAttribute attributes)
                )
            }
      , value: unit
      }

----- codegen
instance changeA ::
  ( IsSymbol ptr
  , R.Cons ptr (NodeC CTOR.TA ignore0) ignore1 graph
  ) =>
  Change' ptr (Array (Attribute CTOR.A)) grapho where
  change' ptr w = unsafeChange' ptr i value
    where
    { context: i, value } = unsafeUnDOM w