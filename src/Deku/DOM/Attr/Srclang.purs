module Deku.DOM.Attr.Srclang where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srclang = Srclang

instance Attr Track_ Srclang String where
  attr Srclang bothValues = unsafeAttribute $ Both
    { key: "srclang", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "srclang", value: prop' value })
  pureAttr Srclang value = unsafeAttribute $ This
    { key: "srclang", value: prop' value }
  unpureAttr Srclang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srclang", value: prop' value }

instance Attr everything Srclang Unit where
  attr Srclang bothValues = unsafeAttribute $ Both
    { key: "srclang", value: unset' }
    (snd bothValues <#> \_ -> { key: "srclang", value: unset' })
  pureAttr Srclang _ = unsafeAttribute $ This { key: "srclang", value: unset' }
  unpureAttr Srclang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srclang", value: unset' }
