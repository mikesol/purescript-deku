module Deku.DOM.Attr.R where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data R = R

instance Attr Circle_ R  String  where
  attr R value = unsafeAttribute $ Left $  { key: "r", value: prop' value }
instance Attr Circle_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "r", value: prop' value }


instance Attr RadialGradient_ R  String  where
  attr R value = unsafeAttribute $ Left $  { key: "r", value: prop' value }
instance Attr RadialGradient_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "r", value: prop' value }


instance Attr everything R  Unit  where
  attr R _ = unsafeAttribute $ Left $  { key: "r", value: unset' }
instance Attr everything R (Event.Event  Unit ) where
  attr R eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "r", value: unset' }
