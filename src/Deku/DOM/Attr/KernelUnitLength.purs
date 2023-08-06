module Deku.DOM.Attr.KernelUnitLength where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelUnitLength = KernelUnitLength

instance Attr FeConvolveMatrix_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ Left $  
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeConvolveMatrix_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }


instance Attr FeDiffuseLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ Left $  
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeDiffuseLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }


instance Attr FeSpecularLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ Left $  
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeSpecularLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }


instance Attr everything KernelUnitLength  Unit  where
  attr KernelUnitLength _ = unsafeAttribute $ Left $  
    { key: "kernelUnitLength", value: unset' }
instance Attr everything KernelUnitLength (Event.Event  Unit ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }
