module Deku.DOM.Attr.LengthAdjust where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LengthAdjust = LengthAdjust

instance Attr Text_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ Left $  
    { key: "lengthAdjust", value: prop' value }
instance Attr Text_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }


instance Attr TextPath_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ Left $  
    { key: "lengthAdjust", value: prop' value }
instance Attr TextPath_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }


instance Attr Tspan_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ Left $  
    { key: "lengthAdjust", value: prop' value }
instance Attr Tspan_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }


instance Attr everything LengthAdjust  Unit  where
  attr LengthAdjust _ = unsafeAttribute $ Left $  
    { key: "lengthAdjust", value: unset' }
instance Attr everything LengthAdjust (Event.Event  Unit ) where
  attr LengthAdjust eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "lengthAdjust", value: unset' }
