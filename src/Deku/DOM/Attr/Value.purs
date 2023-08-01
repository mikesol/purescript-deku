module Deku.DOM.Attr.Value where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Progress (Progress_)

data Value = Value

instance Attr Textarea_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Button_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Input_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Li_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Meter_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Option_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Progress_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr Param_ Value String where
  attr Value bothValues = unsafeAttribute $ Both
    { key: "value", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "value", value: prop' value })
  pureAttr Value value = unsafeAttribute $ This
    { key: "value", value: prop' value }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "value", value: prop' value }

instance Attr everything Value Unit where
  attr Value bothValues = unsafeAttribute $ Both { key: "value", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "value", value: unset' })
  pureAttr Value _ = unsafeAttribute $ This { key: "value", value: unset' }
  unpureAttr Value eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "value", value: unset' }
