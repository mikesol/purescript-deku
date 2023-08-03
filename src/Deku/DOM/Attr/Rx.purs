module Deku.DOM.Attr.Rx where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rx = Rx

instance Attr Ellipse_ Rx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure 
    { key: "rx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Ellipse_ Rx  String  where
  attr Rx value = unsafeAttribute $ This $ pure $ { key: "rx", value: prop' value }
instance Attr Ellipse_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr Rect_ Rx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure 
    { key: "rx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Rect_ Rx  String  where
  attr Rx value = unsafeAttribute $ This $ pure $ { key: "rx", value: prop' value }
instance Attr Rect_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr everything Rx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure  { key: "rx", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rx", value: unset' })
instance Attr everything Rx  Unit  where
  attr Rx _ = unsafeAttribute $ This $ pure $ { key: "rx", value: unset' }
instance Attr everything Rx (Event.Event  Unit ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rx", value: unset' }
