module Deku.DOM.Attr.Muted where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Muted = Muted

instance Attr Audio_ Muted String where
  attr Muted bothValues = unsafeAttribute $ Both
    { key: "muted", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "muted", value: prop' value })
  pureAttr Muted value = unsafeAttribute $ This
    { key: "muted", value: prop' value }
  unpureAttr Muted eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr Video_ Muted String where
  attr Muted bothValues = unsafeAttribute $ Both
    { key: "muted", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "muted", value: prop' value })
  pureAttr Muted value = unsafeAttribute $ This
    { key: "muted", value: prop' value }
  unpureAttr Muted eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "muted", value: prop' value }

instance Attr everything Muted Unit where
  attr Muted bothValues = unsafeAttribute $ Both { key: "muted", value: unset' }
    (snd bothValues <#> \_ -> { key: "muted", value: unset' })
  pureAttr Muted _ = unsafeAttribute $ This { key: "muted", value: unset' }
  unpureAttr Muted eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "muted", value: unset' }
