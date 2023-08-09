module Deku.DOM.Attr.Intercept where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Intercept = Intercept
instance Attr FeFuncA_ Intercept  String  where
  attr Intercept value = unsafeAttribute (  
    { key: "intercept", value: prop' value  } <$ _)
instance Attr FeFuncA_ Intercept (Event.Event Unit -> Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute (map (map (
    \value -> { key: "intercept", value: prop' value })) eventValue)
instance Attr FeFuncA_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "intercept", value: prop' value }
instance Attr FeFuncB_ Intercept  String  where
  attr Intercept value = unsafeAttribute (  
    { key: "intercept", value: prop' value  } <$ _)
instance Attr FeFuncB_ Intercept (Event.Event Unit -> Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute (map (map (
    \value -> { key: "intercept", value: prop' value })) eventValue)
instance Attr FeFuncB_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "intercept", value: prop' value }
instance Attr FeFuncG_ Intercept  String  where
  attr Intercept value = unsafeAttribute (  
    { key: "intercept", value: prop' value  } <$ _)
instance Attr FeFuncG_ Intercept (Event.Event Unit -> Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute (map (map (
    \value -> { key: "intercept", value: prop' value })) eventValue)
instance Attr FeFuncG_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "intercept", value: prop' value }
instance Attr FeFuncR_ Intercept  String  where
  attr Intercept value = unsafeAttribute (  
    { key: "intercept", value: prop' value  } <$ _)
instance Attr FeFuncR_ Intercept (Event.Event Unit -> Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute (map (map (
    \value -> { key: "intercept", value: prop' value })) eventValue)
instance Attr FeFuncR_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "intercept", value: prop' value }
instance Attr everything Intercept  Unit  where
  attr Intercept _ = unsafeAttribute (  
    { key: "intercept", value: unset'  } <$ _)
instance Attr everything Intercept (Event.Event Unit -> Event.Event  Unit ) where
  attr Intercept eventValue = unsafeAttribute (map (map (
    \_ -> { key: "intercept", value: unset' })) eventValue)
instance Attr everything Intercept (Event.Event  Unit ) where
  attr Intercept eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "intercept", value: unset' }