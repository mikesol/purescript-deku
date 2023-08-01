module Deku.DOM.Attr.Srcdoc where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc String where
  attr Srcdoc bothValues = unsafeAttribute $ Both
    { key: "srcdoc", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "srcdoc", value: prop' value })
  pureAttr Srcdoc value = unsafeAttribute $ This
    { key: "srcdoc", value: prop' value }
  unpureAttr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srcdoc", value: prop' value }

instance Attr everything Srcdoc Unit where
  attr Srcdoc bothValues = unsafeAttribute $ Both
    { key: "srcdoc", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "srcdoc", value: unset' })
  pureAttr Srcdoc _ = unsafeAttribute $ This { key: "srcdoc", value: unset' }
  unpureAttr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srcdoc", value: unset' }
