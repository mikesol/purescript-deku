module Deku.DOM.Attr.Codebase where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Codebase = Codebase

instance Attr Applet_ Codebase String where
  attr Codebase bothValues = unsafeAttribute $ Both
    { key: "codebase", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "codebase", value: prop' value })
  pureAttr Codebase value = unsafeAttribute $ This
    { key: "codebase", value: prop' value }
  unpureAttr Codebase eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "codebase", value: prop' value }

instance Attr everything Codebase Unit where
  attr Codebase bothValues = unsafeAttribute $ Both
    { key: "codebase", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "codebase", value: unset' })
  pureAttr Codebase _ = unsafeAttribute $ This
    { key: "codebase", value: unset' }
  unpureAttr Codebase eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "codebase", value: unset' }
