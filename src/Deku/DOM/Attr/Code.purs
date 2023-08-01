module Deku.DOM.Attr.Code where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Code = Code

instance Attr Applet_ Code String where
  attr Code bothValues = unsafeAttribute $ Both
    { key: "code", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "code", value: prop' value })
  pureAttr Code value = unsafeAttribute $ This
    { key: "code", value: prop' value }
  unpureAttr Code eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "code", value: prop' value }

instance Attr everything Code Unit where
  attr Code bothValues = unsafeAttribute $ Both { key: "code", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "code", value: unset' })
  pureAttr Code _ = unsafeAttribute $ This { key: "code", value: unset' }
  unpureAttr Code eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "code", value: unset' }
