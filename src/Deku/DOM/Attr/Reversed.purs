module Deku.DOM.Attr.Reversed where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Reversed = Reversed

instance Attr Ol_ Reversed (NonEmpty.NonEmpty Event.Event  String ) where
  attr Reversed bothValues = unsafeAttribute $ Both (pure 
    { key: "reversed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "reversed", value: prop' value })
instance Attr Ol_ Reversed  String  where
  attr Reversed value = unsafeAttribute $ This $ pure $
    { key: "reversed", value: prop' value }
instance Attr Ol_ Reversed (Event.Event  String ) where
  attr Reversed eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "reversed", value: prop' value }

instance Attr everything Reversed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Reversed bothValues = unsafeAttribute $ Both (pure 
    { key: "reversed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "reversed", value: unset' })
instance Attr everything Reversed  Unit  where
  attr Reversed _ = unsafeAttribute $ This $ pure $
    { key: "reversed", value: unset' }
instance Attr everything Reversed (Event.Event  Unit ) where
  attr Reversed eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "reversed", value: unset' }
