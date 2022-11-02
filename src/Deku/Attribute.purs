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
  , xdata
  , pureAttr
  , (!:=)
  , maybeAttr
  , (?:=)
  , mapAttr
  , (<:=>)
  ) where

import Prelude

import Control.Plus (empty)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Effect (Effect)
import FRP.Event as FRP
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

xdata :: forall e. String -> String -> Attribute e
xdata k v = unsafeAttribute { key: "data-" <> k, value: Prop' v }

pureAttr
  :: forall m a b e
   . Applicative m
  => Attr e a b
  => a
  -> b
  -> FRP.Event (Attribute e)
pureAttr a b = pure (a := b)

infixr 5 pureAttr as !:=

maybeAttr
  :: forall m a b e
   . Applicative m
  => Attr e a b
  => a
  -> Maybe b
  -> FRP.Event (Attribute e)
maybeAttr a (Just b) = pure (a := b)
maybeAttr _ Nothing = empty

infix 5 maybeAttr as ?:=

mapAttr
  :: forall m a b e. Functor m => Attr e a b => a -> m b -> m (Attribute e)
mapAttr a b = (a := _) <$> b

infix 5 mapAttr as <:=>