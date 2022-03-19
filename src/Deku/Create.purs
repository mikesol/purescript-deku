module Deku.Create where

import Prelude

import Data.Functor (voidRight)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Typelevel.Num (class Pos)
import Data.Vec as V
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.CreateT (class CreateT)
import Deku.Graph.Attribute (Attribute, unsafeUnAttribute)
import Deku.Graph.DOM (unAsSubGraph, unsafeUnA, unsafeUnRoot, unsafeUnSubgraph, unsafeUnText, unsafeUnTumult)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, makeElement, makeRoot, makeSubgraph, makeText, makeTumult, massiveCreate)
import Deku.Rendered (RootDOMElement(..), ToCreate(..))
import Deku.Tumult (safeUntumult)
import Prim.Row as R
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

class
  Create (r :: Row Type) (inGraph :: Graph) (outGraph :: Graph)
  | r inGraph -> outGraph where
  create
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res inGraph { | r }
    -> DOM dom engine proof res outGraph Unit

instance createAll ::
  CreateT r inGraph outGraph =>
  Create r inGraph outGraph where
  create w = o
    where
    { context: i, value } = unsafeUnDOM w
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ massiveCreate { toCreate: ToCreate $ unsafeCoerce value }
                  ]
              }
        , value: unit
        }
icreate
  :: forall r dom engine proof res inGraph outGraph
   . DOMInterpret dom engine
  => Create r inGraph outGraph
  => { | r }
  -> IxDOM dom engine proof res inGraph outGraph Unit
icreate r = IxDOM (create <<< voidRight r)

-- | Create an dom unit `node` in `igraph` with index `ptr`, resulting in `ograph`.
class
  Create' (ptr :: Symbol) (node :: Type) (inGraph :: Graph) (outGraph :: Graph)
  | ptr node inGraph -> outGraph where
  create'
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => proxy ptr
    -> DOM dom engine proof res inGraph node
    -> DOM dom engine proof res outGraph Unit

icreate'
  :: forall proxy ptr node dom engine proof res i o
   . DOMInterpret dom engine
  => Create' ptr node i o
  => proxy ptr
  -> node
  -> IxDOM dom engine proof res i o Unit
icreate' ptr node = IxDOM (create' ptr <<< voidRight node)

instance createUnit ::
  Create' ptr Unit graphi graphi where
  create' _ w = w

instance createText ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TText {}) graphi grapho
  ) =>
  Create' ptr (CTOR.Text) graphi grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { text } = unsafeUnText value
    id = reflectSymbol ptr

    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <> [ makeText { id, text } ]
              }
        , value: unit
        }

instance createRoot ::
  ( R.Lacks "root" graphi
  , R.Cons "root" (NodeC CTOR.TRoot {}) graphi grapho
  ) =>
  Create' "root" CTOR.Root graphi grapho where
  create' _ w = o
    where
    { context: i, value } = unsafeUnDOM w
    { element } = unsafeUnRoot value
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeRoot { id: "root", root: RootDOMElement element } ]
              }
        , value: unit
        }

instance createSubgraph ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , Pos n
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) {}) graphi grapho
  ) =>
  Create' ptr
    (CTOR.Subgraph (CTOR.AsSubgraph terminus env push) (V.Vec n env))
    graphi
    grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { subgraphMaker, envs, terminus } = unsafeUnSubgraph value
    id = reflectSymbol ptr
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeSubgraph
                      { id
                      , terminus
                      , envs
                      , scenes: unAsSubGraph subgraphMaker
                      }
                  ]
              }
        , value: unit
        }

instance createTumult ::
  ( IsSymbol ptr
  , IsSymbol terminus
  , Pos n
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TTumult n terminus) {}) graphi grapho
  ) =>
  Create' ptr (CTOR.Tumult n terminus) graphi grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { tumult } = unsafeUnTumult value
    id = reflectSymbol ptr
    pt = reflectSymbol (Proxy :: _ terminus)
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeTumult
                      { id, terminus: pt, instructions: safeUntumult tumult }
                  ]
              }
        , value: unit
        }

unsafeCreate'
  :: forall ptr elt outGraph proxy dom engine proof res
   . DOMInterpret dom engine
  => IsSymbol ptr
  => proxy ptr
  -> DOMState' dom engine res
  -> Array (Attribute elt)
  -> String
  -> DOM dom engine proof res outGraph Unit
unsafeCreate' ptr i attributes tag = o
  where
  id = reflectSymbol ptr
  o =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                [ makeElement
                    { id
                    , tag
                    , attributes: map unsafeUnAttribute attributes
                    }
                ]
            }
      , value: unit
      }

----- codegen
instance createA ::
  ( IsSymbol ptr
  , R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA {}) graphi grapho
  ) =>
  Create' ptr CTOR.A graphi grapho where
  create' ptr w = unsafeCreate' ptr i attributes "a"
    where
    { context: i, value } = unsafeUnDOM w
    { attributes } = unsafeUnA value