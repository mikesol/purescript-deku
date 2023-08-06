module Deku.DOM.Attr.Fr where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr  String  where
  attr Fr value = unsafeAttribute $ Left $  { key: "fr", value: prop' value }
instance Attr RadialGradient_ Fr (Event.Event  String ) where
  attr Fr eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "fr", value: prop' value }


instance Attr everything Fr  Unit  where
  attr Fr _ = unsafeAttribute $ Left $  { key: "fr", value: unset' }
instance Attr everything Fr (Event.Event  Unit ) where
  attr Fr eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "fr", value: unset' }
