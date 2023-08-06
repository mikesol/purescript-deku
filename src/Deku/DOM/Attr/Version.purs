module Deku.DOM.Attr.Version where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version  String  where
  attr Version value = unsafeAttribute $ Left $  
    { key: "version", value: prop' value }
instance Attr Svg_ Version (Event.Event  String ) where
  attr Version eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "version", value: prop' value }


instance Attr everything Version  Unit  where
  attr Version _ = unsafeAttribute $ Left $  { key: "version", value: unset' }
instance Attr everything Version (Event.Event  Unit ) where
  attr Version eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "version", value: unset' }
