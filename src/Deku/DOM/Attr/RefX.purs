module Deku.DOM.Attr.RefX where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefX = RefX

instance Attr Marker_ RefX (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure 
    { key: "refX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Marker_ RefX  String  where
  attr RefX value = unsafeAttribute $ This $ pure $
    { key: "refX", value: prop' value }
instance Attr Marker_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr Symbol_ RefX (NonEmpty.NonEmpty Event.Event  String ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure 
    { key: "refX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "refX", value: prop' value })
instance Attr Symbol_ RefX  String  where
  attr RefX value = unsafeAttribute $ This $ pure $
    { key: "refX", value: prop' value }
instance Attr Symbol_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refX", value: prop' value }

instance Attr everything RefX (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RefX bothValues = unsafeAttribute $ Both (pure  { key: "refX", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "refX", value: unset' })
instance Attr everything RefX  Unit  where
  attr RefX _ = unsafeAttribute $ This $ pure $ { key: "refX", value: unset' }
instance Attr everything RefX (Event.Event  Unit ) where
  attr RefX eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "refX", value: unset' }
