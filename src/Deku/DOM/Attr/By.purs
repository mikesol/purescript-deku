module Deku.DOM.Attr.By where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data By = By

instance Attr Animate_ By String where
  attr By bothValues = unsafeAttribute $ Both
    { key: "by", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
  pureAttr By value = unsafeAttribute $ This { key: "by", value: prop' value }
  unpureAttr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateMotion_ By String where
  attr By bothValues = unsafeAttribute $ Both
    { key: "by", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
  pureAttr By value = unsafeAttribute $ This { key: "by", value: prop' value }
  unpureAttr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateTransform_ By String where
  attr By bothValues = unsafeAttribute $ Both
    { key: "by", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
  pureAttr By value = unsafeAttribute $ This { key: "by", value: prop' value }
  unpureAttr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr everything By Unit where
  attr By bothValues = unsafeAttribute $ Both { key: "by", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "by", value: unset' })
  pureAttr By _ = unsafeAttribute $ This { key: "by", value: unset' }
  unpureAttr By eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "by", value: unset' }
