module Deku.DOM.Attr.SpecularConstant where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularConstant = SpecularConstant

instance Attr FeSpecularLighting_ SpecularConstant String where
  attr SpecularConstant bothValues = unsafeAttribute $ Both
    { key: "specularConstant", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularConstant", value: prop' value }
    )
  pureAttr SpecularConstant value = unsafeAttribute $ This
    { key: "specularConstant", value: prop' value }
  unpureAttr SpecularConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularConstant", value: prop' value }

instance Attr everything SpecularConstant Unit where
  attr SpecularConstant bothValues = unsafeAttribute $ Both
    { key: "specularConstant", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "specularConstant", value: unset' })
  pureAttr SpecularConstant _ = unsafeAttribute $ This
    { key: "specularConstant", value: unset' }
  unpureAttr SpecularConstant eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "specularConstant", value: unset' }
