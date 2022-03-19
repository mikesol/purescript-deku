module Deku.Tumult.Make where

import Prelude

import Control.Monad.State (State, evalState, get, put)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..), maybe)
import Data.Traversable (traverse)
import Data.Tuple.Nested ((/\), type (/\))
import Data.Typelevel.Num (class Pos)
import Data.Vec (Vec, toArray)
import Deku.Control.Functions (start)
import Deku.Control.Functions.Subgraph ((@||>), freeze)
import Deku.Control.Types (Frame0, SubScene, DOM, oneSubFrame)
import Deku.Create (class Create, create)
import Deku.Graph.Attribute (Attribute, unsafeUnAttribute)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Deku.Tumult (Tumultuous, unsafeTumult)
import Deku.Validation (class NodesCanBeTumultuous, class SubgraphIsRenderable)
import Prim.RowList (class RowToList)

data Indecent
  = E String (Array (Attribute Indecent)) (Array Indecent)
  | T String

indecently
  :: forall n
   . Pos n
  => Vec n Indecent
  -> Tumultuous n "0"
indecently v = unsafeTumult (map mk (toArray v))
  where
  tv :: Maybe (Int /\ String) -> Indecent -> State Int (Array Instruction)
  tv parent (E tag attributes rest) = do
    i <- get
    put (i + 1)
    instrs <- traverse (tv (Just (i /\ tag))) rest
    pure
      ( [ R.iMakeElement
            { tag, attributes: map unsafeUnAttribute attributes, id: show i }
        ] <> join instrs <> maybe []
          ( \(p /\ u) ->
              [ R.iConnectXToY
                  { fromId: show i
                  , fromUnit: tag
                  , toId: show p
                  , toUnit: u
                  }
              ]
          )
          parent
      )
  tv parent (T text) = do
    i <- get
    put (i + 1)
    pure
      ( [ R.iMakeText { id: show i, text } ] <> maybe []
          ( \(p /\ u) ->
              [ R.iConnectXToY
                  { fromId: show i
                  , fromUnit: "text"
                  , toId: show p
                  , toUnit: u
                  }
              ]
          )
          parent
      )
  mk :: Indecent -> Array Instruction
  mk i = evalState (tv Nothing i) 0

tumultuously
  :: forall n terminus scene graph graphRL
   . Pos n
  => RowToList graph graphRL
  => Create scene () graph
  => SubgraphIsRenderable graph terminus
  => NodesCanBeTumultuous graphRL
  => Vec n { | scene }
  -> Tumultuous n terminus
tumultuously scenes = unsafeTumult (map go (toArray scenes))
  where
  go :: { | scene } -> Array Instruction
  go scene = map ((#) unit) tmt
    where
    init :: DOM Unit Instruction Frame0 Unit graph Unit
    init = create (start $> scene)

    subscene :: SubScene terminus Unit Unit Instruction Frame0 Unit Unit
    subscene = init @||> freeze
    frame = oneSubFrame subscene (Left unit) (const $ pure unit)
    tmt = frame.instructions
