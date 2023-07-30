module Deku.DOM.Attr.ViewTarget where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget String where
  attr ViewTarget bothValues = unsafeAttribute $ Both
    { key: "viewTarget", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "viewTarget", value: prop' value })
  pureAttr ViewTarget value = unsafeAttribute $ This
    { key: "viewTarget", value: prop' value }
  unpureAttr ViewTarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewTarget", value: prop' value }

instance Attr everything ViewTarget Unit where
  attr ViewTarget bothValues = unsafeAttribute $ Both
    { key: "viewTarget", value: unset' }
    (snd bothValues <#> \_ -> { key: "viewTarget", value: unset' })
  pureAttr ViewTarget _ = unsafeAttribute $ This
    { key: "viewTarget", value: unset' }
  unpureAttr ViewTarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "viewTarget", value: unset' }
