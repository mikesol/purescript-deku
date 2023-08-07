module Deku.DOM.Attr.Datetime where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime  String  where
  attr Datetime value = unsafeAttribute (  
    { key: "datetime", value: prop' value  } <$ _)
instance Attr Del_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr Ins_ Datetime  String  where
  attr Datetime value = unsafeAttribute (  
    { key: "datetime", value: prop' value  } <$ _)
instance Attr Ins_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr Time_ Datetime  String  where
  attr Datetime value = unsafeAttribute (  
    { key: "datetime", value: prop' value  } <$ _)
instance Attr Time_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr everything Datetime  Unit  where
  attr Datetime _ = unsafeAttribute (  
    { key: "datetime", value: unset'  } <$ _)
instance Attr everything Datetime (Event.Event  Unit ) where
  attr Datetime eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "datetime", value: unset' }
