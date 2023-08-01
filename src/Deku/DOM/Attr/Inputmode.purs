module Deku.DOM.Attr.Inputmode where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Inputmode = Inputmode

instance Attr Textarea_ Inputmode String where
  attr Inputmode bothValues = unsafeAttribute $ Both
    { key: "inputmode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "inputmode", value: prop' value })
  pureAttr Inputmode value = unsafeAttribute $ This
    { key: "inputmode", value: prop' value }
  unpureAttr Inputmode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "inputmode", value: prop' value }

instance Attr everything Inputmode Unit where
  attr Inputmode bothValues = unsafeAttribute $ Both
    { key: "inputmode", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "inputmode", value: unset' })
  pureAttr Inputmode _ = unsafeAttribute $ This
    { key: "inputmode", value: unset' }
  unpureAttr Inputmode eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "inputmode", value: unset' }
