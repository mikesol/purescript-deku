module Deku.DOM.Attr.Label where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Label = Label

instance Attr Optgroup_ Label String where
  attr Label bothValues = unsafeAttribute $ Both
    { key: "label", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
  pureAttr Label value = unsafeAttribute $ This
    { key: "label", value: prop' value }
  unpureAttr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Option_ Label String where
  attr Label bothValues = unsafeAttribute $ Both
    { key: "label", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
  pureAttr Label value = unsafeAttribute $ This
    { key: "label", value: prop' value }
  unpureAttr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr Track_ Label String where
  attr Label bothValues = unsafeAttribute $ Both
    { key: "label", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "label", value: prop' value })
  pureAttr Label value = unsafeAttribute $ This
    { key: "label", value: prop' value }
  unpureAttr Label eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "label", value: prop' value }

instance Attr everything Label Unit where
  attr Label bothValues = unsafeAttribute $ Both { key: "label", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "label", value: unset' })
  pureAttr Label _ = unsafeAttribute $ This { key: "label", value: unset' }
  unpureAttr Label eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "label", value: unset' }
