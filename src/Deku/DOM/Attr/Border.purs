module Deku.DOM.Attr.Border where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Border = Border

instance Attr Img_ Border  String  where
  attr Border value = unsafeAttribute $ Left $  
    { key: "border", value: prop' value }
instance Attr Img_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "border", value: prop' value }


instance Attr Object_ Border  String  where
  attr Border value = unsafeAttribute $ Left $  
    { key: "border", value: prop' value }
instance Attr Object_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "border", value: prop' value }


instance Attr Table_ Border  String  where
  attr Border value = unsafeAttribute $ Left $  
    { key: "border", value: prop' value }
instance Attr Table_ Border (Event.Event  String ) where
  attr Border eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "border", value: prop' value }


instance Attr everything Border  Unit  where
  attr Border _ = unsafeAttribute $ Left $  { key: "border", value: unset' }
instance Attr everything Border (Event.Event  Unit ) where
  attr Border eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "border", value: unset' }
