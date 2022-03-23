module Deku.Create where

import Prelude

import Data.Hashable (class Hashable)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Control.Types (DOM, DOMState', unsafeDOM, unsafeUnDOM)
import Deku.CreateT (class CreateT)
import Deku.CreateSGT (class CreateSGT)
import Deku.Graph.Attribute (Attribute, unsafeUnAttribute)
import Deku.Graph.DOM (unAsSubGraph, unsafeUnRoot, unsafeUnSubgraph, unsafeUnText)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, makeElement, makeRoot, makeSubgraph, makeText, massiveCreate)
import Deku.Rendered (RootDOMElement(..), ToCreate(..))
import Prim.Row as R
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

class
  CreateSG (r :: Row Type) (inGraph :: Graph) (outGraph :: Graph)
  | r inGraph -> outGraph where
  createSG
    :: forall dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res inGraph { | r }
    -> DOM dom engine proof res outGraph Unit

instance createSGAll ::
  CreateSGT r inGraph outGraph =>
  CreateSG r inGraph outGraph where
  createSG w = o
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
  , R.Lacks ptr graphi
  , Hashable index
  , R.Cons ptr (NodeC (CTOR.TSubgraph env) {}) graphi grapho
  ) =>
  Create' ptr
    (CTOR.Subgraph index env push)
    graphi
    grapho where
  create' ptr w = o
    where
    { context: i, value } = unsafeUnDOM w
    { subgraphMaker, envs } = unsafeUnSubgraph value
    id = reflectSymbol ptr
    o =
      unsafeDOM
        { context:
            i
              { instructions = i.instructions <>
                  [ makeSubgraph
                      { id
                      , envs
                      , scenes: unAsSubGraph subgraphMaker
                      }
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
