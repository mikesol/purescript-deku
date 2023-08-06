module Deku.DOM.Attr.Colspan where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Colspan = Colspan

instance Attr Td_ Colspan  String  where
  attr Colspan value = unsafeAttribute $ Left $  
    { key: "colspan", value: prop' value }
instance Attr Td_ Colspan (Event.Event  String ) where
  attr Colspan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "colspan", value: prop' value }


instance Attr Th_ Colspan  String  where
  attr Colspan value = unsafeAttribute $ Left $  
    { key: "colspan", value: prop' value }
instance Attr Th_ Colspan (Event.Event  String ) where
  attr Colspan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "colspan", value: prop' value }


instance Attr everything Colspan  Unit  where
  attr Colspan _ = unsafeAttribute $ Left $  { key: "colspan", value: unset' }
instance Attr everything Colspan (Event.Event  Unit ) where
  attr Colspan eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "colspan", value: unset' }
