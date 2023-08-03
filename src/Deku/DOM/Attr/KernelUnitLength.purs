module Deku.DOM.Attr.KernelUnitLength where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelUnitLength = KernelUnitLength

instance Attr FeConvolveMatrix_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeConvolveMatrix_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeConvolveMatrix_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeDiffuseLighting_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeDiffuseLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeDiffuseLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeSpecularLighting_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeSpecularLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeSpecularLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr everything KernelUnitLength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kernelUnitLength", value: unset' })
instance Attr everything KernelUnitLength  Unit  where
  attr KernelUnitLength _ = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: unset' }
instance Attr everything KernelUnitLength (Event.Event  Unit ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }
