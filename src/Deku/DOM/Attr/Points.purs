module Deku.DOM.Attr.Points where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Points = Points

instance Attr Polygon_ Points (NonEmpty.NonEmpty Event.Event  String ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polygon_ Points  String  where
  attr Points value = unsafeAttribute $ This $ pure $
    { key: "points", value: prop' value }
instance Attr Polygon_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr Polyline_ Points (NonEmpty.NonEmpty Event.Event  String ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "points", value: prop' value })
instance Attr Polyline_ Points  String  where
  attr Points value = unsafeAttribute $ This $ pure $
    { key: "points", value: prop' value }
instance Attr Polyline_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "points", value: prop' value }

instance Attr everything Points (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Points bothValues = unsafeAttribute $ Both (pure 
    { key: "points", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "points", value: unset' })
instance Attr everything Points  Unit  where
  attr Points _ = unsafeAttribute $ This $ pure $ { key: "points", value: unset' }
instance Attr everything Points (Event.Event  Unit ) where
  attr Points eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "points", value: unset' }
