module Deku.Graph.Attribute
  ( AttributeValue
  , Attribute
  , unsafeUnAttribute
  , unsafeAttribute
  , prop
  , cb
  , Cb(..)
  ) where

import Prelude

import Data.Newtype (class Newtype)
import Data.Variant (Variant, inj, match)
import Effect (Effect)
import Type.Proxy (Proxy(..))
import Web.Event.Internal.Types (EventTarget)

newtype Cb = Cb (EventTarget -> Effect Unit)
derive instance newtypeCb :: Newtype Cb _
instance eqCb :: Eq Cb where
  eq _ _ = false
instance ordCb :: Ord Cb where
  compare _ _ = LT
instance showCb :: Show Cb where
  show _ = "{callback}"

prop :: String -> AttributeValue
prop = inj (Proxy :: _ "prop")

cb :: Cb -> AttributeValue
cb = inj (Proxy :: _ "cb")

type AttributeValue = Variant (prop :: String, cb :: Cb)
newtype Attribute (e :: Type) = Attribute
  { key :: String
  , value :: AttributeValue
  }

unsafeUnAttribute
  :: forall e. Attribute e -> { key :: String, value :: AttributeValue }
unsafeUnAttribute (Attribute unsafe) = unsafe

unsafeAttribute
  :: forall e. { key :: String, value :: AttributeValue } -> Attribute e
unsafeAttribute = Attribute

instance showAttribute :: Show (Attribute x) where
  show (Attribute { key, value }) =
    "(" <> key <> "," <> match { prop: \a -> a, cb: \_ -> "(callback)" } value
      <> ")"
derive instance eqAttribute :: Eq (Attribute x)
derive instance ordAttribute :: Ord (Attribute x)