module Deku.DOM.Attr.Fx where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fx = Fx

instance Attr RadialGradient_ Fx String where
  attr Fx bothValues = unsafeAttribute $ Both
    { key: "fx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "fx", value: prop' value })
  pureAttr Fx value = unsafeAttribute $ This { key: "fx", value: prop' value }
  unpureAttr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fx", value: prop' value }

instance Attr everything Fx Unit where
  attr Fx bothValues = unsafeAttribute $ Both { key: "fx", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "fx", value: unset' })
  pureAttr Fx _ = unsafeAttribute $ This { key: "fx", value: unset' }
  unpureAttr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fx", value: unset' }
