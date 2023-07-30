module Deku.DOM.Attr.Controls where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Controls = Controls

instance Attr Audio_ Controls String where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "controls", value: prop' value })
  pureAttr Controls value = unsafeAttribute $ This
    { key: "controls", value: prop' value }
  unpureAttr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr Video_ Controls String where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "controls", value: prop' value })
  pureAttr Controls value = unsafeAttribute $ This
    { key: "controls", value: prop' value }
  unpureAttr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr everything Controls Unit where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: unset' }
    (snd bothValues <#> \_ -> { key: "controls", value: unset' })
  pureAttr Controls _ = unsafeAttribute $ This
    { key: "controls", value: unset' }
  unpureAttr Controls eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "controls", value: unset' }
