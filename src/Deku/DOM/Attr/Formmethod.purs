module Deku.DOM.Attr.Formmethod where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formmethod = Formmethod

instance Attr Button_ Formmethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formmethod bothValues = unsafeAttribute $ Both
    { key: "formmethod", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Button_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: prop' value }
instance Attr Button_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }

instance Attr Input_ Formmethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr Formmethod bothValues = unsafeAttribute $ Both
    { key: "formmethod", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formmethod", value: prop' value })
instance Attr Input_ Formmethod  String  where
  attr Formmethod value = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: prop' value }
instance Attr Input_ Formmethod (Event.Event  String ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formmethod", value: prop' value }

instance Attr everything Formmethod (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Formmethod bothValues = unsafeAttribute $ Both
    { key: "formmethod", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formmethod", value: unset' })
instance Attr everything Formmethod  Unit  where
  attr Formmethod _ = unsafeAttribute $ This $ pure $
    { key: "formmethod", value: unset' }
instance Attr everything Formmethod (Event.Event  Unit ) where
  attr Formmethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formmethod", value: unset' }
