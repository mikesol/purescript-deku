module Deku.DOM.Attr.Cy where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cy = Cy

instance Attr Circle_ Cy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cy bothValues = unsafeAttribute $ Both (pure 
    { key: "cy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cy", value: prop' value })
instance Attr Circle_ Cy  String  where
  attr Cy value = unsafeAttribute $ This $ pure $ { key: "cy", value: prop' value }
instance Attr Circle_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cy", value: prop' value }

instance Attr Ellipse_ Cy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cy bothValues = unsafeAttribute $ Both (pure 
    { key: "cy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cy", value: prop' value })
instance Attr Ellipse_ Cy  String  where
  attr Cy value = unsafeAttribute $ This $ pure $ { key: "cy", value: prop' value }
instance Attr Ellipse_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cy", value: prop' value }

instance Attr RadialGradient_ Cy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cy bothValues = unsafeAttribute $ Both (pure 
    { key: "cy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cy", value: prop' value })
instance Attr RadialGradient_ Cy  String  where
  attr Cy value = unsafeAttribute $ This $ pure $ { key: "cy", value: prop' value }
instance Attr RadialGradient_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cy", value: prop' value }

instance Attr everything Cy (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Cy bothValues = unsafeAttribute $ Both (pure  { key: "cy", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "cy", value: unset' })
instance Attr everything Cy  Unit  where
  attr Cy _ = unsafeAttribute $ This $ pure $ { key: "cy", value: unset' }
instance Attr everything Cy (Event.Event  Unit ) where
  attr Cy eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cy", value: unset' }
