module Deku.DOM.Attr.Formmethod where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Formmethod = Formmethod
instance Attr Button_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute (  
    { key: "formmethod", value: prop' value  } <$ _)
instance Attr Button_ Formmethod (Event.Event Unit -> Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute (map (map (
    \value -> { key: "formmethod", value: prop' value })) eventValue)
instance Attr Button_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formmethod", value: prop' value }
instance Attr Input_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute (  
    { key: "formmethod", value: prop' value  } <$ _)
instance Attr Input_ Formmethod (Event.Event Unit -> Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute (map (map (
    \value -> { key: "formmethod", value: prop' value })) eventValue)
instance Attr Input_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formmethod", value: prop' value }
instance Attr everything Formmethod  Unit  where
  attr Formmethod _ = unsafeAttribute (  
    { key: "formmethod", value: unset'  } <$ _)
instance Attr everything Formmethod (Event.Event Unit -> Event.Event  Unit ) where
  attr Formmethod eventValue = unsafeAttribute (map (map (
    \_ -> { key: "formmethod", value: unset' })) eventValue)
instance Attr everything Formmethod (Event.Event  Unit ) where
  attr Formmethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formmethod", value: unset' }