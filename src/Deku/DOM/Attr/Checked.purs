module Deku.DOM.Attr.Checked where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Checked = Checked

instance Attr Input_ Checked (NonEmpty.NonEmpty Event.Event  String ) where
  attr Checked bothValues = unsafeAttribute $ Both (pure 
    { key: "checked", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "checked", value: prop' value })
instance Attr Input_ Checked  String  where
  attr Checked value = unsafeAttribute $ This $ pure $
    { key: "checked", value: prop' value }
instance Attr Input_ Checked (Event.Event  String ) where
  attr Checked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "checked", value: prop' value }

instance Attr everything Checked (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Checked bothValues = unsafeAttribute $ Both (pure 
    { key: "checked", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "checked", value: unset' })
instance Attr everything Checked  Unit  where
  attr Checked _ = unsafeAttribute $ This $ pure $ { key: "checked", value: unset' }
instance Attr everything Checked (Event.Event  Unit ) where
  attr Checked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "checked", value: unset' }
