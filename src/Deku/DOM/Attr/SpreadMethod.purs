module Deku.DOM.Attr.SpreadMethod where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod String where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
  pureAttr SpreadMethod value = unsafeAttribute $ This
    { key: "spreadMethod", value: prop' value }
  unpureAttr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod String where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
  pureAttr SpreadMethod value = unsafeAttribute $ This
    { key: "spreadMethod", value: prop' value }
  unpureAttr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr everything SpreadMethod Unit where
  attr SpreadMethod bothValues = unsafeAttribute $ Both
    { key: "spreadMethod", value: unset' }
    (snd bothValues <#> \_ -> { key: "spreadMethod", value: unset' })
  pureAttr SpreadMethod _ = unsafeAttribute $ This
    { key: "spreadMethod", value: unset' }
  unpureAttr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "spreadMethod", value: unset' }
