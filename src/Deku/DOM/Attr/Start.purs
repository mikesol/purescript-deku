module Deku.DOM.Attr.Start where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start  String  where
  attr Start value = unsafeAttribute $ Left $  
    { key: "start", value: prop' value }
instance Attr Ol_ Start (Event.Event  String ) where
  attr Start eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "start", value: prop' value }


instance Attr everything Start  Unit  where
  attr Start _ = unsafeAttribute $ Left $  { key: "start", value: unset' }
instance Attr everything Start (Event.Event  Unit ) where
  attr Start eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "start", value: unset' }
