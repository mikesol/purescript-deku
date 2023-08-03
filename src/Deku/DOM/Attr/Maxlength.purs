module Deku.DOM.Attr.Maxlength where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Maxlength = Maxlength

instance Attr Input_ Maxlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Input_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: prop' value }
instance Attr Input_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
instance Attr Textarea_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: prop' value }
instance Attr Textarea_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr everything Maxlength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "maxlength", value: unset' })
instance Attr everything Maxlength  Unit  where
  attr Maxlength _ = unsafeAttribute $ This $ pure $
    { key: "maxlength", value: unset' }
instance Attr everything Maxlength (Event.Event  Unit ) where
  attr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maxlength", value: unset' }
