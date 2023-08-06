module Deku.DOM.Attr.Reversed where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Reversed = Reversed

instance Attr Ol_ Reversed  String  where
  attr Reversed value = unsafeAttribute $ Left $  
    { key: "reversed", value: prop' value }
instance Attr Ol_ Reversed (Event.Event  String ) where
  attr Reversed eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "reversed", value: prop' value }


instance Attr everything Reversed  Unit  where
  attr Reversed _ = unsafeAttribute $ Left $  
    { key: "reversed", value: unset' }
instance Attr everything Reversed (Event.Event  Unit ) where
  attr Reversed eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "reversed", value: unset' }
