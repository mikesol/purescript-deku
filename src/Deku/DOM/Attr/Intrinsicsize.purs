module Deku.DOM.Attr.Intrinsicsize where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intrinsicsize bothValues = unsafeAttribute $ Both (pure 
    { key: "intrinsicsize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intrinsicsize", value: prop' value })
instance Attr Img_ Intrinsicsize  String  where
  attr Intrinsicsize value = unsafeAttribute $ This $ pure $
    { key: "intrinsicsize", value: prop' value }
instance Attr Img_ Intrinsicsize (Event.Event  String ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intrinsicsize", value: prop' value }

instance Attr everything Intrinsicsize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Intrinsicsize bothValues = unsafeAttribute $ Both (pure 
    { key: "intrinsicsize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "intrinsicsize", value: unset' })
instance Attr everything Intrinsicsize  Unit  where
  attr Intrinsicsize _ = unsafeAttribute $ This $ pure $
    { key: "intrinsicsize", value: unset' }
instance Attr everything Intrinsicsize (Event.Event  Unit ) where
  attr Intrinsicsize eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "intrinsicsize", value: unset' }
