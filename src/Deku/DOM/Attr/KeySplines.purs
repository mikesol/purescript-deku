module Deku.DOM.Attr.KeySplines where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeySplines = KeySplines

instance Attr Animate_ KeySplines String where
  attr KeySplines bothValues = unsafeAttribute $ Both
    { key: "keySplines", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
  pureAttr KeySplines value = unsafeAttribute $ This
    { key: "keySplines", value: prop' value }
  unpureAttr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateMotion_ KeySplines String where
  attr KeySplines bothValues = unsafeAttribute $ Both
    { key: "keySplines", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
  pureAttr KeySplines value = unsafeAttribute $ This
    { key: "keySplines", value: prop' value }
  unpureAttr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateTransform_ KeySplines String where
  attr KeySplines bothValues = unsafeAttribute $ Both
    { key: "keySplines", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
  pureAttr KeySplines value = unsafeAttribute $ This
    { key: "keySplines", value: prop' value }
  unpureAttr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr everything KeySplines Unit where
  attr KeySplines bothValues = unsafeAttribute $ Both
    { key: "keySplines", value: unset' }
    (snd bothValues <#> \_ -> { key: "keySplines", value: unset' })
  pureAttr KeySplines _ = unsafeAttribute $ This
    { key: "keySplines", value: unset' }
  unpureAttr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keySplines", value: unset' }
