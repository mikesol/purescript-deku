module Deku.DOM.Attr.Selected where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Selected = Selected

instance Attr Option_ Selected  String  where
  attr Selected value = unsafeAttribute $ Left $  
    { key: "selected", value: prop' value }
instance Attr Option_ Selected (Event.Event  String ) where
  attr Selected eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "selected", value: prop' value }


instance Attr everything Selected  Unit  where
  attr Selected _ = unsafeAttribute $ Left $  
    { key: "selected", value: unset' }
instance Attr everything Selected (Event.Event  Unit ) where
  attr Selected eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "selected", value: unset' }
