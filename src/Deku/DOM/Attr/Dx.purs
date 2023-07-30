module Deku.DOM.Attr.Dx where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dx = Dx

instance Attr FeDropShadow_ Dx String where
  attr Dx bothValues = unsafeAttribute $ Both
    { key: "dx", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dx", value: prop' value })
  pureAttr Dx value = unsafeAttribute $ This { key: "dx", value: prop' value }
  unpureAttr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr FeOffset_ Dx String where
  attr Dx bothValues = unsafeAttribute $ Both
    { key: "dx", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dx", value: prop' value })
  pureAttr Dx value = unsafeAttribute $ This { key: "dx", value: prop' value }
  unpureAttr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Text_ Dx String where
  attr Dx bothValues = unsafeAttribute $ Both
    { key: "dx", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dx", value: prop' value })
  pureAttr Dx value = unsafeAttribute $ This { key: "dx", value: prop' value }
  unpureAttr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr Tspan_ Dx String where
  attr Dx bothValues = unsafeAttribute $ Both
    { key: "dx", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dx", value: prop' value })
  pureAttr Dx value = unsafeAttribute $ This { key: "dx", value: prop' value }
  unpureAttr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dx", value: prop' value }

instance Attr everything Dx Unit where
  attr Dx bothValues = unsafeAttribute $ Both { key: "dx", value: unset' }
    (snd bothValues <#> \_ -> { key: "dx", value: unset' })
  pureAttr Dx _ = unsafeAttribute $ This { key: "dx", value: unset' }
  unpureAttr Dx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dx", value: unset' }
