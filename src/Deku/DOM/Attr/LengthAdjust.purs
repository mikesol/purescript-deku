module Deku.DOM.Attr.LengthAdjust where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LengthAdjust = LengthAdjust

instance Attr Text_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Text_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr Text_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr TextPath_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr TextPath_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr TextPath_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr Tspan_ LengthAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
instance Attr Tspan_ LengthAdjust  String  where
  attr LengthAdjust value = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: prop' value }
instance Attr Tspan_ LengthAdjust (Event.Event  String ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr everything LengthAdjust (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr LengthAdjust bothValues = unsafeAttribute $ Both (pure 
    { key: "lengthAdjust", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "lengthAdjust", value: unset' })
instance Attr everything LengthAdjust  Unit  where
  attr LengthAdjust _ = unsafeAttribute $ This $ pure $
    { key: "lengthAdjust", value: unset' }
instance Attr everything LengthAdjust (Event.Event  Unit ) where
  attr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "lengthAdjust", value: unset' }
