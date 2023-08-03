module Deku.DOM.Attr.Dy where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dy = Dy

instance Attr FeDropShadow_ Dy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dy bothValues = unsafeAttribute $ Both (pure 
    { key: "dy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dy", value: prop' value })
instance Attr FeDropShadow_ Dy  String  where
  attr Dy value = unsafeAttribute $ This $ pure $ { key: "dy", value: prop' value }
instance Attr FeDropShadow_ Dy (Event.Event  String ) where
  attr Dy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dy", value: prop' value }

instance Attr FeOffset_ Dy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dy bothValues = unsafeAttribute $ Both (pure 
    { key: "dy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dy", value: prop' value })
instance Attr FeOffset_ Dy  String  where
  attr Dy value = unsafeAttribute $ This $ pure $ { key: "dy", value: prop' value }
instance Attr FeOffset_ Dy (Event.Event  String ) where
  attr Dy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dy", value: prop' value }

instance Attr Text_ Dy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dy bothValues = unsafeAttribute $ Both (pure 
    { key: "dy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dy", value: prop' value })
instance Attr Text_ Dy  String  where
  attr Dy value = unsafeAttribute $ This $ pure $ { key: "dy", value: prop' value }
instance Attr Text_ Dy (Event.Event  String ) where
  attr Dy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dy", value: prop' value }

instance Attr Tspan_ Dy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dy bothValues = unsafeAttribute $ Both (pure 
    { key: "dy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dy", value: prop' value })
instance Attr Tspan_ Dy  String  where
  attr Dy value = unsafeAttribute $ This $ pure $ { key: "dy", value: prop' value }
instance Attr Tspan_ Dy (Event.Event  String ) where
  attr Dy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dy", value: prop' value }

instance Attr everything Dy (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Dy bothValues = unsafeAttribute $ Both (pure  { key: "dy", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dy", value: unset' })
instance Attr everything Dy  Unit  where
  attr Dy _ = unsafeAttribute $ This $ pure $ { key: "dy", value: unset' }
instance Attr everything Dy (Event.Event  Unit ) where
  attr Dy eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dy", value: unset' }
