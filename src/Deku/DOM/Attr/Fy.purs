module Deku.DOM.Attr.Fy where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fy = Fy

instance Attr RadialGradient_ Fy  String  where
  attr Fy value = unsafeAttribute $ Left $  { key: "fy", value: prop' value }
instance Attr RadialGradient_ Fy (Event.Event  String ) where
  attr Fy eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "fy", value: prop' value }


instance Attr everything Fy  Unit  where
  attr Fy _ = unsafeAttribute $ Left $  { key: "fy", value: unset' }
instance Attr everything Fy (Event.Event  Unit ) where
  attr Fy eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "fy", value: unset' }
