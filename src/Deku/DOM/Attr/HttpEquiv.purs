module Deku.DOM.Attr.HttpEquiv where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data HttpEquiv = HttpEquiv
instance Attr Meta_ HttpEquiv  String  where
  attr HttpEquiv value = unsafeAttribute (  
    { key: "http-equiv", value: prop' value  } <$ _)
instance Attr Meta_ HttpEquiv (Event.Event Unit -> Event.Event  String ) where
  attr HttpEquiv eventValue = unsafeAttribute (map (map (
    \value -> { key: "http-equiv", value: prop' value })) eventValue)
instance Attr Meta_ HttpEquiv (Event.Event  String ) where
  attr HttpEquiv eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "http-equiv", value: prop' value }
instance Attr everything HttpEquiv  Unit  where
  attr HttpEquiv _ = unsafeAttribute (  
    { key: "http-equiv", value: unset'  } <$ _)
instance Attr everything HttpEquiv (Event.Event Unit -> Event.Event  Unit ) where
  attr HttpEquiv eventValue = unsafeAttribute (map (map (
    \_ -> { key: "http-equiv", value: unset' })) eventValue)
instance Attr everything HttpEquiv (Event.Event  Unit ) where
  attr HttpEquiv eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "http-equiv", value: unset' }