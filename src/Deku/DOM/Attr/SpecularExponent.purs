module Deku.DOM.Attr.SpecularExponent where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularExponent = SpecularExponent

instance Attr FeSpecularLighting_ SpecularExponent String where
  attr SpecularExponent bothValues = unsafeAttribute $ Both
    { key: "specularExponent", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
  pureAttr SpecularExponent value = unsafeAttribute $ This
    { key: "specularExponent", value: prop' value }
  unpureAttr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr FeSpotLight_ SpecularExponent String where
  attr SpecularExponent bothValues = unsafeAttribute $ Both
    { key: "specularExponent", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "specularExponent", value: prop' value }
    )
  pureAttr SpecularExponent value = unsafeAttribute $ This
    { key: "specularExponent", value: prop' value }
  unpureAttr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "specularExponent", value: prop' value }

instance Attr everything SpecularExponent Unit where
  attr SpecularExponent bothValues = unsafeAttribute $ Both
    { key: "specularExponent", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "specularExponent", value: unset' })
  pureAttr SpecularExponent _ = unsafeAttribute $ This
    { key: "specularExponent", value: unset' }
  unpureAttr SpecularExponent eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "specularExponent", value: unset' }
