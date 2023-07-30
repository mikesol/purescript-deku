module Deku.DOM.Attr.Action where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Action = Action

instance Attr Form_ Action String where
  attr Action bothValues = unsafeAttribute $ Both
    { key: "action", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "action", value: prop' value })
  pureAttr Action value = unsafeAttribute $ This
    { key: "action", value: prop' value }
  unpureAttr Action eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "action", value: prop' value }

instance Attr everything Action Unit where
  attr Action bothValues = unsafeAttribute $ Both
    { key: "action", value: unset' }
    (snd bothValues <#> \_ -> { key: "action", value: unset' })
  pureAttr Action _ = unsafeAttribute $ This { key: "action", value: unset' }
  unpureAttr Action eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "action", value: unset' }
