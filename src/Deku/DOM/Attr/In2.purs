module Deku.DOM.Attr.In2 where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In2 = In2

instance Attr FeBlend_ In2 String where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
  pureAttr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
  unpureAttr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr FeComposite_ In2 String where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
  pureAttr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
  unpureAttr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr FeDisplacementMap_ In2 String where
  attr In2 bothValues = unsafeAttribute $ Both
    { key: "in2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "in2", value: prop' value })
  pureAttr In2 value = unsafeAttribute $ This { key: "in2", value: prop' value }
  unpureAttr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "in2", value: prop' value }

instance Attr everything In2 Unit where
  attr In2 bothValues = unsafeAttribute $ Both { key: "in2", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "in2", value: unset' })
  pureAttr In2 _ = unsafeAttribute $ This { key: "in2", value: unset' }
  unpureAttr In2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "in2", value: unset' }
