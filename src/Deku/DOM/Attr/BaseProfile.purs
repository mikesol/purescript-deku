module Deku.DOM.Attr.BaseProfile where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile  String  where
  attr BaseProfile value = unsafeAttribute $ Left $  
    { key: "baseProfile", value: prop' value }
instance Attr Svg_ BaseProfile (Event.Event  String ) where
  attr BaseProfile eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "baseProfile", value: prop' value }


instance Attr everything BaseProfile  Unit  where
  attr BaseProfile _ = unsafeAttribute $ Left $  
    { key: "baseProfile", value: unset' }
instance Attr everything BaseProfile (Event.Event  Unit ) where
  attr BaseProfile eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "baseProfile", value: unset' }
