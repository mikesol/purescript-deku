module Deku.DOM.Attr.Open where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Open = Open

instance Attr Details_ Open String where
  attr Open bothValues = unsafeAttribute $ Both
    { key: "open", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
  pureAttr Open value = unsafeAttribute $ This
    { key: "open", value: prop' value }
  unpureAttr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr Dialog_ Open String where
  attr Open bothValues = unsafeAttribute $ Both
    { key: "open", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
  pureAttr Open value = unsafeAttribute $ This
    { key: "open", value: prop' value }
  unpureAttr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr everything Open Unit where
  attr Open bothValues = unsafeAttribute $ Both { key: "open", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "open", value: unset' })
  pureAttr Open _ = unsafeAttribute $ This { key: "open", value: unset' }
  unpureAttr Open eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "open", value: unset' }
