module Deku.Tumult.Make where

import Prelude

import Control.Monad.State (State, evalState, get, put)
import Data.Either (Either(..))
import Data.Generic.Rep (class Generic)
import Data.Map (Map)
import Data.Maybe (Maybe(..), maybe)
import Data.Show.Generic (genericShow)
import Data.Traversable (traverse)
import Data.Tuple.Nested ((/\), type (/\))
import Deku.Control.Functions (start)
import Deku.Control.Functions.Subgraph ((@||>), freeze)
import Deku.Control.Types (Frame0, SubScene, DOM, oneSubFrame)
import Deku.Create (class Create, create)
import Deku.Graph.Attribute (AttributeValue)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Deku.Tumult (Tumultuous, unsafeTumult)
import Deku.Validation (class NodesCanBeTumultuous, class SubgraphIsRenderable)
import Prim.RowList (class RowToList)

data Indecent
  = E String (Array  {key::String, value::AttributeValue}) (Array Indecent)
  | T String

derive instance genericIndecent :: Generic Indecent _
derive instance eqIndecent :: Eq Indecent
derive instance ordIndecent :: Ord Indecent

instance showIndecent :: Show Indecent where
  show s = genericShow s

indecently
  :: Map Int (Maybe Indecent)
  -> Tumultuous "0"
indecently v = unsafeTumult ((map <<< map) mk v)
  where
  tv :: Maybe (Int /\ String) -> Indecent -> State Int (Array Instruction)
  tv parent (E tag attributes rest) = do
    i <- get
    put (i + 1)
    instrs <- traverse (tv (Just (i /\ tag))) rest
    pure
      ( [ R.iMakeElement
            { tag, attributes, id: show i }
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
  :: forall terminus scene graph graphRL
   . RowToList graph graphRL
  => Create scene () graph
  => SubgraphIsRenderable graph terminus
  => NodesCanBeTumultuous graphRL
  => Map Int (Maybe { | scene })
  -> Tumultuous terminus
tumultuously scenes = unsafeTumult ((map <<< map) go scenes)
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
