module Deku.DOM.Attr.Kind where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kind bothValues = unsafeAttribute $ Both (pure 
    { key: "kind", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kind", value: prop' value })
instance Attr Track_ Kind  String  where
  attr Kind value = unsafeAttribute $ This $ pure $
    { key: "kind", value: prop' value }
instance Attr Track_ Kind (Event.Event  String ) where
  attr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "kind", value: prop' value }

instance Attr everything Kind (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Kind bothValues = unsafeAttribute $ Both (pure  { key: "kind", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kind", value: unset' })
instance Attr everything Kind  Unit  where
  attr Kind _ = unsafeAttribute $ This $ pure $ { key: "kind", value: unset' }
instance Attr everything Kind (Event.Event  Unit ) where
  attr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "kind", value: unset' }
