module Deku.DOM.Attr.BaseFrequency where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency  String  where
  attr BaseFrequency value = unsafeAttribute $ Left $  
    { key: "baseFrequency", value: prop' value }
instance Attr FeTurbulence_ BaseFrequency (Event.Event  String ) where
  attr BaseFrequency eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "baseFrequency", value: prop' value }


instance Attr everything BaseFrequency  Unit  where
  attr BaseFrequency _ = unsafeAttribute $ Left $  
    { key: "baseFrequency", value: unset' }
instance Attr everything BaseFrequency (Event.Event  Unit ) where
  attr BaseFrequency eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "baseFrequency", value: unset' }
