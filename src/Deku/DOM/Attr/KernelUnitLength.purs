module Deku.DOM.Attr.KernelUnitLength where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data KernelUnitLength = KernelUnitLength
instance Attr FeConvolveMatrix_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute (  
    { key: "kernelUnitLength", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ KernelUnitLength (Event.Event Unit -> Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute (map (map ( \value -> { key: "kernelUnitLength", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }
instance Attr FeDiffuseLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute (  
    { key: "kernelUnitLength", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ KernelUnitLength (Event.Event Unit -> Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute (map (map ( \value -> { key: "kernelUnitLength", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }
instance Attr FeSpecularLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute (  
    { key: "kernelUnitLength", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ KernelUnitLength (Event.Event Unit -> Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute (map (map ( \value -> { key: "kernelUnitLength", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }
instance Attr everything KernelUnitLength  Unit  where
  attr KernelUnitLength _ = unsafeAttribute (  
    { key: "kernelUnitLength", value: unset'  } <$ _)
instance Attr everything KernelUnitLength (Event.Event Unit -> Event.Event  Unit ) where
  attr KernelUnitLength eventValue = unsafeAttribute (map (map ( \_ -> { key: "kernelUnitLength", value: unset' })) eventValue)
instance Attr everything KernelUnitLength (Event.Event  Unit ) where
  attr KernelUnitLength eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }