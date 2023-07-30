module Deku.DOM.Attr.Rotate where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rotate = Rotate

instance Attr AnimateMotion_ Rotate String where
  attr Rotate bothValues = unsafeAttribute $ Both
    { key: "rotate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "rotate", value: prop' value })
  pureAttr Rotate value = unsafeAttribute $ This
    { key: "rotate", value: prop' value }
  unpureAttr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr Text_ Rotate String where
  attr Rotate bothValues = unsafeAttribute $ Both
    { key: "rotate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "rotate", value: prop' value })
  pureAttr Rotate value = unsafeAttribute $ This
    { key: "rotate", value: prop' value }
  unpureAttr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr Tspan_ Rotate String where
  attr Rotate bothValues = unsafeAttribute $ Both
    { key: "rotate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "rotate", value: prop' value })
  pureAttr Rotate value = unsafeAttribute $ This
    { key: "rotate", value: prop' value }
  unpureAttr Rotate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }

instance Attr everything Rotate Unit where
  attr Rotate bothValues = unsafeAttribute $ Both
    { key: "rotate", value: unset' }
    (snd bothValues <#> \_ -> { key: "rotate", value: unset' })
  pureAttr Rotate _ = unsafeAttribute $ This { key: "rotate", value: unset' }
  unpureAttr Rotate eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rotate", value: unset' }
