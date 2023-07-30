module Deku.DOM.Attr.Step where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Step = Step

instance Attr Input_ Step String where
  attr Step bothValues = unsafeAttribute $ Both
    { key: "step", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "step", value: prop' value })
  pureAttr Step value = unsafeAttribute $ This
    { key: "step", value: prop' value }
  unpureAttr Step eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "step", value: prop' value }

instance Attr everything Step Unit where
  attr Step bothValues = unsafeAttribute $ Both { key: "step", value: unset' }
    (snd bothValues <#> \_ -> { key: "step", value: unset' })
  pureAttr Step _ = unsafeAttribute $ This { key: "step", value: unset' }
  unpureAttr Step eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "step", value: unset' }
