module Deku.DOM.Attr.KernelUnitLength where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelUnitLength = KernelUnitLength

instance Attr FeConvolveMatrix_ KernelUnitLength String where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
  pureAttr KernelUnitLength value = unsafeAttribute $ This
    { key: "kernelUnitLength", value: prop' value }
  unpureAttr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeDiffuseLighting_ KernelUnitLength String where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
  pureAttr KernelUnitLength value = unsafeAttribute $ This
    { key: "kernelUnitLength", value: prop' value }
  unpureAttr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeSpecularLighting_ KernelUnitLength String where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
  pureAttr KernelUnitLength value = unsafeAttribute $ This
    { key: "kernelUnitLength", value: prop' value }
  unpureAttr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr everything KernelUnitLength Unit where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both
    { key: "kernelUnitLength", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "kernelUnitLength", value: unset' })
  pureAttr KernelUnitLength _ = unsafeAttribute $ This
    { key: "kernelUnitLength", value: unset' }
  unpureAttr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }
