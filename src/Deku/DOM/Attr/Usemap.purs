module Deku.DOM.Attr.Usemap where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Usemap = Usemap

instance Attr Img_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ Left $  
    { key: "usemap", value: prop' value }
instance Attr Img_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }


instance Attr Input_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ Left $  
    { key: "usemap", value: prop' value }
instance Attr Input_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }


instance Attr Object_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ Left $  
    { key: "usemap", value: prop' value }
instance Attr Object_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }


instance Attr everything Usemap  Unit  where
  attr Usemap _ = unsafeAttribute $ Left $  { key: "usemap", value: unset' }
instance Attr everything Usemap (Event.Event  Unit ) where
  attr Usemap eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "usemap", value: unset' }
