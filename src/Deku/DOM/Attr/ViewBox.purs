module Deku.DOM.Attr.ViewBox where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewBox = ViewBox

instance Attr Marker_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ Left $  
    { key: "viewBox", value: prop' value }
instance Attr Marker_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }


instance Attr Pattern_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ Left $  
    { key: "viewBox", value: prop' value }
instance Attr Pattern_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }


instance Attr Svg_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ Left $  
    { key: "viewBox", value: prop' value }
instance Attr Svg_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }


instance Attr Symbol_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ Left $  
    { key: "viewBox", value: prop' value }
instance Attr Symbol_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }


instance Attr View_ ViewBox  String  where
  attr ViewBox value = unsafeAttribute $ Left $  
    { key: "viewBox", value: prop' value }
instance Attr View_ ViewBox (Event.Event  String ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewBox", value: prop' value }


instance Attr everything ViewBox  Unit  where
  attr ViewBox _ = unsafeAttribute $ Left $  { key: "viewBox", value: unset' }
instance Attr everything ViewBox (Event.Event  Unit ) where
  attr ViewBox eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "viewBox", value: unset' }
