module Deku.Core where

import Prelude

import Data.Either (Either)
import Data.Exists (Exists)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Tuple.Nested (type (/\))
import Deku.Attribute (Attribute)
import Deku.Rendered as R
import Effect (Effect)
import FRP.Behavior (Behavior)
import FRP.Event (Event)

newtype Atta'buteF element a = Atta'buteF
  (Event a /\ (a -> Array (Attribute element)))

type Atta'bute element = Exists (Atta'buteF element)

newtype Te'xtF a = Te'xtF (Event a /\ (a -> String))

type Te'xt = Exists Te'xtF

type Element' dom engine = Event (dom -> engine)
type Element dom engine = String -> DOMInterpret dom engine -> Event (dom -> engine)

type Subgraph index env push dom engine =
  -- the index we're creating at
  index
  -- the pusher for the subgraph
  -> (push -> Effect Unit)
  -- an event the subgraph can bind to
  -> Event (Either env push)
  -- the subgraph
  -> Element dom engine

type Ie index env =
  { pos :: Int
  , index :: index
  , env :: Maybe env
  }

type Pie push index env =
  { pos :: Int, index :: index, env :: Nullable (Either env push) }

type SubgraphInput index env push dom engine =
  { id :: String
  , parent :: String
  , scenes :: Subgraph index env push dom engine
  }

type SetSubgraphInput index env =
  { id :: String
  , envs :: Array (Ie index env)
  }

newtype DOMInterpret dom engine = DOMInterpret
  { ids :: Behavior String
  , makeRoot :: R.MakeRoot -> dom -> engine
  , makeElement :: R.MakeElement -> dom -> engine
  , makeText :: R.MakeText -> dom -> engine
  , makeSubgraph ::
      forall index env push
       . SubgraphInput index env push dom engine
      -> dom
      -> engine
  , setAttributes :: R.SetAttributes -> dom -> engine
  -- | Set subgraph.
  , setSubgraph ::
      forall index env
       . SetSubgraphInput index env
      -> dom
      -> engine
  , setText :: R.SetText -> dom -> engine
  , sendSubgraphToTop :: R.SendSubgraphToTop -> dom -> engine
  }