module Deku.DOM.Attr.Scope where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope  String  where
  attr Scope value = unsafeAttribute (  
    { key: "scope", value: prop' value  } <$ _)
instance Attr Th_ Scope (Event.Event  String ) where
  attr Scope eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scope", value: prop' value }


instance Attr everything Scope  Unit  where
  attr Scope _ = unsafeAttribute (  { key: "scope", value: unset'  } <$ _)
instance Attr everything Scope (Event.Event  Unit ) where
  attr Scope eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "scope", value: unset' }
