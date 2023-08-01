module Deku.DOM.Attr.Name where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Param (Param_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Name = Name

instance Attr Button_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Form_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Fieldset_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Iframe_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Input_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Object_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Output_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Select_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Textarea_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Map_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Meta_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr Param_ Name String where
  attr Name bothValues = unsafeAttribute $ Both
    { key: "name", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "name", value: prop' value })
  pureAttr Name value = unsafeAttribute $ This
    { key: "name", value: prop' value }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "name", value: prop' value }

instance Attr everything Name Unit where
  attr Name bothValues = unsafeAttribute $ Both { key: "name", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "name", value: unset' })
  pureAttr Name _ = unsafeAttribute $ This { key: "name", value: unset' }
  unpureAttr Name eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "name", value: unset' }
