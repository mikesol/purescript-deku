module Deku.DOM.Attr.Manifest where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Manifest = Manifest

instance Attr Html_ Manifest String where
  attr Manifest bothValues = unsafeAttribute $ Both
    { key: "manifest", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "manifest", value: prop' value })
  pureAttr Manifest value = unsafeAttribute $ This
    { key: "manifest", value: prop' value }
  unpureAttr Manifest eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "manifest", value: prop' value }

instance Attr everything Manifest Unit where
  attr Manifest bothValues = unsafeAttribute $ Both
    { key: "manifest", value: unset' }
    (snd bothValues <#> \_ -> { key: "manifest", value: unset' })
  pureAttr Manifest _ = unsafeAttribute $ This
    { key: "manifest", value: unset' }
  unpureAttr Manifest eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "manifest", value: unset' }
