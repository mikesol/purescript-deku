module Deku.DOM.Attr.TableValues where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TableValues = TableValues

instance Attr FeFuncA_ TableValues  String  where
  attr TableValues value = unsafeAttribute (  
    { key: "tableValues", value: prop' value  } <$ _)
instance Attr FeFuncA_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncB_ TableValues  String  where
  attr TableValues value = unsafeAttribute (  
    { key: "tableValues", value: prop' value  } <$ _)
instance Attr FeFuncB_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncG_ TableValues  String  where
  attr TableValues value = unsafeAttribute (  
    { key: "tableValues", value: prop' value  } <$ _)
instance Attr FeFuncG_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr FeFuncR_ TableValues  String  where
  attr TableValues value = unsafeAttribute (  
    { key: "tableValues", value: prop' value  } <$ _)
instance Attr FeFuncR_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "tableValues", value: prop' value }


instance Attr everything TableValues  Unit  where
  attr TableValues _ = unsafeAttribute (  
    { key: "tableValues", value: unset'  } <$ _)
instance Attr everything TableValues (Event.Event  Unit ) where
  attr TableValues eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "tableValues", value: unset' }
