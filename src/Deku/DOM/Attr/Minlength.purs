module Deku.DOM.Attr.Minlength where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Minlength = Minlength

instance Attr Input_ Minlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Minlength bothValues = unsafeAttribute $ Both
    { key: "minlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Input_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ This $ pure $
    { key: "minlength", value: prop' value }
instance Attr Input_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength (NonEmpty.NonEmpty Event.Event  String ) where
  attr Minlength bothValues = unsafeAttribute $ Both
    { key: "minlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "minlength", value: prop' value })
instance Attr Textarea_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ This $ pure $
    { key: "minlength", value: prop' value }
instance Attr Textarea_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }

instance Attr everything Minlength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Minlength bothValues = unsafeAttribute $ Both
    { key: "minlength", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "minlength", value: unset' })
instance Attr everything Minlength  Unit  where
  attr Minlength _ = unsafeAttribute $ This $ pure $
    { key: "minlength", value: unset' }
instance Attr everything Minlength (Event.Event  Unit ) where
  attr Minlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "minlength", value: unset' }
