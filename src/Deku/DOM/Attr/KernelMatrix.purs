module Deku.DOM.Attr.KernelMatrix where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data KernelMatrix = KernelMatrix
instance Attr FeConvolveMatrix_ KernelMatrix  String  where
  attr KernelMatrix value = unsafeAttribute (  
    { key: "kernelMatrix", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ KernelMatrix (Event.Event Unit -> Event.Event  String ) where
  attr KernelMatrix eventValue = unsafeAttribute (map (map (
    \value -> { key: "kernelMatrix", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ KernelMatrix (Event.Event  String ) where
  attr KernelMatrix eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "kernelMatrix", value: prop' value }
instance Attr everything KernelMatrix  Unit  where
  attr KernelMatrix _ = unsafeAttribute (  
    { key: "kernelMatrix", value: unset'  } <$ _)
instance Attr everything KernelMatrix (Event.Event Unit -> Event.Event  Unit ) where
  attr KernelMatrix eventValue = unsafeAttribute (map (map (
    \_ -> { key: "kernelMatrix", value: unset' })) eventValue)
instance Attr everything KernelMatrix (Event.Event  Unit ) where
  attr KernelMatrix eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "kernelMatrix", value: unset' }