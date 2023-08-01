module Deku.DOM.Attr.Disabled where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Disabled = Disabled

instance Attr Button_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Fieldset_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Input_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Optgroup_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Option_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Select_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr Textarea_ Disabled String where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "disabled", value: prop' value })
  pureAttr Disabled value = unsafeAttribute $ This
    { key: "disabled", value: prop' value }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "disabled", value: prop' value }

instance Attr everything Disabled Unit where
  attr Disabled bothValues = unsafeAttribute $ Both
    { key: "disabled", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "disabled", value: unset' })
  pureAttr Disabled _ = unsafeAttribute $ This
    { key: "disabled", value: unset' }
  unpureAttr Disabled eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "disabled", value: unset' }
