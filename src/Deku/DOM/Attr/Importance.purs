module Deku.DOM.Attr.Importance where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Importance = Importance

instance Attr Iframe_ Importance String where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "importance", value: prop' value })
  pureAttr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
  unpureAttr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Img_ Importance String where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "importance", value: prop' value })
  pureAttr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
  unpureAttr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Link_ Importance String where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "importance", value: prop' value })
  pureAttr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
  unpureAttr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Script_ Importance String where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "importance", value: prop' value })
  pureAttr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
  unpureAttr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr everything Importance Unit where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: unset' }
    (snd bothValues <#> \_ -> { key: "importance", value: unset' })
  pureAttr Importance _ = unsafeAttribute $ This
    { key: "importance", value: unset' }
  unpureAttr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "importance", value: unset' }
