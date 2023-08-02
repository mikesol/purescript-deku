module Deku.DOM.Attr.Loop where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loop = Loop

instance Attr Audio_ Loop (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loop bothValues = unsafeAttribute $ Both
    { key: "loop", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loop", value: prop' value })
instance Attr Audio_ Loop  String  where
  attr Loop value = unsafeAttribute $ This
    { key: "loop", value: prop' value }
instance Attr Audio_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "loop", value: prop' value }

instance Attr Video_ Loop (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loop bothValues = unsafeAttribute $ Both
    { key: "loop", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loop", value: prop' value })
instance Attr Video_ Loop  String  where
  attr Loop value = unsafeAttribute $ This
    { key: "loop", value: prop' value }
instance Attr Video_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "loop", value: prop' value }

instance Attr everything Loop (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Loop bothValues = unsafeAttribute $ Both { key: "loop", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loop", value: unset' })
instance Attr everything Loop  Unit  where
  attr Loop _ = unsafeAttribute $ This { key: "loop", value: unset' }
instance Attr everything Loop (Event.Event  Unit ) where
  attr Loop eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "loop", value: unset' }
