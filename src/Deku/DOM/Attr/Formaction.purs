module Deku.DOM.Attr.Formaction where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Input_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ This
    { key: "formaction", value: prop' value }
instance Attr Input_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr Button_ Formaction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
instance Attr Button_ Formaction  String  where
  attr Formaction value = unsafeAttribute $ This
    { key: "formaction", value: prop' value }
instance Attr Button_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr everything Formaction (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formaction", value: unset' })
instance Attr everything Formaction  Unit  where
  attr Formaction _ = unsafeAttribute $ This
    { key: "formaction", value: unset' }
instance Attr everything Formaction (Event.Event  Unit ) where
  attr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formaction", value: unset' }
