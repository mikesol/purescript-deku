module Deku.DOM.Attr.Intrinsicsize where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize  String  where
  attr Intrinsicsize value = unsafeAttribute $ Left $  
    { key: "intrinsicsize", value: prop' value }
instance Attr Img_ Intrinsicsize (Event.Event  String ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "intrinsicsize", value: prop' value }


instance Attr everything Intrinsicsize  Unit  where
  attr Intrinsicsize _ = unsafeAttribute $ Left $  
    { key: "intrinsicsize", value: unset' }
instance Attr everything Intrinsicsize (Event.Event  Unit ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "intrinsicsize", value: unset' }
