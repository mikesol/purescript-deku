module Deku.DOM.Attr.Inputmode where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Inputmode = Inputmode

instance Attr Textarea_ Inputmode (NonEmpty.NonEmpty Event.Event  String ) where
  attr Inputmode bothValues = unsafeAttribute $ Both (pure 
    { key: "inputmode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "inputmode", value: prop' value })
instance Attr Textarea_ Inputmode  String  where
  attr Inputmode value = unsafeAttribute $ This $ pure $
    { key: "inputmode", value: prop' value }
instance Attr Textarea_ Inputmode (Event.Event  String ) where
  attr Inputmode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "inputmode", value: prop' value }

instance Attr everything Inputmode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Inputmode bothValues = unsafeAttribute $ Both (pure 
    { key: "inputmode", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "inputmode", value: unset' })
instance Attr everything Inputmode  Unit  where
  attr Inputmode _ = unsafeAttribute $ This $ pure $
    { key: "inputmode", value: unset' }
instance Attr everything Inputmode (Event.Event  Unit ) where
  attr Inputmode eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "inputmode", value: unset' }
