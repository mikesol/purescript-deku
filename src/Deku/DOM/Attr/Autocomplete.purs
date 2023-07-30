module Deku.DOM.Attr.Autocomplete where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autocomplete = Autocomplete

instance Attr Form_ Autocomplete String where
  attr Autocomplete bothValues = unsafeAttribute $ Both
    { key: "autocomplete", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
  pureAttr Autocomplete value = unsafeAttribute $ This
    { key: "autocomplete", value: prop' value }
  unpureAttr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Input_ Autocomplete String where
  attr Autocomplete bothValues = unsafeAttribute $ Both
    { key: "autocomplete", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
  pureAttr Autocomplete value = unsafeAttribute $ This
    { key: "autocomplete", value: prop' value }
  unpureAttr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Select_ Autocomplete String where
  attr Autocomplete bothValues = unsafeAttribute $ Both
    { key: "autocomplete", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
  pureAttr Autocomplete value = unsafeAttribute $ This
    { key: "autocomplete", value: prop' value }
  unpureAttr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr Textarea_ Autocomplete String where
  attr Autocomplete bothValues = unsafeAttribute $ Both
    { key: "autocomplete", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "autocomplete", value: prop' value })
  pureAttr Autocomplete value = unsafeAttribute $ This
    { key: "autocomplete", value: prop' value }
  unpureAttr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }

instance Attr everything Autocomplete Unit where
  attr Autocomplete bothValues = unsafeAttribute $ Both
    { key: "autocomplete", value: unset' }
    (snd bothValues <#> \_ -> { key: "autocomplete", value: unset' })
  pureAttr Autocomplete _ = unsafeAttribute $ This
    { key: "autocomplete", value: unset' }
  unpureAttr Autocomplete eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autocomplete", value: unset' }
