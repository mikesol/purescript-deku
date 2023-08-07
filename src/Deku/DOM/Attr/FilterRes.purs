module Deku.DOM.Attr.FilterRes where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes  String  where
  attr FilterRes value = unsafeAttribute (  
    { key: "filterRes", value: prop' value  } <$ _)
instance Attr Filter_ FilterRes (Event.Event  String ) where
  attr FilterRes eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "filterRes", value: prop' value }


instance Attr everything FilterRes  Unit  where
  attr FilterRes _ = unsafeAttribute (  
    { key: "filterRes", value: unset'  } <$ _)
instance Attr everything FilterRes (Event.Event  Unit ) where
  attr FilterRes eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "filterRes", value: unset' }
