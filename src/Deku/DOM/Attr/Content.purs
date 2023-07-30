module Deku.DOM.Attr.Content where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Content = Content

instance Attr Meta_ Content String where
  attr Content bothValues = unsafeAttribute $ Both
    { key: "content", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "content", value: prop' value })
  pureAttr Content value = unsafeAttribute $ This
    { key: "content", value: prop' value }
  unpureAttr Content eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "content", value: prop' value }

instance Attr everything Content Unit where
  attr Content bothValues = unsafeAttribute $ Both
    { key: "content", value: unset' }
    (snd bothValues <#> \_ -> { key: "content", value: unset' })
  pureAttr Content _ = unsafeAttribute $ This { key: "content", value: unset' }
  unpureAttr Content eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "content", value: unset' }
