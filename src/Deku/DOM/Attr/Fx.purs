module Deku.DOM.Attr.Fx where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fx = Fx

instance Attr RadialGradient_ Fx  String  where
  attr Fx value = unsafeAttribute $ Left $  { key: "fx", value: prop' value }
instance Attr RadialGradient_ Fx (Event.Event  String ) where
  attr Fx eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "fx", value: prop' value }


instance Attr everything Fx  Unit  where
  attr Fx _ = unsafeAttribute $ Left $  { key: "fx", value: unset' }
instance Attr everything Fx (Event.Event  Unit ) where
  attr Fx eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "fx", value: unset' }
