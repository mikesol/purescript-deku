module Deku.DOM.Attr.Buffered where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Buffered = Buffered

instance Attr Audio_ Buffered String where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "buffered", value: prop' value })
  pureAttr Buffered value = unsafeAttribute $ This
    { key: "buffered", value: prop' value }
  unpureAttr Buffered eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }

instance Attr Video_ Buffered String where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "buffered", value: prop' value })
  pureAttr Buffered value = unsafeAttribute $ This
    { key: "buffered", value: prop' value }
  unpureAttr Buffered eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }

instance Attr everything Buffered Unit where
  attr Buffered bothValues = unsafeAttribute $ Both
    { key: "buffered", value: unset' }
    (snd bothValues <#> \_ -> { key: "buffered", value: unset' })
  pureAttr Buffered _ = unsafeAttribute $ This
    { key: "buffered", value: unset' }
  unpureAttr Buffered eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "buffered", value: unset' }
