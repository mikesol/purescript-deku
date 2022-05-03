module Deku.Attribute
  ( AttributeValue(..)
  , Attribute
  , class Attr
  , attr
  , (:=)
  , unsafeUnAttribute
  , unsafeAttribute
  , prop'
  , cb'
  , cb
  , Cb(..)
  ) where

import Prelude

import Data.Newtype (class Newtype)
import Effect (Effect)
import Safe.Coerce (coerce)
import Web.Event.Internal.Types (Event)

newtype Cb = Cb (Event -> Effect Boolean)
derive instance newtypeCb :: Newtype Cb _
instance eqCb :: Eq Cb where
  eq _ _ = false
instance ordCb :: Ord Cb where
  compare _ _ = LT
instance showCb :: Show Cb where
  show _ = "{callback}"

cb :: (Event -> Effect Unit) -> Cb
cb = Cb <<< ((map <<< map) (const true))

prop' :: String -> AttributeValue
prop' = Prop'

cb' :: Cb -> AttributeValue
cb' = Cb'

data AttributeValue = Prop' String | Cb' Cb
newtype Attribute (e :: Type) = Attribute
  { key :: String
  , value :: AttributeValue
  }
unsafeUnAttribute
  :: forall e. Attribute e -> { key :: String, value :: AttributeValue }
unsafeUnAttribute = coerce

unsafeAttribute
  :: forall e. { key :: String, value :: AttributeValue } -> Attribute e
unsafeAttribute = Attribute

class Attr e a b where
  attr :: a -> b -> Attribute e

infixr 5 attr as :=