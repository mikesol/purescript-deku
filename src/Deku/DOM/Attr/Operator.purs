module Deku.DOM.Attr.Operator where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Operator = Operator
instance Attr FeComposite_ Operator  String  where
  attr Operator value = unsafeAttribute (  
    { key: "operator", value: prop' value  } <$ _)
instance Attr FeComposite_ Operator (Event.Event Unit -> Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute (map (map (
    \value -> { key: "operator", value: prop' value })) eventValue)
instance Attr FeComposite_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "operator", value: prop' value }
instance Attr FeMorphology_ Operator  String  where
  attr Operator value = unsafeAttribute (  
    { key: "operator", value: prop' value  } <$ _)
instance Attr FeMorphology_ Operator (Event.Event Unit -> Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute (map (map (
    \value -> { key: "operator", value: prop' value })) eventValue)
instance Attr FeMorphology_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "operator", value: prop' value }
instance Attr everything Operator  Unit  where
  attr Operator _ = unsafeAttribute (  
    { key: "operator", value: unset'  } <$ _)
instance Attr everything Operator (Event.Event Unit -> Event.Event  Unit ) where
  attr Operator eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "operator", value: unset' })) eventValue)
instance Attr everything Operator (Event.Event  Unit ) where
  attr Operator eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "operator", value: unset' }