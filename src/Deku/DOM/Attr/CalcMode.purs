module Deku.DOM.Attr.CalcMode where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data CalcMode = CalcMode

instance Attr Animate_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute (  
    { key: "calcMode", value: prop' value  } <$ _)
instance Attr Animate_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr AnimateMotion_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute (  
    { key: "calcMode", value: prop' value  } <$ _)
instance Attr AnimateMotion_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr AnimateTransform_ CalcMode  String  where
  attr CalcMode value = unsafeAttribute (  
    { key: "calcMode", value: prop' value  } <$ _)
instance Attr AnimateTransform_ CalcMode (Event.Event  String ) where
  attr CalcMode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "calcMode", value: prop' value }


instance Attr everything CalcMode  Unit  where
  attr CalcMode _ = unsafeAttribute (  
    { key: "calcMode", value: unset'  } <$ _)
instance Attr everything CalcMode (Event.Event  Unit ) where
  attr CalcMode eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "calcMode", value: unset' }
