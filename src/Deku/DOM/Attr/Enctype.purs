module Deku.DOM.Attr.Enctype where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enctype = Enctype

instance Attr Form_ Enctype String where
  attr Enctype bothValues = unsafeAttribute $ Both
    { key: "enctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "enctype", value: prop' value })
  pureAttr Enctype value = unsafeAttribute $ This
    { key: "enctype", value: prop' value }
  unpureAttr Enctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "enctype", value: prop' value }

instance Attr everything Enctype Unit where
  attr Enctype bothValues = unsafeAttribute $ Both
    { key: "enctype", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "enctype", value: unset' })
  pureAttr Enctype _ = unsafeAttribute $ This { key: "enctype", value: unset' }
  unpureAttr Enctype eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "enctype", value: unset' }
