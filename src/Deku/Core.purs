module Deku.Core
  ( DOMInterpret(..)
  , Seedling
  , MakeRoot
  , MakeElement
  , AttributeParent
  , MakeText
  , MakePursx
  , MakeDyn
  , AddChild
  , RemoveChild
  , GiveNewParent
  , DeleteFromCache
  , SendToPos
  , SetProp
  , SetCb
  , SetText
  , Nut
  , ANut(..)
  , remove
  , sendToTop
  , sendToPos
  , insert
  , class Korok
  , Domable
  , Node(..)
  ) where

import Prelude

import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST)
import Control.Monad.ST.Global (Global)
import Data.Maybe (Maybe)
import Data.Monoid.Endo (Endo)
import Data.Newtype (class Newtype)
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (AnEvent)
import FRP.Event.Class (bang)
import Foreign.Object (Object)
import Data.Monoid.Always (class Always)

class
  ( Always (m Unit) (Effect Unit)
  , Always (m (m Unit)) (Effect (Effect Unit))
  , Always (m Unit) (Effect Unit)
  , Always (Endo Function (Effect (Effect Unit))) (Endo Function (m (m Unit)))
  , Always (Endo Function (Effect Unit)) (Endo Function (m Unit))
  , MonadST s m
  ) <=
  Korok s m
  | m -> s

instance Korok s (ST s)
instance Korok Global Effect

type Nut =
  forall s m e lock payload
   . Korok s m
  => Domable e m lock payload

newtype ANut = ANut Nut

newtype Node e m (lock :: Type) payload = Node
  ( Bolson.PSR m
    -> DOMInterpret e m payload
    -> AnEvent m payload
  )

type Domable e m lock payload = Bolson.Entity Int (Node e m lock payload) m lock
type Seedling e m lock payload = Bolson.Child Int (Node e m lock payload) m lock

insert
  :: forall s e m lock payload
   . Korok s m
  => Domable e m lock payload
  -> AnEvent m (Seedling e m lock payload)
insert = bang <<< Bolson.Insert

remove :: forall e m lock payload. Seedling e m lock payload
remove = Bolson.Remove

sendToTop :: forall e m lock payload. Seedling e m lock payload
sendToTop = sendToPos 0

sendToPos :: forall e m lock payload. Int -> Seedling e m lock payload
sendToPos = Bolson.Logic

type MakeElement =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  , tag :: String
  }

type MakeDyn =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  }

type AddChild =
  { parent :: String
  , child :: String
  }

type RemoveChild = { id :: String }

type AttributeParent =
  { id :: String
  , parent :: String
  }

type GiveNewParent =
  { id :: String
  , parent :: String
  , scope :: Scope
  }

type MakeText =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  }

-- this is how we say "remove me completely"
-- that means call remove on _and_ delete the element from the cache to free up memory
type DeleteFromCache = { id :: String }
type MakeRoot e = { id :: String, root :: e }
type SetText = { id :: String, text :: String }
type SetProp =
  { id :: String
  , parent :: Maybe String
  , scope :: Scope
  , key :: String
  , value :: String
  }

type SetCb =
  { id :: String
  , parent :: Maybe String
  , scope :: Scope
  , key :: String
  , value :: Cb
  }

type MakePursx =
  { id :: String
  , parent :: Maybe String
  , html :: String
  , scope :: Scope
  , pxScope :: String
  , verb :: String
  , cache :: Object Boolean
  }

type SendToPos =
  { id :: String
  , pos :: Int
  }

derive instance Newtype (DOMInterpret e m payload) _

newtype DOMInterpret e m payload = DOMInterpret
  { ids :: m String
  , makeRoot :: MakeRoot e -> payload
  , makeElement :: MakeElement -> payload
  , attributeParent :: AttributeParent -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent -> payload
  , deleteFromCache :: DeleteFromCache -> payload
  , setProp :: SetProp -> payload
  , setCb :: SetCb -> payload
  , setText :: SetText -> payload
  , makeDyn :: MakeDyn -> payload
  , addChild :: AddChild -> payload
  , sendToPos :: SendToPos -> payload
  , removeChild :: RemoveChild -> payload
  }
