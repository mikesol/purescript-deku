module Deku.DOM.Attr.Y1 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Y1 = Y1

instance Attr Line_ Y1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y1 bothValues = unsafeAttribute $ Both
    { key: "y1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y1", value: prop' value })
instance Attr Line_ Y1  String  where
  attr Y1 value = unsafeAttribute $ This $ pure $ { key: "y1", value: prop' value }
instance Attr Line_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y1", value: prop' value }

instance Attr LinearGradient_ Y1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y1 bothValues = unsafeAttribute $ Both
    { key: "y1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y1", value: prop' value })
instance Attr LinearGradient_ Y1  String  where
  attr Y1 value = unsafeAttribute $ This $ pure $ { key: "y1", value: prop' value }
instance Attr LinearGradient_ Y1 (Event.Event  String ) where
  attr Y1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y1", value: prop' value }

instance Attr everything Y1 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Y1 bothValues = unsafeAttribute $ Both { key: "y1", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "y1", value: unset' })
instance Attr everything Y1  Unit  where
  attr Y1 _ = unsafeAttribute $ This $ pure $ { key: "y1", value: unset' }
instance Attr everything Y1 (Event.Event  Unit ) where
  attr Y1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "y1", value: unset' }
